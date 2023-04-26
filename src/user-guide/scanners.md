---
title: Scanners
summary: All the different methods available to run a scan
authors:
  - Chris Langton
date: 2023-04-07
---

# Running a Scanner

All the different methods available to run a scan

**Choose how to run the scanner**

There are many ways to run [Trivial Scanner](https://github.com/trivialsec/trivialscan); Self-hosted (CLI) or in your DevOps pipeline, Managed On-demand, Managed Monitoring, and any programmatic combination of Webhooks, HTTP API, and python lib (how we use it internally for our managed options).

## Managed Monitoring

To use the Managed Monitoring feature, users simply need to log in to their Trivial Scanner account which will navigate to the dashboard. From there, search any target and toggle switch to enable/disable Managed Monitoring for their target assets.

The Managed Monitoring feature can be customized to fit the user's specific needs; URL paths and port numbers are currently supported in the SaaS.

## Managed On-demand

To use the On Demand scanner, users simply need to log in to their Trivial Scanner account which will navigate to the dashboard. From there, search any target and click on the "Scan now" button to initiate a scan of their target.

The On Demand scanner respects Managed Monitoring customizations, even when the target is not currently enabled Managed Monitoring.

Once the scan is initiated, Trivial Scanner's automated scanning engine will begin to scan the target assets for vulnerabilities and other security issues. The user can monitor the progress of the scan with native notifications or updates provided directly within the dashboard.

After the scan is complete, Trivial Scanner generates a comprehensive report that includes details about the vulnerabilities and security issues that were discovered, as well as recommendations for remediation.

## Self-hosted (CLI)

Trivial Scanner is a Python-based vulnerability scanner that can be installed via the Python Package Index (PyPI). It can be used from the command-line interface (CLI) to perform scans of target assets for vulnerabilities and other security issues.

Here are the steps to use the CLI:

### Installation

Trivial Scanner can be installed using `pip` the package installer for Python, or the preferred `pipx` that creates an isolated environment for each package.

1. Open a terminal or command prompt and enter the following command `pipx install trivialscan`

### Configure

2. Create a configuration file before running a scan, you need to create a configuration file from the sample provided in the GitHub repo. This file specifies the target assets and other scanning parameters. You can also use the CLI to generate a barebones configuration file with the following command `trivial generate`. This will create a _yaml_ file in the current directory. You can then edit this file to specify the target assets, authentication credentials, scanning options, and other parameters.

### Authenticate

3. _Optional_: Connect the CLI to the Trivial Security Dashboard using a client credential with the following command; `trivial auth`. This will prompt you to enter the client name and a client token. To see how you can generate a client token check out [Getting Started](./getting-started.md).

Once you have created and configured the `yaml` file, you can run a scan by entering the following command; `trivial scan`.

For full argument details, custom rules, and the extensive configuration options, see the dedicated [CLI Scanner page](./scanners/cli.md).

## HTTP API

Use the API when you want to customize, integrate, and automate Trivial Security as part of your specific workflows.

## In your DevOps pipeline

## python lib
