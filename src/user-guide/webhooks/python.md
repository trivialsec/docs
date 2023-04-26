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

```py
# app.py
from fastapi import FastAPI
from routers import webhook

app = FastAPI()
app.include_router(webhook.router, prefix="/webhook")
```

```py
# routers/webhook.py
import jwt
from fastapi import Header, APIRouter, Response, status

JITTER_SECONDS = 3
ACCOUNT_NAME = "youraccountname"

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
    #
    if not authorization.startswith("Bearer "):
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    bearer_token = authorization[7:]
    if not bearer_token.strip():
        return Response(status_code=status.HTTP_403_FORBIDDEN)
    # retrieve `secret_key` securely (not clear text Env Vars exposed to anyone with read access)
    # if unsure look into SSM Parameter Stor or AWS Secrets Manager
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
    print(payload.event_name)
    print(payload.timestamp)
    print(payload.body)
```
