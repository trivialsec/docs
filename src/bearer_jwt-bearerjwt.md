# Bearer JWT

Author: [Chris Langton](https://github.com/0x73746F66)

## Overview

Trivial Security Open API relies on it's Bearer JWT with a symmetric signature that is exposed to the Dashboard front-end for it's cookie-free web session

See more: <https://docs.trivialsec.com>

![Diagram](bearer_jwt-bearerjwtmagiclink.png "Diagram")

![Diagram](bearer_jwt-bearerjwtauthn.png "Diagram")

|                 |        |
| --------------- | ------ |
| Internet Facing | ✅     |
| New Initiative  | ✅     |
| Initiative Size | Medium |

## Use Cases

- Protect customer data

## Exclusions

- registration

## Information Assets

### Customer data [Confidential]

Customer data is stored in S3 and available via the OpenAPI

### Credential Store [Confidential]

DynamoDB stores a per-session symmetric key for JWT signing and validation

## Threat Scenarios

### Threat

Stolen token used on attacker controlled device or tools

> Impact Type: Integrity

> STRIDE: Spoofing

Impacted Information Assets:

- Customer data

#### Controls

##### Stolen access tokens

> Implemented: ✅

Access tokens should not be able to be used on any other device than the fingerprinted device at time of Authn

_Implementation Notes_

kid is a sha224 that incorporates end-user fingerprinting and internal primary key

|                |        |
| -------------- | ------ |
| Risk Reduction | 50     |
| HashAlgo       | sha224 |

##### Asymmetric signature with Certificate based public key exchange

> Implemented: ❌

This is theoretically a stronger Bearer JWT implementation and may provide stronger assurance

|     |     |
| --- | --- |

### Threat

Stolen token is used on another client/browser

> Impact Type: Integrity

> STRIDE: Spoofing

Impacted Information Assets:

- Customer data

#### Controls

##### Access token reuse

> Implemented: ✅

Access tokens should not be able to be used outside the context of the client/browser fingerprinted at time of Authn

_Implementation Notes_

kid is a sha224 that incorporates client fingerprinting and internal primary key

|                |        |
| -------------- | ------ |
| Risk Reduction | 50     |
| HashAlgo       | sha224 |

##### Retrieve browser fingerprint via websocket

> Implemented: ❌

Theoretically an asynchronous socket can gather a wide range of browser identifiers to be incorporated in a fingerprint for the session during Authn

|     |     |
| --- | --- |

### Threat

Token tampering (via XSS/CSRF)

> Impact Type: Confidentiality,

> STRIDE: Tampering

Impacted Information Assets:

- Customer data

#### Controls

##### Access token reuse

> Implemented: ✅

The server-side should reject the token if any claim or header was changed by the client

_Implementation Notes_

symmetric key for signature validation never leaves the context of the server, all tokens (Authorization header and cookie) are validated

|                |       |
| -------------- | ----- |
| Risk Reduction | 50    |
| SignatureAlgo  | HS256 |

##### Non-repudiation

> Implemented: ❌

Log all Authentication attempts, include all possible client indicators and fingerprints

|     |     |
| --- | --- |

### Threat

Signing secret exposed

> Impact Type: Confidentiality

> STRIDE: Info Disclosure, Elevation Of Privilege

Impacted Information Assets:

- Customer data
- Credential Store

#### Controls

##### Secret rotation

> Implemented: ✅

A secret should be short-lived

_Implementation Notes_

symmetric key for signature validation will rotate with each new session, last for 24h, and if revoked in the credential store the user is logged out and must re-Authn

|                |     |
| -------------- | --- |
| Risk Reduction | 50  |

##### Secret revocation

> Implemented: ✅

A secret should be revocable so the user should be required to re-Authn

_Implementation Notes_

If sessions are revoked in the credential store, or by the user in the Security page, the user is logged out and must re-Authn

|                |     |
| -------------- | --- |
| Risk Reduction | 50  |

##### Forced re-Authn

> Implemented: ❌

Instead of users being logged out and redirected to the homepage, an re-Authentication UX should be shown

|     |     |
| --- | --- |

## Third Party Dependencies

### AWS DynamoDB

DynamoDB stores member session data and FIDO/PassKey configuration

AWS DynamoDB is a SaaS product that we (the company) pays for.

AWS DynamoDB is an infrastructure product.

> Uptime Classification: HARD

This dependency is tightly coupled to most usage of the product and could potentially create a large or total outage.
If this dependency goes down users can't login

---

Created: 2023-04-20 - Updated: 2023-04-20
