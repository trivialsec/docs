### Description

The server sent a response header allows web site administrators to control resources the user agent is allowed to load for a given page. With a few exceptions, policies mostly involve specifying server origins and script endpoints.

This helps guard against cross-site scripting attacks cross-site scripting (XSS), among many common browser attack vectors.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

There are many directives that you can use with `Content-Security-Policy`. This example below allows scripts from both the current domain (defined by 'self') as well as google-analytics.com.

```
Content-Security-Policy: script-src 'self' https://www.google-analytics.com
```

#### Enable in Nginx

```
add_header Content-Security-Policy: "default-src 'none'; script-src 'self' https://www.google-analytics.com";
```

#### Enable in Apache

```
header set Content-Security-Policy "default-src 'none'; script-src 'self' https://www.google-analytics.com;"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Content-Security-Policy" value="default-src 'none'; script-src 'self' https://www.google-analytics.com" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
