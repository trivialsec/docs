### Description

:warning: <span style="color: #ffca00; font-weight: 600;">Warning</span>: Even though this feature can protect users of older web browsers that don't yet support CSP, in some cases, XSS protection can create XSS vulnerabilities in otherwise safe websites. See the [MDN reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection) for more information.

The server sent a response header to inform supporting browsers to stop pages from loading when they detect reflected cross-site scripting (XSS) attacks.

:octagonal_sign: <span style="color: #ff0000; font-size: 1.1em;">Deprecated</span>

These protections are largely unnecessary in modern browsers when sites implement a strong Content-Security-Policy that disables the use of inline JavaScript ('unsafe-inline').
