### Description

Websites that are maintained should not be utilising deprecated features, that commonly exhibit insecure functionality or vulnerable to abuse.

A web server can instruct web browsers to block these features so that any malicious scripts cannot leverage the API.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

Set the `Feature-Policy` HTTP response header to value `sync-script 'none'`, `sync-xhr 'none'`, and `document-domain 'none'`.
For the time being, the soon to be deprecated `Permissions-Policy` HTTP response header can still help if set to value `sync-script=()`, `sync-xhr=()`, and `document-domain=()`.

#### Enable in Nginx

```
add_header Feature-Policy "sync-script 'none'; sync-xhr 'none'; document-domain 'none'" always;
```

#### Enable in Apache

```
Header always set Feature-Policy "sync-script 'none'; sync-xhr 'none'; document-domain 'none'"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Feature-Policy" value="sync-script 'none'; sync-xhr 'none'; document-domain 'none'" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
