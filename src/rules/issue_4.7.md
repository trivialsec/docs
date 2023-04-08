### Description

The server sent a response header allows you to ensure a top-level document does not share a browsing context group with cross-origin documents.

COOP will process-isolate your document and potential attackers can't access your global object if they were to open it in a popup, preventing a set of cross-origin attacks dubbed XS-Leaks.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

Set the `Cross-Origin-Opener-Policy` HTTP response header to value `same-origin`.

#### Enable in Nginx

```
add_header Cross-Origin-Opener-Policy: "same-origin";
```

#### Enable in Apache

```
header set Cross-Origin-Opener-Policy "same-origin;"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Cross-Origin-Opener-Policy" value="same-origin" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
