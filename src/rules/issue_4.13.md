### Description

A web server can instruct web browsers to allow list on the features the site owner intends to utilise, blocking all unused features so that any malicious scripts cannot leverage the unused features or API.

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span> this feature has no impact where malicious actors have full control over client requests to simply ignore server response headers it does not want to process or adhere to.

### Remediation

The `Feature-Policy` header grants the ability to allow or deny browser features, whether in its own frame or content within an inline frame element `<iframe>`

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
