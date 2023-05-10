---
title: Webhook Source account_activity
summary: User Account activity webhooks to capture audit related data
authors:
  - Chris Langton
date: 2023-04-26
---

# Webhook Source account_activity

User Account activity webhooks to capture audit related data

## Payload example

```json
{
  "body": {
    "event_id": "1c646797-f95f-4b17-b0b2-d8937584006f",
    "event_name": "account_activity",
    "timestamp": "2023-04-26T04:07:56.558781+00:00",
    "payload": {
      ...
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
