### Description

When an OCSP assertion is not included 'stapled' with the certificate, an weakness in the clients ability to obtain a remote assertion, when the client attempts to establish a connection with the OCSP responder an additional MITM attack vector is available and forged OCSP assertions may be provided allowing an attacker to spoof the revocation status of a certificate to cause a denial of service or establish trust where otherwise a compromise would have been detected.
