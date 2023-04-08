---
title: Getting Started
summary: Everything you need to know about Trivial Security to get started.
authors:
  - Chris Langton
date: 2023-04-07
---

# Getting Started

Everything you need to know about Trivial Security to get started.

## Create an account

All is needed will be an arbitrary `name` that that we both can use to identify your account, use your company name or anything you like as long as it is unique we don't mind at all what you choose.

Also we will need an `email` address to send you the login Magic Link, we do not share your email with promoters or opt-in to send you marketing of any kind. The email is used fir Stripe payments if you upgrade, and any email alerts you turn on will go through Twilio Sendgrid. Check out the privacy policy for any more specific concerns.

### Video Tutorial

Check out Jorge da Silva Rodrigues' tutorial:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Dpn4HuBgaCY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

This tutorial will show you how a new customer will perform an account registration to access the free community edition.

## Account security

Initially we use a Passwordless approach called "magic Link" instead of exploitable usernames and passwords. A magic link is emailed to your inbox whenever you want to log into a new device, or re-login using a previous device that you had logged out from.

Once you're logged in you may then add a second factor for Authentication (MFA) that includes Universal second factor (U2F) like a Yubikey, a biometric (like facial recognition or fingerprint) using the browsers Webauthn technology, or a PassKey (requires an Android or iPhone with screen lock enabled).

### Video Tutorial

Check out Jorge da Silva Rodrigues' tutorial:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/XEclEYXC8E0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

This tutorial will show you how an existing customer will perform PassKey enrolment and to login to their account with a PassKey instead of using Magic Links emailed to them.

## Host Monitoring & Reports

Monitor a host (or run a scan locally) to identify trivial issues.

Then check out the results of a scan and take action based on the details of the issues found.

### Video Tutorial

Check out Jorge da Silva Rodrigues' tutorial:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/1yImlOIdT2o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

This tutorial will show you how to take full advantage of the free community edition by monitoring hosts and performing on-demand scanning.
Also a client credential is used for the CLI if you wish for it to upload results to your account (otherwise CLI is local-only by default)

## Permanently Delete Account Data

When we say we permanently delete all your account data, we really mean it. It cannot be restored from backup, they're scheduled (very quick) for deletion as soon as you confirm the deletion request.

We actually want to save data storage on our server if our customers (past or present) aren't going to be getting any value from it.

### Video Tutorial

Check out Jorge da Silva Rodrigues' tutorial:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/CFgkDI4DdII" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

This tutorial will show you how an existing logged in customer will perform an account and all data permanent deletion.
