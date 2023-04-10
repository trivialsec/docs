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

TrivialScan can be installed using `pip` the package installer for Python, or the preferred `pipx` that creates an isolated environment for each package.

1. Open a terminal or command prompt and enter the following command `pipx install trivialscan`

### Configure

2. Create a configuration file before running a scan, you need to create a configuration file from the sample provided in the GitHub repo. This file specifies the target assets and other scanning parameters. You can also use the CLI to generate a barebones configuration file with the following command `trivial generate`. This will create a _yaml_ file in the current directory. You can then edit this file to specify the target assets, authentication credentials, scanning options, and other parameters.

### Authenticate

3. _Optional_: Connect the CLI to the Trivial Security Dashboard using a client credential with the following command; `trivial auth`. This will prompt you to enter the client name and a client token. To see how you can generate a client token check out [Getting Started](./getting-started.md).

Once you have created and configured the `yaml` file, you can run a scan by entering the following command; `trivial scan`.

For full argument details, custom rules, and the extensive configuration options, see the dedicated [CLI Scanner page](./scanners/cli.md).

## Webhooks

Webhooks are a way for TrivialScan to notify other systems about scan events and results. When an event occurs, such as a scan completion or new finding, TrivialScan can send a HTTP POST request to a pre-configured URL (webhook). This can trigger actions such as creating a ticket in a help desk system or sending a notification to a team's chat channel.

Here are the steps to use webhooks:

1. **Configure the webhook:** To configure a webhook, you need to specify the URL that Trivial Security should send the HTTP POST request to when an event occurs. This can be done in the Dashboard under the Account Settings.
2. **Securely store the secret key:** To ensure that the webhook requests are coming from Trivial Security and not an attacker, you should perform signature verification. This involves adding a client token (secret key) to your application and using it to sign each webhook request. To see how you can generate a client token check out [Getting Started](./getting-started.md).
3. **Handle the webhook request:** When a webhook is triggered, Trivial Security sends a HTTP POST request to the configured URL with a JSON payload containing details about the event. The receiving system must be configured to handle these requests and parse the JSON payload. The application must also verify the signature using the client token (secret key). The signature is sent in the `Authorization` HTTP header, in the `mac` claim. The algorithm is always **SHA512** regardless what has been specified in the `alg` claim (if it is not SHA512 assume there was a malicious actor in the middle and the payload is compromised).

For full implementation details see the dedicated [webhooks page](./webhooks.md).

## HTTP API

Use the API when you want to customize, integrate, and automate Trivial Security as part of your specific workflows.

## In your DevOps pipeline

## python lib
