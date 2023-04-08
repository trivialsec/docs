### Description

The server sent a response header `Content-Security-Policy` to inform 'supporting browsers; to ensure TLS is used even when miss-configured scripts attempt insecure connections.

A supporting browser must indicate in the client request a header of `Upgrade-Insecure-Requests` with the value `1`, e.g.

```
GET / HTTP/1.1
Host: trivialsec.com
Upgrade-Insecure-Requests: 1
```

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact to malicious clients that control the client request and avoid producing the request header (indicating it will not support the feature). This is also not going to impact a scenario where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

There are many directives that you can use with `Content-Security-Policy`. This example below allows scripts from both the current domain (defined by 'self') as well as google-analytics.com.

```
Content-Security-Policy: block-all-mixed-content
```

Or web sites with large numbers of insecure legacy URLs that need to be rewritten:

```
Content-Security-Policy: upgrade-insecure-requests
```

:warning: <span style="color: #ffca00; font-weight: 600;">Note</span>: The `upgrade-insecure-requests` directive is evaluated _before_ `block-all-mixed-content`

Alternatively the following granular examples will disallow only insecure HTTP images:

#### Enable in Nginx

```
add_header Content-Security-Policy: "img-src https:";
```

#### Enable in Apache

```
header set Content-Security-Policy "img-src https:;"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Content-Security-Policy" value="img-src https:" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
