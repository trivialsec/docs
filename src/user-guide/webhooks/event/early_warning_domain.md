---
title: Webhook Source early_warning_domain
summary: Early Warning Service webhook alerts for customer domains
authors:
  - Chris Langton
date: 2023-04-26
---

# Webhook Source early_warning_domain

Early Warning Service webhook alerts for customer domains

## Payload example

```json
{
  "body": {
    "event_id": "8a9a6e4e-f4cd-4080-8a44-9279a388268d",
    "event_name": "early_warning_domain",
    "timestamp": "2023-04-26T02:46:35.011689+00:00",
    "payload": {
      "description": "Talos' IP and Domain Data Center is the world's most comprehensive real-time threat detection network. The data is made up of daily security intelligence across millions of deployed web, email, firewall and IPS appliances. Talos detects and correlates threats in real time using the largest threat detection network in the world spanning web requests, emails, malware samples, open-source data sets, endpoint intelligence, and network intrusions.",
      "summary": "Spam or Malware origin",
      "abuse": "https://www.talosintelligence.com/reputation_center/sender_ip",
      "asn": null,
      "asn_text": null,
      "first_seen": "2023-04-17T05:14:09+00:00",
      "last_seen": "2023-04-17T05:14:09+00:00",
      "ip_address": "18.64.37.72",
      "domain_name": "dev.langton.cloud",
      "reference_url": "https://www.talosintelligence.com/reputation_center/lookup?search=18.64.37.72",
      "id": "9c9f2055-5087-58ed-a04e-d069b6ca03e0",
      "account_name": "stof",
      "source": "Trivial Scanner",
      "source_data": {
        "hostname": "dev.langton.cloud",
        "cli_version": "0.5.16",
        "report_id": "DQBJLK0ata-KXqv543eN0WedgzYMxN7vH_GiVWWnsKU",
        "report_date": "2023-04-04T14:59:46+00:00"
      },
      "date": "2023-04-04T15:01:08+00:00",
      "emailed_to": "chris@trivialsec.com"
    }
  }
}
```

## Schema

### `body.event_id`

A `UUID` universally unique identifier corresponding to the entire webhook payload. This `event_id` is used internally as a primary key and customers should include it in any issue or bug report relating to Webhooks.

### `body.event_name`

A category identifier corresponding the the entire webhook payload. Used internally for schema validation and checking is the customer account has enabled any Endpoint URL for sending webhook events of this category to.

### `body.timestamp`

The [ISO8601 formatted date](https://docs.python.org/3/library/datetime.html#datetime.datetime.isoformat) represented in `YYYY-MM-DDTHH:MM:SS.ffffff+HH:MM[:SS[.ffffff]]` for the exact moment a match to the customer data was confirmed, and the webhook payload started to be constructed and delivered.

### `body.payload.id`

A `UUID` universally unique identifier corresponding to the matched record. This `id` is used internally as a primary key and customers should include it in any issue or bug report relating to the Early Warning Service.

### `body.payload.date`

The [ISO8601 formatted date](https://docs.python.org/3/library/datetime.html#datetime.datetime.isoformat) represented in `YYYY-MM-DDTHH:MM:SS.ffffff+HH:MM[:SS[.ffffff]]` for the webhook payload delivery to a customer endpoint. These use a HTTP protocol `POST` method but do not wait for a customer endpoint response, they essentially _beacon_ the payload to the customer endpoint and nothing about the customer endpoint is possible to be logged. The only method for debugging is looking at your own customer logs for this endpoint correlated to this `payload.date` value in your logs.

### `body.payload.account_name`

The customer account that is registered with Trivial Security, it is not a display name but rather the globally unique human readable representation of the display name chosen by the customer.

### `body.payload.summary`

A very short description of the Early Warning Service finding, used for email subject lines and the user interface for the Trivial Security dashboard.

### `body.payload.description`

A full description of the Early Warning Service finding, used for an email body to describe what we know about this kind of Threat Intelligence data source, and what it means for the owner of the matched domain name effected.

### `body.payload.abuse`

Threat Intelligence data sources can offer some customer service or a way for victims to report additional information related to false positives. When your infrastructure appears in these Threat Intelligence data sources it is common an indication that your infrastructure has been compromised.

We encourage our customers to investigate further as though this is an assumed breach scenario and only utilise the _abuse_ options once you have confirmed the security of your assets, as many of these Threat Intelligence sources are free or volunteer an may not have the bandwidth to assist or do that investigation of false positive for your assets.

### `body.payload.first_seen`

This represents a date for which the Threat Intelligence data source states they observed a threat relating to this domain name.

In some cases when the methodology used to detect threats is a honeypot or similar, the `first_seen` could be the exact timestamp of a log when the malicious activity coming from the domain name occurred.

The Threat Intelligence publisher may also have other means to report this `first_seen` date, but if they don't provide one at all the `first_seen` date is when Trivial Security first processed the data source from a Threat Intelligence publisher and may not be correlated to any activity logs for the domain name that customers may have.

### `body.payload.last_seen`

The `last_seen` date is when Trivial Security processed the data source from a Threat Intelligence publisher corresponding to the Webhook event. As many millions of these are processed daily and we utilise a FIFO queueing system, this date is more reliable than the `body.payload.date` that is closer to the webhook payload delivery time. i.e. `last_seen` is more reliable for correlation to any similar threat intelligence for the domain name that customers may have.

### `body.payload.reference_url`

In many cases, particularly with non-commercially provided Threat Intelligence feeds published by larger commercial entities, there will be a website for you to visit and learn more about the indicator of compromise for this domain name and malicious activity.

### `body.payload.emailed_to`

The webhook payload may also indicate that an email has been queued for delivery, the recipient of the email will be indicated but this is not a confirmation the email was delivered.

### `body.payload.asn`

An Autonomous System Number (ASN) is often recorded by the Threat Intelligence publisher at the time malicious activity is recorded because an IP Address (corresponding to the domain name DNS record) can belong to an ASN at one time and later belong to another ASN during an investigation.

Not all Threat Intelligence data sources will provide the ASN, but it can be a valuable investigation data point if an intrusion is later identified and the ASN that they routed from can not be determined.

### `body.payload.asn_text`

A human readable non-authoritative description of the Autonomous System Number (ASN), if one was recorded.

### `body.payload.ip_address`

The IPv4 or IPv6 address or CIDR that was present with the Threat Intelligence data for the domain name in question.

If no IP was sent from the Threat Intelligence source, this property is empty.

### `body.payload.domain_name`

The indicator of compromise present in the Threat Intelligence data source that Trivial Security used to correlate with our customer data to identify effected domain names that are present in our scanner reports.

### `body.payload.source`

The source specifies a Trivial Security feature which observed the domain name, e.g. `Trivial Scanner` indicates our web scanning capability and `Subdomain Scanner` indicates and internal workload that runs daily for each apex domain name from Trivial Scanner reports. Many similar workloads are added, changed, or removed (particularly internal), as well as many APIs or OSINT utilised, so this property offer customers transparency of Trivial Security sources and methods.

### `body.payload.source_data.hostname`

For this event category the `payload.source_data.hostname` always matches the `payload.domain_name`.

### `body.payload.source_data.report_id`

All customer domain names Trivial Security scans or observes are linked to the internal `report_id` relating to saved data. This `report_id` is used internally as a primary key and customers should include it in any issue or bug report relating to the Early Warning Service.

### `body.payload.source_data.report_date`

This date corresponds to the `report_id`, and is useful for deep linking to domain pages at a specific version related to the report. i.e. if the `report_date` was `2023-04-04T14:59:46+00:00` and target `dev.langton.cloud:443` the deep link is `https://www.trivialsec.com/hostname/dev.langton.cloud/443/20230404`

### `body.payload.source_data.cli_version`

This version corresponds to the `report_id` to indicate the CLI version that ran to produce the report data.
