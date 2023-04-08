### Description

The `X-Content-Type-Options` header prevents browsers from sniffing a response away from the declared Content-Type. This helps reduce the danger of drive-by downloads and helps treat the content the right way.

Essentially the server sends a response header to inform supporting browsers that the MIME types advertised in the Content-Type headers should be followed and not be changed. The header allows you to avoid MIME type sniffing by saying that the MIME types are deliberately configured.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

Here is an example of what the `Strict-Transport-Security` header looks like: You can include the max age, subdomains, and preload.

#### Enable in Nginx

```
add_header X-Content-Type-Options "nosniff" always;
```

#### Enable in Apache

```
Header always set X-Content-Type-Options "nosniff"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="X-Content-Type-Options" value="nosniff" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
