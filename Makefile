SHELL := /bin/bash
.PHONY: help
primary := '\033[1;36m'
bold := '\033[1m'
clear := '\033[0m'

-include .env
export $(shell sed 's/=.*//' .env 2>/dev/null)
ifndef CI_BUILD_REF
CI_BUILD_REF=local
endif

ifeq ($(CI_BUILD_REF), local)
-include .env.local
export $(shell sed 's/=.*//' .env.local 2>/dev/null)
endif

ifndef RUNNER_NAME
RUNNER_NAME=$(shell basename $(shell pwd))
endif

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

hcltminstall:
	wget -qO- https://github.com/xntrik/hcltm/releases/download/v0.1.6/hcltm-linux-amd64.tar.gz | tar xvz -C /usr/local/bin/hcltm

deps: ## install dependancies for development of this project; assumes `python3 -m venv .venv && source .venv/bin/activate`
	pip install -U pip
	pip install -U setuptools wheel
	pip install -U -r requirements.txt
	terraform -chdir=plans -install-autocomplete || true
	pre-commit install --hook-type pre-push --hook-type pre-commit
	@ [ -f .secrets.baseline ] || ( detect-secrets scan > .secrets.baseline )
	detect-secrets audit .secrets.baseline

ci-deps: ## install dependancies for CI
	pip install -U pip
	pip install -U setuptools wheel
	pip install -U -r requirements.txt
	pre-commit autoupdate
 git add .pre-commit-config.yaml

clean: ## Cleanup tmp files
	@find . -type f -name '*.DS_Store' -delete 2>/dev/null
	@rm -f **/*.zip **/*.tar **/*.tgz **/*.gz

output:
	@echo -e $(bold)$(primary)cloudfront$(clear) $(shell terraform -chdir=plans output cloudfront_user_docs)
	@echo -e $(bold)$(primary)bucket$(clear) $(shell terraform -chdir=plans output user_docs_bucket)

env:
	@echo -e $(bold)$(primary)CI_BUILD_REF$(clear) = $(CI_BUILD_REF)
	@echo -e $(bold)$(primary)APP_ENV$(clear) = $(APP_ENV)

init: ## Runs tf init tf
	@echo -e $(bold)$(primary)APP_ENV$(clear) = $(APP_ENV)
	terraform -chdir=plans init -backend-config=${APP_ENV}-backend.conf -reconfigure -upgrade=true
	pre-commit validate-config

refresh: ## Runs tf refresh
	terraform -chdir=plans refresh

plan:  ## Runs tf validate and tf plan
	terraform -chdir=plans fmt
	terraform -chdir=plans validate
	terraform -chdir=plans plan -no-color -out=.tfplan
	terraform -chdir=plans show --json .tfplan | jq -r '([.resource_changes[]?.change.actions?]|flatten)|{"create":(map(select(.=="create"))|length),"update":(map(select(.=="update"))|length),"delete":(map(select(.=="delete"))|length)}' > tfplan.json

apply: ## tf apply -auto-approve -refresh=true
	terraform -chdir=plans apply -auto-approve -refresh=true .tfplan

build: ## mkdocs build
	hcltm dashboard -outdir=src -overwrite threatmodels
	@rm src/dashboard.md
	@markdownlint -q --fix src || true
	mkdocs build
	cp src/img/favicon.png dist/assets/images/favicon.png

destroy:  ## tf destroy -auto-approve
	terraform -chdir=plans validate
	terraform -chdir=plans plan -destroy -no-color -out=.tfdestroy
	terraform -chdir=plans show --json .tfdestroy | jq -r '([.resource_changes[]?.change.actions?]|flatten)|{"create":(map(select(.=="create"))|length),"update":(map(select(.=="update"))|length),"delete":(map(select(.=="delete"))|length)}' > tfdestroy.json
	terraform -chdir=plans apply -auto-approve -destroy .tfdestroy

test-local:  ## Prettier test outputs
	pre-commit run --all-files
	semgrep -q --strict --timeout=0 --config=p/terraform

clear-cf:  ## AWS CloudFront cache invalidation
	aws cloudfront create-invalidation \
		--distribution-id $(shell terraform -chdir=plans output -raw cloudfront_user_docs) \
		--paths "/**/*.html" "/assets/**/*.js" "/assets/**/*.png" "/assets/**/*.css"

local-runner: ## local setup for a gitlab runner
	@docker volume create --name=gitlab-cache 2>/dev/null || true
	docker pull -q docker.io/gitlab/gitlab-runner:latest
	docker build -t $(RUNNER_NAME)/runner:${CI_BUILD_REF} -f Dockerfile .
	@echo $(shell [ -z "${RUNNER_TOKEN}" ] && echo "RUNNER_TOKEN missing" )
	@docker run -d --rm \
		--name $(RUNNER_NAME) \
		-v "gitlab-cache:/cache:rw" \
		-v "/var/run/docker.sock:/var/run/docker.sock:rw" \
		-e RUNNER_TOKEN=${RUNNER_TOKEN} \
		$(RUNNER_NAME)/runner:${CI_BUILD_REF}
	@docker exec -ti $(RUNNER_NAME) gitlab-runner register --non-interactive \
		--tag-list 'jager' \
		--name $(RUNNER_NAME) \
		--request-concurrency 10 \
		--url https://gitlab.com/ \
		--registration-token '$(RUNNER_TOKEN)' \
		--cache-dir '/cache' \
		--executor shell
