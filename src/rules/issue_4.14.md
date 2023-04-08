### Description

The Referrer-Policy HTTP header controls how much referrer information (sent with the Referrer header) should be included with requests.

This policy will leak potentially-private information from HTTPS resource URLs to insecure origins. Carefully consider the impact of this setting.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

The `Referrer-Policy` controls how much (if any) referrer information the browser should reveal to the web server.

#### Enable in Nginx

```
add_header Referrer-Policy "no-referrer" always;
```

#### Enable in Apache

```
Header always set Referrer-Policy "no-referrer"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Referrer-Policy" value="no-referrer" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
