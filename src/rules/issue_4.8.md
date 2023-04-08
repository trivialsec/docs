### Description

The server sent a response header that prevents a document from loading any cross-origin resources that don't explicitly grant the document permission (CORS).

The default configuration when this is not sent allows the document to fetch cross-origin resources which leaves users' vulnerable to cross-site scripting (XSS) attacks.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

Set the `Cross-Origin-Resource-Policy` HTTP response header to value `same-origin`.

#### Enable in Nginx

```
add_header Cross-Origin-Resource-Policy: "same-origin";
```

#### Enable in Apache

```
header set Cross-Origin-Resource-Policy "same-origin;"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Cross-Origin-Resource-Policy" value="same-origin" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
