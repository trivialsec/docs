### Description

The server sent a response header to inform supporting browsers that the site should only be accessed using HTTPS, and that any future attempts to access it using HTTP should automatically be converted to HTTPS.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

Here is an example of what the `Strict-Transport-Security` header looks like: You can include the max age, subdomains, and preload.

```
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
```

#### Enable in Nginx

```
add_header Strict-Transport-Security "max-age=63072000; includeSubdomains; preload";
```

#### Enable in Apache

```
Header always set Strict-Transport-Security "max-age=63072000; includeSubdomains; preload"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Strict-Transport-Security" value="max-age=63072000; includeSubdomains; preload" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
