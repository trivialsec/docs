# Alternatives and Comparisons

## SSL Certificate Examination by dnschecker.org

[dnschecker.org](https://dnschecker.org/ssl-certificate-examination.php) checks only that a Certificate chain was provided and the root Certificate exists, the leaf Certificate is not expired and matches the hostname. These are to ensure they are well-formed, this is not a security mechanism that could be described as 'verified' valid, it is just well-formed validation check.

However, it is important to note that this validation process does not verify the authenticity or legitimacy of the website or server being accessed. It simply confirms that the SSL certificate is well-formed and meets the basic requirements for proper validation. Furthermore, dnschecker.org only examines one certificate chain, and does not verify any additional certificates or chains that may be used by the server.

Overall, while the SSL Certificate Examination provided by dnschecker.org is a useful tool for checking basic SSL certificate validation and formatting, it should not be relied upon as the sole means of determining a website's security or legitimacy. Additional security checks and precautions should also be taken to ensure online safety and security.

| Feature                                  | SSL Certificate Examination | Trivial Scanner    |
| ---------------------------------------- | --------------------------- | ------------------ |
| Basic TLS Information                    | Limited                     | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:            | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:            | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:            | :white_check_mark: |
| Multiple Certificate Chains              | Limited                     | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:            | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:            | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:            | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:            | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:            | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:            | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:            | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:            | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:            | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:            | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:            | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:            | :white_check_mark: |
| DNS Configuration                        | Limited                     | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:            | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:            | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:            | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:            | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:            | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:            | :white_check_mark: |
| API support                              | :octagonal_sign:            | :white_check_mark: |
| CLI support                              | :octagonal_sign:            | :white_check_mark: |
| SDK support                              | :octagonal_sign:            | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:            | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:            | :white_check_mark: |
| SaaS-based                               | :white_check_mark:          | :white_check_mark: |
| Data deletion                            | :octagonal_sign:            | :white_check_mark: |

## SSL Checker by thesslstore.com

[SSL Checker](https://www.thesslstore.com/ssltools/ssl-checker.php) is basically a tool that merely checks the server is able to establish a TLS connection, it is not intended for any security purposes other than validation the TLS characteristic of integrity exists and nothing more.

Relying solely on the SSL Checker provided by thesslstore.com could give a false sense of security, as it only checks the basic installation and configuration of the SSL certificate. It does not guarantee that the website or server is legitimate, secure, or free from security vulnerabilities.

| Feature                                  | SSL Checker        | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | Limited            | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## Geekflare TLS Scanner and TLS Test

[TLS Test](https://geekflare.com/tools/tls-test) will only validate which TLS protocol versions will establish a connection to the server.

[TLS Scanner](https://geekflare.com/tools/tls-scanner) is a little better as it will test for some vulnerabilities and common server misconfigurations, but does little to validate the certificate chain and trust root stores. It also misses a vast amount of common issues, and a poor job at describing any risks, threats, and non-compliance.

There are many reports of issues with these tools such as slow scanning speeds and false positives. Note that the tools are not maintained and will not report on current security vulnerability information and that additional security testing will be necessary to check everything reported by these tools.

| Feature                                  | Geekflare          | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | :white_check_mark: | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## Web Server Tester by Wormly

While the tool does provide basic security checks like SSL/TLS certificate testing and vulnerability scanning, it lacks some of the more advanced features that similar tools provide. The tool should also provide better reporting and analysis to help users understand the testing results and take action accordingly.

| Feature                                  | Wormly             | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:   | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | Limited            | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | Limited            | :white_check_mark: |
| Protocols offered vs negotiated          | Limited            | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | Limited            | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## DigiCert SSL Installation Diagnostics Tool

[SSL Installation Diagnostics Tool](https://www.digicert.com/help/) by DigiCert is designed to diagnose issues related to SSL/TLS certificate installation only, it does not provide analysis of any security vulnerabilities on a website beyond Heartbleed and weak (Debian specific) keys, all server-side or client-side configurations and vulnerabilities are ignored.

| Feature                                  | DigiCert           | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | Limited            | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSL Checker by SSL Shopper

[SSL Shopper](https://www.sslshopper.com/ssl-checker.html) checks only that a Certificate chain was provided and the root Certificate exists, the leaf Certificate is not expired and matches the hostname. These are to ensure they are well-formed, this is not a security mechanism that could be described as 'verified' valid, it is just well-formed validation check.

It seems to only assemble and check one certificate chain.

| Feature                                  | SSL Shopper        | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:   | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## Observatory by Mozilla

[Observatory](https://observatory.mozilla.org/analyze/observatory.mozilla.org) by Mozilla scans websites for various security issues, including TLS/SSL configuration, Content Security Policy (CSP), HTTP headers, and opinionated security best practices.

One of the significant benefits of Observatory is that it provides an easy-to-use interface that requires no technical knowledge to use. The tool generates a detailed report of the website's security posture, including recommended remediation steps. Which can be a huge security problem when everything is made too simple; such as it's arbitrary and context limited _rating_ or _scoring_ system - and overly simplified descriptions that lose all meaning when the technical words have been removed that would have made the meaning extremely clear had they been used correctly and concisely.

Mozilla announced in 2021 that it would no longer maintain the Observatory tool. While it is still available for use, it is unclear whether it will continue to be supported and updated in the future. Some users have reported receiving false positives from the tool, indicating that some of the recommendations provided may not be relevant or necessary for their particular use case.

We recommend using tools that are at-least assumed to be still maintained, therefor we will not provide any feature comparison on the basis of being responsible.

## testssl.sh

[testssl.sh](https://testssl.sh) is a great too for the average system administrator, it's a standard for testing for SSL/TLS vulnerabilities. It has all the common known issues covered without false positives being an issue. However you can not use this tool to verify TLS trust as it 'dumbs-it-down' and misunderstands how trust stores are created and utilised in practice.

It seems to only assemble and check one certificate chain.

The report is very basic but concise, and the project is well maintained with many contributors and consistent releases.

| Feature                                  | testssl.sh         | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | :white_check_mark: | :white_check_mark: |
| TLS Vulnerabilities                      | :white_check_mark: | :white_check_mark: |
| Trust Anchors                            | Faked              | :white_check_mark: |
| Compromised Certificates                 | Limited            | :white_check_mark: |
| Multiple Certificate Chains              | Limited            | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :white_check_mark: | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :white_check_mark: | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :white_check_mark: | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | Limited            | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :white_check_mark: | :white_check_mark: |
| Protocols offered vs negotiated          | :white_check_mark: | :white_check_mark: |
| DNS Configuration                        | Limited            | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | Limited            | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :white_check_mark: | :white_check_mark: |
| Deprecation Checking                     | Limited            | :white_check_mark: |
| CVE with CVSS Ratings                    | Limited            | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :white_check_mark: | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :octagonal_sign:   | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## Qualys SSL Labs

The industry standard for testing for SSL/TLS vulnerabilities, it has all the common known issues covered without false positives being an issue. However you can not use this tool to verify TLS trust as it 'dumbs-it-down' or misunderstands trust at best, knowingly providing misleading information at worst.

The report is poorly designed and hard to understand, you need to go searching through community discussions or start a questions in a community to figure out the information in the report.

Qualys is public for use without registration, which is questionable ethics and good reason to keep the features very limited.

| Feature                                  | Qualys SSL Labs    | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | :white_check_mark: | :white_check_mark: |
| TLS Vulnerabilities                      | :white_check_mark: | :white_check_mark: |
| Trust Anchors                            | Faked              | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | Limited            | :white_check_mark: |
| Custom Evaluation Rules                  | :white_check_mark: | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | Limited            | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | Limited            | :white_check_mark: |
| Weak Certificate Validation              | :white_check_mark: | :white_check_mark: |
| Intermediate Certificates                | Limited            | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | Limited            | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :white_check_mark: | :white_check_mark: |
| Protocols offered vs negotiated          | :white_check_mark: | :white_check_mark: |
| DNS Configuration                        | Limited            | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | Limited            | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :white_check_mark: | :white_check_mark: |
| Deprecation Checking                     | Limited            | :white_check_mark: |
| CVE with CVSS Ratings                    | Limited            | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :white_check_mark: | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSL Security Test by ImmuniWeb

[ImmuniWeb](https://www.immuniweb.com/ssl) is a great alternative to Qualys SSL Labs with a modern layout, more non-compliance checks, and the report has more information at a glance (you don't need to go searching for community discussions or start a questions in a community to figure out the information in the report).

It seems to not assemble but will check the assumed certificate chain sent by a server.
ImmuniWeb is public for use without registration, which is questionable ethics and good reason to keep the features very limited.

| Feature                                  | ImmuniWeb          | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | :white_check_mark: | :white_check_mark: |
| TLS Vulnerabilities                      | :white_check_mark: | :white_check_mark: |
| Trust Anchors                            | Faked              | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | Limited            | :white_check_mark: |
| Custom Evaluation Rules                  | :white_check_mark: | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :white_check_mark: | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :white_check_mark: | :white_check_mark: |
| Weak Certificate Validation              | :white_check_mark: | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :white_check_mark: | :white_check_mark: |
| OCSP Verification                        | Limited            | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :white_check_mark: | :white_check_mark: |
| Protocols offered vs negotiated          | :white_check_mark: | :white_check_mark: |
| DNS Configuration                        | Limited            | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :white_check_mark: | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :white_check_mark: | :white_check_mark: |
| Deprecation Checking                     | Limited            | :white_check_mark: |
| CVE with CVSS Ratings                    | Limited            | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :white_check_mark: | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## CryptCheck

[CryptCheck](https://cryptcheck.fr/) does not take into account any security factors at all, it only looks at the ciphers being negotiated and ignores entirely which are made available but not actually negotiated. But it does verify more protocols than other tools; TLS, SSH, XMPP, and SMTP.

| Feature                                  | CryptCheck         | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | :octagonal_sign:   | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:   | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | Limited            | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSL Test by fairssl.net

[fairssl.net](https:///fairssl.net) checks only that a Certificate chain was provided and the root Certificate exists, the leaf Certificate is not expired and matches the hostname. These are to ensure they are well-formed, this is not a security mechanism that could be described as 'verified' valid, it is just well-formed validation check.

It seems to only assemble and check one certificate chain.

| Feature                                  | fairssl.net        | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:   | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSLyze

[SSLyze](https://github.com/nabla-c0d3/sslyze) is a hacker favorite tool and is provided via kali Linux repositories.

It is intentionally focussed on identification of exploits rather than compliance and has support for scanning non-HTTP servers which makes it stand out despite it's limitations. It has to be run by a developer and the results are presented for security professionals, so the learning curve and poor attention to details keeps it's usefulness to a niche (hackers) of a niche (developers) of a niche (security professionals).

Unfortunately (or fortunately) it misunderstands trust providing incorrect and useless results, which can make it impossible for defenders to gain any insights and slow down bad actors with (perhaps intentional) misinformation.
It seems to not assemble but will check the assumed certificate chain sent by a server.

| Feature                                  | SSLyze             | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | Limited            | :white_check_mark: |
| Trust Anchors                            | Faked              | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | Limited            | :white_check_mark: |
| Custom Evaluation Rules                  | Limited            | :white_check_mark: |
| Lowest Security Negotiation              | :white_check_mark: | :white_check_mark: |
| Continuous Monitoring                    | Limited            | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | Limited            | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :white_check_mark: | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | Limited            | :white_check_mark: |
| OCSP Verification                        | Limited            | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :white_check_mark: | :white_check_mark: |
| Protocols offered vs negotiated          | :white_check_mark: | :white_check_mark: |
| DNS Configuration                        | Limited            | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | Limited            | :white_check_mark: |
| Encryption Strengths and Weaknesses      | Limited            | :white_check_mark: |
| Deprecation Checking                     | Limited            | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :white_check_mark: | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :octagonal_sign:   | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSL Web Server Test by Wormly

[Wormly](https://www.wormly.com/test_ssl) is a blatant wrapper for SSLyze without actually disclosing the license or attributing to the owner.

| Feature                                  | Wormly             | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | Limited            | :white_check_mark: |
| Trust Anchors                            | Faked              | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | Limited            | :white_check_mark: |
| Custom Evaluation Rules                  | Limited            | :white_check_mark: |
| Lowest Security Negotiation              | :white_check_mark: | :white_check_mark: |
| Continuous Monitoring                    | Limited            | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | Limited            | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :white_check_mark: | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | Limited            | :white_check_mark: |
| OCSP Verification                        | Limited            | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :white_check_mark: | :white_check_mark: |
| Protocols offered vs negotiated          | :white_check_mark: | :white_check_mark: |
| DNS Configuration                        | Limited            | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | Limited            | :white_check_mark: |
| Encryption Strengths and Weaknesses      | Limited            | :white_check_mark: |
| Deprecation Checking                     | Limited            | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :white_check_mark: | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :octagonal_sign:   | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSLChecker.com

[SSLChecker](https://www.sslchecker.com/sslchecker) checks only that a Certificate chain was provided and the root Certificate exists, the leaf Certificate is not expired and matches the hostname. These are to ensure they are well-formed, this is not a security mechanism that could be described as 'verified' valid, it is just well-formed validation check.

It seems to only assemble and check one certificate chain.

| Feature                                  | SSLChecker.com     | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:   | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSL checker by GeoCerts

[GeoCerts](https://www.geocerts.com/ssl-checker) checks only that a Certificate chain was provided and the root Certificate exists, the leaf Certificate is not expired and matches the hostname. These are to ensure they are well-formed, this is not a security mechanism that could be described as 'verified' valid, it is just well-formed validation check.

It seems to only assemble and check one certificate chain.

The Server Test is a white-labelled Qualys SSL Labs.

| Feature                                  | GeoCerts / Qualys SSL Labs | Trivial Scanner    |
| ---------------------------------------- | -------------------------- | ------------------ |
| Basic TLS Information                    | :white_check_mark:         | :white_check_mark: |
| TLS Vulnerabilities                      | :white_check_mark:         | :white_check_mark: |
| Trust Anchors                            | Faked                      | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:           | :white_check_mark: |
| Multiple Certificate Chains              | Limited                    | :white_check_mark: |
| Custom Evaluation Rules                  | :white_check_mark:         | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:           | :white_check_mark: |
| Continuous Monitoring                    | Limited                    | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:           | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:           | :white_check_mark: |
| Compliance Mappings                      | Limited                    | :white_check_mark: |
| Weak Certificate Validation              | :white_check_mark:         | :white_check_mark: |
| Intermediate Certificates                | Limited                    | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:           | :white_check_mark: |
| OCSP Verification                        | Limited                    | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :white_check_mark:         | :white_check_mark: |
| Protocols offered vs negotiated          | :white_check_mark:         | :white_check_mark: |
| DNS Configuration                        | Limited                    | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:           | :white_check_mark: |
| HTTP Application Layer Configurations    | Limited                    | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :white_check_mark:         | :white_check_mark: |
| Deprecation Checking                     | Limited                    | :white_check_mark: |
| CVE with CVSS Ratings                    | Limited                    | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:           | :white_check_mark: |
| API support                              | :octagonal_sign:           | :white_check_mark: |
| CLI support                              | :octagonal_sign:           | :white_check_mark: |
| SDK support                              | :octagonal_sign:           | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:           | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:           | :white_check_mark: |
| SaaS-based                               | :white_check_mark:         | :white_check_mark: |
| Data deletion                            | :octagonal_sign:           | :white_check_mark: |

## Website Safety & Security Check by ssltrust.com.au

[Website Safety & Security Check](https://www.ssltrust.com.au/ssl-tools/website-security-check) is a blatant wrapper for testssl.sh without actually disclosing the license or attributing to the owner.

| Feature                                  | ssltrust.com.au / testssl.sh | Trivial Scanner    |
| ---------------------------------------- | ---------------------------- | ------------------ |
| Basic TLS Information                    | :white_check_mark:           | :white_check_mark: |
| TLS Vulnerabilities                      | :white_check_mark:           | :white_check_mark: |
| Trust Anchors                            | Faked                        | :white_check_mark: |
| Compromised Certificates                 | Limited                      | :white_check_mark: |
| Multiple Certificate Chains              | Limited                      | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:             | :white_check_mark: |
| Lowest Security Negotiation              | :white_check_mark:           | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:             | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:             | :white_check_mark: |
| Customization of Scanner Behavior        | :white_check_mark:           | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:             | :white_check_mark: |
| Weak Certificate Validation              | :white_check_mark:           | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:             | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:             | :white_check_mark: |
| OCSP Verification                        | Limited                      | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :white_check_mark:           | :white_check_mark: |
| Protocols offered vs negotiated          | :white_check_mark:           | :white_check_mark: |
| DNS Configuration                        | Limited                      | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:             | :white_check_mark: |
| HTTP Application Layer Configurations    | Limited                      | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :white_check_mark:           | :white_check_mark: |
| Deprecation Checking                     | Limited                      | :white_check_mark: |
| CVE with CVSS Ratings                    | Limited                      | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:             | :white_check_mark: |
| API support                              | :octagonal_sign:             | :white_check_mark: |
| CLI support                              | :octagonal_sign:             | :white_check_mark: |
| SDK support                              | :octagonal_sign:             | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:             | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:             | :white_check_mark: |
| SaaS-based                               | :white_check_mark:           | :white_check_mark: |
| Data deletion                            | :octagonal_sign:             | :white_check_mark: |

## SSL Verification Tool by Liquid Web

[Liquid Web](https://sslcheck.liquidweb.com/) checks only that the root Certificate exists, the leaf Certificate is not expired and matches the hostname. These are to ensure they are well-formed, this is not a security mechanism that could be described as 'verified' valid, it is just well-formed validation check.

It seems to only assemble and check one certificate chain.

| Feature                                  | Liquid Web         | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:   | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |

## SSL Checker by Sectigo

[Sectigo](https://sectigostore.com/ssl-tools/ssl-checker.php) checks only that a Certificate chain was provided and the root Certificate exists, the leaf Certificate is not expired and matches the hostname. These are to ensure they are well-formed, this is not a security mechanism that could be described as 'verified' valid, it is just well-formed validation check.

It seems to only assemble and check one certificate chain.

| Feature                                  | Sectigo            | Trivial Scanner    |
| ---------------------------------------- | ------------------ | ------------------ |
| Basic TLS Information                    | Limited            | :white_check_mark: |
| TLS Vulnerabilities                      | :octagonal_sign:   | :white_check_mark: |
| Trust Anchors                            | :octagonal_sign:   | :white_check_mark: |
| Compromised Certificates                 | :octagonal_sign:   | :white_check_mark: |
| Multiple Certificate Chains              | :octagonal_sign:   | :white_check_mark: |
| Custom Evaluation Rules                  | :octagonal_sign:   | :white_check_mark: |
| Lowest Security Negotiation              | :octagonal_sign:   | :white_check_mark: |
| Continuous Monitoring                    | :octagonal_sign:   | :white_check_mark: |
| Threat Intelligence Correlation          | :octagonal_sign:   | :white_check_mark: |
| Customization of Scanner Behavior        | :octagonal_sign:   | :white_check_mark: |
| Compliance Mappings                      | :octagonal_sign:   | :white_check_mark: |
| Weak Certificate Validation              | :octagonal_sign:   | :white_check_mark: |
| Intermediate Certificates                | :octagonal_sign:   | :white_check_mark: |
| Client Certificates                      | :octagonal_sign:   | :white_check_mark: |
| OCSP Verification                        | :octagonal_sign:   | :white_check_mark: |
| Encryption Ciphers offered vs negotiated | :octagonal_sign:   | :white_check_mark: |
| Protocols offered vs negotiated          | :octagonal_sign:   | :white_check_mark: |
| DNS Configuration                        | :octagonal_sign:   | :white_check_mark: |
| User Experience (Browser Errors)         | :octagonal_sign:   | :white_check_mark: |
| HTTP Application Layer Configurations    | :octagonal_sign:   | :white_check_mark: |
| Encryption Strengths and Weaknesses      | :octagonal_sign:   | :white_check_mark: |
| Deprecation Checking                     | :octagonal_sign:   | :white_check_mark: |
| CVE with CVSS Ratings                    | :octagonal_sign:   | :white_check_mark: |
| GSD Data and EPSS for CVE                | :octagonal_sign:   | :white_check_mark: |
| API support                              | :octagonal_sign:   | :white_check_mark: |
| CLI support                              | :octagonal_sign:   | :white_check_mark: |
| SDK support                              | :octagonal_sign:   | :white_check_mark: |
| Webhook integrations                     | :octagonal_sign:   | :white_check_mark: |
| Signed Webhooks                          | :octagonal_sign:   | :white_check_mark: |
| SaaS-based                               | :white_check_mark: | :white_check_mark: |
| Data deletion                            | :octagonal_sign:   | :white_check_mark: |
