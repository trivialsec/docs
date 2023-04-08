### Description

Websites are not expected to read contents of the users' clipboard, which commonly contains private or sensitive information.

A web server can instruct web browsers to block this feature so that any malicious scripts cannot leverage the API.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

Set the `Feature-Policy` HTTP response header to value `clipboard-read 'none'`.
For the time being, the soon to be deprecated `Permissions-Policy` HTTP response header can still help if set to value `clipboard-read=()`

#### Enable in Nginx

```
add_header Feature-Policy "clipboard-read 'none'" always;
```

#### Enable in Apache

```
Header always set Feature-Policy "clipboard-read 'none'"
```

#### Enable on IIS

```xml
<system.webServer>
    ...
    <httpProtocol>
        <customHeaders>
            <add name="Feature-Policy" value="clipboard-read 'none'" />
        </customHeaders>
    </httpProtocol>
    ...
</system.webServer>
```
