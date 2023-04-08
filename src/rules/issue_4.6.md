### Description

The server sent a response header that prevents a document from loading any cross-origin resources that don't explicitly grant the document permission (using CORP or CORS).

The default configuration when this is not sent allows the document to fetch cross-origin resources which leaves users' vulnerable to cross-site scripting (XSS) attacks.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

Set the `Cross-Origin-Embedder-Policy` HTTP response header to value `require-corp`.

#### Enable in Nginx

```
add_header Cross-Origin-Embedder-Policy: "require-corp";
```

#### Enable in Apache

```
header set Cross-Origin-Embedder-Policy "require-corp;"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Cross-Origin-Embedder-Policy" value="require-corp" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
