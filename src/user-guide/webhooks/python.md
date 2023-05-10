---
title: Python Example Webhook
summary: Trivial Security webhook endpoint usage example using Python
authors:
  - Chris Langton
date: 2023-04-26
---

# Python Example Webhook

Trivial Security webhook endpoint usage example using Python

## `pydantic` models

```py
from enum import Enum
from uuid import UUID
from datetime import datetime, timezone
from pydantic import BaseModel, validator

class WebhookEvent(str, Enum):
    HOSTED_MONITORING = "hosted_monitoring"
    HOSTED_SCANNER = "hosted_scanner"
    SELF_HOSTED_UPLOADS = "self_hosted_uploads"
    EARLY_WARNING_EMAIL = "early_warning_email"
    EARLY_WARNING_DOMAIN = "early_warning_domain"
    EARLY_WARNING_IP = "early_warning_ip"
    NEW_FINDINGS_CERTIFICATES = "new_findings_certificates"
    NEW_FINDINGS_DOMAINS = "new_findings_domains"
    CLIENT_STATUS = "client_status"
    CLIENT_ACTIVITY = "client_activity"
    SCANNER_CONFIGURATIONS = "scanner_configurations"
    REPORT_CREATED = "report_created"
    REPORT_DELETED = "report_deleted"
    ACCOUNT_ACTIVITY = "account_activity"
    MEMBER_ACTIVITY = "member_activity"

class WebhookPayload(BaseModel):
    event_id: UUID
    event_name: WebhookEvent
    timestamp: datetime
    payload: dict

    class Config:
        validate_assignment = True

    @validator("timestamp")
    def set_timestamp(cls, timestamp: datetime):
        return timestamp.replace(tzinfo=timezone.utc) if timestamp else None
```

## FastAPI

Consider the following project structure:

```
.
├── src
│   ├── app.py
│   └── routers
│       ├── __init__.py
│       └── webhook.py
└── pyproject.toml
```

A typical FastAPI `app.py`:

```py
from fastapi import FastAPI
from routers import webhook

app = FastAPI()
app.include_router(webhook.router, prefix="/webhook")
```

The contents of the `routers/webhook.py` file that handles incoming webhooks would need the following libs:

```py
import jwt
from fastapi import Header, APIRouter, Response, status
```

And the following configuration values:

```py
JITTER_SECONDS = 3
ACCOUNT_NAME = "youraccountname"
secret_key = token_service.get_some_value() # retrieve `secret_key` securely (not clear text Env Vars exposed to anyone with read access)
# if unsure look into SSM Parameter Stor or AWS Secrets Manager
```

Webhooks are sent as a POST method, includes an `Authorization` header holding the encoded JWT, and payload can be conveniently instantiated as a `pydantic` model:

```py
router = APIRouter()

@router.post(
    "/trivialsec",
    status_code=status.HTTP_200_OK,
)
async def webhook_trivialsec(
    payload: WebhookPayload,
    authorization: str = Header(alias="Authorization", title="Bearer JWT", default="")
):
    """
    Handle Trivial Security webhook events
    """
```

A sanity check, make sure the `Authorization` header contains a bearer token:

```py
if not authorization.startswith("Bearer "):
    return Response(status_code=status.HTTP_403_FORBIDDEN)
```

Extract the encoded string from the header value:

```py
bearer_token = authorization[7:]
if not bearer_token.strip():
    return Response(status_code=status.HTTP_403_FORBIDDEN)
```

Using the `jwt` library **verify** the signature with the improperly named `decode` method.
By default the `encode` method will not **verify** the expiry, or any of the other relevant claims.. it merely ensures the signature is _well formed_ given the symmetric key provided. You must include your intention that expiry and other claims are to be _required_ to be verified also.

To verify claims like `aud` and `iss` are of a specific value you must also provide these permitted values with attributes `audience` and `issuer`, without supplying these values all this library will do is check their existence and not verify the value, if you configure it to requires these claims.

```py
try:
    decoded = jwt.decode(
        jwt=bearer_token,
        key=secret_key,
        options={"require": ["iat", "nbf", "exp", "aud", "iss", "sub"]},
        leeway=JITTER_SECONDS,
        audience=f"urn:trivialsec:webhook:client_endpoint:{ACCOUNT_NAME}",
        issuer="https://www.trivialsec.com",
        algorithms=["HS256"],
    )
except jwt.InvalidSignatureError:
    return Response(status_code=status.HTTP_403_FORBIDDEN)
except jwt.ExpiredSignatureError:
    return Response(status_code=status.HTTP_403_FORBIDDEN)
```

Signature is verified! Now validate the remaining claims.

Unfortunately the library will only verify existence of the `sub` claim, unlike the others there is no way to verify the value during the `decode` so we must do our own validation:

```py
if decoded.get('sub') != 'urn:uuid:bc6e2cd5-1f59-487f-b05b-49946bd078b2':
    return Response(status_code=status.HTTP_403_FORBIDDEN)
```

Similarly our custom claim `eid` was signed (the symmetric key assures that this claim has not been modified or tampered with), so if we validate the signed value matches the payload, we may trust the `event_id` for sensitive actions:

```py
if decoded.get('eid') != payload.event_id.urn:
    return Response(status_code=status.HTTP_403_FORBIDDEN)
```

Validated! You may trust this `event_id` to make verifiable secure operations, using it with the API with TLS you can obtain more data with integrity assurances of its correctness.

```py
print(payload.event_name)
print(payload.timestamp)
print(payload.body)
```

Putting it all together:

```py
@router.post(
    "/trivialsec",
    status_code=status.HTTP_200_OK,
)
async def webhook_trivialsec(
    payload: WebhookPayload,
    authorization: str = Header(alias="Authorization", title="Bearer JWT", default="")
):
    """
    Handle Trivial Security webhook events
    """
    if not authorization.startswith("Bearer "):
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    bearer_token = authorization[7:]
    if not bearer_token.strip():
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    try:
        # verify symmetric signature and validate the required claims
        decoded = jwt.decode(
            jwt=bearer_token,
            key=secret_key,
            options={"require": ["iat", "nbf", "exp", "aud", "iss", "sub"]},
            leeway=JITTER_SECONDS,
            audience=f"urn:trivialsec:webhook:client_endpoint:{ACCOUNT_NAME}",
            issuer="https://www.trivialsec.com",
            algorithms=["HS256"],
        )
    except jwt.InvalidSignatureError:
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    except jwt.ExpiredSignatureError:
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    # Signature is verified! Now validate the remaining claims
    # Validate `sub` claim matches the Trivial Security allocated subject for webhook payloads
    if decoded.get('sub') != 'urn:uuid:bc6e2cd5-1f59-487f-b05b-49946bd078b2':
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    # Validate `eid` claim matches the `event_id` for this webhook payload
    if decoded.get('eid') != payload.event_id.urn:
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    # Validated! You may trust this event_id to make verifiable secure operations
```
