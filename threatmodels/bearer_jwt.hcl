spec_version = "0.1.6"

threatmodel "Bearer JWT" {
  description  = "Trivial Security Open API relies on it's Bearer JWT with a symmetric signature that is exposed to the Dashboard front-end for it's cookie-free web session"
  link         = "https://docs.trivialsec.com"
  author       = "[Chris Langton](https://github.com/0x73746F66)"
  created_at   = 1681972360
  updated_at   = 1681972360

  attributes {
    new_initiative  = true
    internet_facing = true
    initiative_size = "Medium"
  }

  information_asset "Customer data" {
    description                = "Customer data is stored in S3 and available via the OpenAPI"
    information_classification = "Confidential"
  }

  information_asset "Credential Store" {
    description = "DynamoDB stores a per-session symmetric key for JWT signing and validation"
    information_classification = "Confidential"
  }

  third_party_dependency "AWS DynamoDB" {
    description = "DynamoDB stores member session data and FIDO/PassKey configuration"
    saas = "true"
    open_source = "false"
    paying_customer = "true"
    infrastructure = "true"
    //  must be one of "none", "degraded", "hard", "operational"
    uptime_dependency = "hard"
    uptime_notes = "If this dependency goes down users can't login"
  }

  threat {
    description = "Stolen token used on attacker controlled device or tools"
    impacts                = ["Integrity"]
    stride                 = ["Spoofing"]
    information_asset_refs = ["Customer data"]

    expanded_control "Stolen access tokens" {
      description = "Access tokens should not be able to be used on any other device than the fingerprinted device at time of Authn"
      implemented = true
      implementation_notes = "kid is a sha224 that incorporates end-user fingerprinting and internal primary key"
      risk_reduction = 50
      attribute "HashAlgo" {
        value = "sha224"
      }
    }

    expanded_control "Asymmetric signature with Certificate based public key exchange" {
      description = "This is theoretically a stronger Bearer JWT implementation and may provide stronger assurance"
      implemented = false
    }
  }
  threat {
    description            = "Stolen token is used on another client/browser"
    impacts                = ["Integrity"]
    stride                 = ["Spoofing"]
    information_asset_refs = ["Customer data"]

    expanded_control "Access token reuse" {
      description = "Access tokens should not be able to be used outside the context of the client/browser fingerprinted at time of Authn"
      implemented = true
      implementation_notes = "kid is a sha224 that incorporates client fingerprinting and internal primary key"
      risk_reduction = 50
      attribute "HashAlgo" {
        value = "sha224"
      }
    }

    expanded_control "Retrieve browser fingerprint via websocket" {
      description = "Theoretically an asynchronous socket can gather a wide range of browser identifiers to be incorporated in a fingerprint for the session during Authn"
      implemented = false
    }
  }
  threat {
    description            = "Token tampering (via XSS/CSRF)"
    impacts                = ["Confidentiality", "Repudiation"]
    stride                 = ["Tampering"]
    information_asset_refs = ["Customer data"]

    expanded_control "Access token reuse" {
      description = "The server-side should reject the token if any claim or header was changed by the client"
      implemented = true
      implementation_notes = "symmetric key for signature validation never leaves the context of the server, all tokens (Authorization header and cookie) are validated"
      risk_reduction = 50
      attribute "SignatureAlgo" {
        value = "HS256"
      }
    }

    expanded_control "Non-repudiation" {
      description = "Log all Authentication attempts, include all possible client indicators and fingerprints"
      implemented = false
    }
  }
  threat {
    description            = "Signing secret exposed"
    impacts                = ["Confidentiality"]
    stride                 = ["Info Disclosure", "Elevation Of Privilege"]
    information_asset_refs = ["Customer data", "Credential Store"]

    expanded_control "Secret rotation" {
      description = "A secret should be short-lived"
      implemented = true
      implementation_notes = "symmetric key for signature validation will rotate with each new session, last for 24h, and if revoked in the credential store the user is logged out and must re-Authn"
      risk_reduction = 50
    }

    expanded_control "Secret revocation" {
      description = "A secret should be revocable so the user should be required to re-Authn"
      implemented = true
      implementation_notes = "If sessions are revoked in the credential store, or by the user in the Security page, the user is logged out and must re-Authn"
      risk_reduction = 50
    }

    expanded_control "Forced re-Authn" {
      description = "Instead of users being logged out and redirected to the homepage, an re-Authentication UX should be shown"
      implemented = false
    }
  }

  usecase {
    description = "Protect customer data"
  }

  exclusion {
    description = "registration"
  }


  data_flow_diagram_v2 "Magic Link" {
    process "OpenAPI" {
      trust_zone = "secure zone"
    }
    process "Send magic link" {}
    data_store "dynamodb" {
      trust_zone = "secure zone"
      information_asset = "Credential Store"
    }
    data_store "ssm_parameter_store" {
      trust_zone = "secure zone"
      information_asset = "Customer data"
    }

    external_element "sendgrid" {
      trust_zone = "public zone"
    }
    external_element "Anonymous user" {
      trust_zone = "public zone"
    }

    flow "Request magic link" {
      from = "Anonymous user"
      to = "OpenAPI"
    }
    flow "Persist magic link request" {
      from = "OpenAPI"
      to = "dynamodb"
    }

    flow "Obtain email provider credentials" {
      from = "OpenAPI"
      to = "ssm_parameter_store"
    }

    flow "Authenticate with email provider" {
      from = "OpenAPI"
      to = "Send magic link"
    }

    flow "https" {
      from = "Send magic link"
      to = "sendgrid"
    }

    flow "smtp" {
      from = "sendgrid"
      to = "Anonymous user"
    }
  }

  data_flow_diagram_v2 "Authn" {
    process "OpenAPI" {
      trust_zone = "secure zone"
    }
    process "Client Browser" {
      trust_zone = "public zone"
    }
    process "Sign JWT" {
      trust_zone = "secure zone"
    }

    data_store "dynamodb" {
      trust_zone = "secure zone"
      information_asset = "Credential Store"
    }
    data_store "s3" {
      trust_zone = "secure zone"
      information_asset = "Customer data"
    }

    external_element "Anonymous user" {
      trust_zone = "public zone"
    }

    flow "Click magic link" {
      from = "Anonymous user"
      to = "OpenAPI"
    }

    flow "Check for MFA" {
      from = "OpenAPI"
      to = "dynamodb"
    }

    flow "Prompt MFA" {
      from = "OpenAPI"
      to = "Anonymous user"
    }

    flow "Lookup member" {
      from = "OpenAPI"
      to = "s3"
    }

    flow "Generate symmetric key" {
      from = "OpenAPI"
      to = "Sign JWT"
    }

    flow "tcp" {
      from = "Sign JWT"
      to = "Client Browser"
    }

    flow "Make requests using the Bearer token" {
      from = "Client Browser"
      to = "OpenAPI"
    }
  }

}
