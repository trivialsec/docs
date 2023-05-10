---
title: Getting Started with Webhooks
summary: Everything you need to know about Webhooks to get started.
authors:
  - Chris Langton
date: 2023-04-26
---

# Getting Started with Webhooks

Webhooks are a way for Trivial Scanner to notify other systems about scan events and results. When an event occurs, such as a scan completion or new finding.

Trivial Scanner can send a HTTP POST request to a pre-configured URL (webhook). This can trigger actions such as creating a ticket in a help desk system or sending a notification to a team's chat channel.

Here are the steps to use webhooks:

1. **Configure the webhook:** To configure a webhook, you need to specify the URL that Trivial Security should send the HTTP POST request to when an event occurs. This can be done in the Dashboard under the Account Settings.

2. **Securely store the secret key:** To ensure that the webhook requests are coming from Trivial Security and not an attacker, you should perform signature verification. This involves adding a client token (secret key) to your application and using it to sign each webhook request. To see how you can generate a client token check out [Getting Started](./getting-started.md).

3. **Handle the webhook request:** When a webhook is triggered, Trivial Security sends a HTTP POST request to the configured URL with a JSON payload containing details about the event.

The receiving system must be configured to handle these requests and parse the JSON payload. See [Go Example](golang.md), [Python Example](python.md), or [Node.js Example](nodejs.md) (more to come).

The application must also verify the signature using the client token (secret key). The signature is sent in the `Authorization` HTTP header, represented as a JWT (JSON Web Token) in base64 encoding. The algorithm is always **HS256** regardless what has been specified in the claims data (if it is not `HS256` assume there was a malicious actor in the middle and the payload is compromised).
