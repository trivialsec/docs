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

ifeq ($(NODE_ENV), development)
-include .env.development
export $(shell sed 's/=.*//' .env.development 2>/dev/null)
ifeq ($(CI_BUILD_REF), local)
-include .env.development.local
export $(shell sed 's/=.*//' .env.development.local 2>/dev/null)
endif
endif

ifeq ($(NODE_ENV), production)
-include .env.production
export $(shell sed 's/=.*//' .env.production 2>/dev/null)
ifeq ($(CI_BUILD_REF), local)
-include .env.production.local
export $(shell sed 's/=.*//' .env.production.local 2>/dev/null)
endif
endif

ifndef RUNNER_NAME
RUNNER_NAME=$(shell basename $(shell pwd))
endif

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

deps: ## install dependancies for development of this project
	python3 -m venv .venv
	source .venv/bin/activate
	pip install -U pip
	pip install -U setuptools wheel
	pip install -U -r requirements-dev.txt
	nvm install --lts
	npm i
	terraform -chdir=plans -install-autocomplete || true
	pre-commit install --hook-type pre-push --hook-type pre-commit
	@ [ -f .secrets.baseline ] || ( detect-secrets scan > .secrets.baseline )
	detect-secrets audit .secrets.baseline

clean: ## Cleanup tmp files
	@find . -type f -name '*.DS_Store' -delete 2>/dev/null
	@rm -f **/*.zip **/*.tar **/*.tgz **/*.gz

output:
	@echo -e $(bold)$(primary)cloudfront$(clear) $(shell terraform -chdir=plans output cloudfront_trivialscan_dashboard)
	@echo -e $(bold)$(primary)bucket$(clear) $(shell terraform -chdir=plans output trivialscan_dashboard_bucket)

env:
	@echo -e $(bold)$(primary)CI_BUILD_REF$(clear) = $(CI_BUILD_REF)
	@echo -e $(bold)$(primary)APP_ENV$(clear) = $(APP_ENV)

init: ## Runs tf init tf
	@echo -e $(bold)$(primary)APP_ENV$(clear) = $(APP_ENV)
	terraform -chdir=plans init -backend-config=${APP_ENV}-backend.conf -reconfigure -upgrade=true

refresh: ## Runs tf refresh
	terraform -chdir=plans refresh

plan:  ## Runs tf validate and tf plan
	terraform -chdir=plans validate
	terraform -chdir=plans plan -no-color -out=.tfplan
	terraform -chdir=plans show --json .tfplan | jq -r '([.resource_changes[]?.change.actions?]|flatten)|{"create":(map(select(.=="create"))|length),"update":(map(select(.=="update"))|length),"delete":(map(select(.=="delete"))|length)}' > tfplan.json

apply: ## tf apply -auto-approve -refresh=true
	terraform -chdir=plans apply -auto-approve -refresh=true .tfplan

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
		--distribution-id $(shell terraform -chdir=plans output -raw cloudfront_trivialscan_dashboard) \
		--paths "/favicon.png" "/index.html" "/robots.txt" "/.well-known/*" "/manifest.json" "/assets/*.js" "/assets/*.ttf" "/assets/*.map" "/assets/*.svg" "/assets/*.png" "/assets/*.css"

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
