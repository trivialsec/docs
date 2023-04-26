---
title: Webhook Source report_deleted
summary: A webhook event for confirming deletion any scanner report that was stored (now permanently deleted) in Trivial Security cloud storage
authors:
  - Chris Langton
date: 2023-04-26
---

# Webhook Source report_deleted

A webhook event for confirming deletion any scanner report that was stored (now permanently deleted) in Trivial Security cloud storage

## Payload example

```json
{
  "body": {
    "event_id": "1c646797-f95f-4b17-b0b2-d8937584006f",
    "event_name": "report_deleted",
    "timestamp": "2023-04-26T04:07:56.558781+00:00",
    "payload": {
      "report_id": "QIP5jDGQvFRkGWeDMcmjaxbTfFa-b_gIrvtrSyJkKtc",
      "timestamp": 1682482076559,
      "account": "stof",
      "member": "chris@trivialsec.com",
      "ip_addr": null,
      "user_agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"
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

### `body.payload.report_id`

The report internal primary identifier that was deleted by the member

### `body.payload.timestamp`

The UNIX timestamp for when the report was deleted by the member

### `body.payload.account`

The customer account that is registered with Trivial Security, it is not a display name but rather the globally unique human readable representation of the display name chosen by the customer.

### `body.payload.member`

The login email address of the registered Trivial Security user that performed the report deletion

### `body.payload.ip_addr`

The IP Address observed at the time the member performed the report deletion

### `body.payload.user_agent`

The User-Agent HTTP header observed at the time the member performed the report deletion
