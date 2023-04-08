### Description

You can get issued a DV Certificate without actually validating the domain, Until 2018 the ACME protocol of Let's Encrypt did just this, relying on only SNI for the so-called DV Certificate issuance - not their fault, ACME was designed that way.

June 2022 there are hundreds of ACME protocol Certificate Authorities issuing DV certificates and few would have learned from the 2018 disclosure and turned off the vulnerable design feature of SNI.

There are a total of 10 methods of verification defined by ACME, few actually offer any security characteristics that can be said to 'Verify' Domain Ownership, in fact some are designed on purpose to offer DV certificates to customers of website hosting providors that can only modify the HTTP header responses, or less control and can only add a HTML tag! Neither of these are verifying control of a domain, let alone Validate domain control! What is a DV certificate if domain validation never occurred?

Beyond validation itself; The ACME protocol DV Certificate Issuers generally don't offer any additional features, therefore even if you attempt to use certain features like ssl_stapling it will simply be ignored. These Issuers, (pick on Let's Encrypt for this one) simply prefer low-barrier and ease-of-use over any and all security characteristics - so if they don't care, why would you put any trust in their DV Certificates to secure your TLS connections?
