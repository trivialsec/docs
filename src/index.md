---
title: Introduction
summary: Everything you need to know about what Trivial Security provides you.
authors:
  - Chris Langton
date: 2023-04-07
---

# Introduction

Everything you need to know about what Trivial Security provides you.

## What is Trivial Security

Trivial Security is a managed service for the Open Source [Trivial Scanner](https://github.com/trivialsec/trivialscan), a web application security scanner that enables you to scan websites, web applications, and API services, to identify security flaws. Trivial Scanner can scan all types of web-based targets regardless of the hosting platform or the programming language with which they are built.

## Key Concepts

Essentially there are 3 distinct parts that make up Trivial Security; Scanners, Reporting, Early Warning Service.

The Scanners will not only look for issues, they also fingerprint and catalog your attack surface so that the Early Warning Scanner can correlate vast amounts of threat information and alert on only the information that is relevant to you.

Typically large enterprises with dedicated security and software development teams will collect a small amount of these threat intelligence feeds and data sources to analyse themselves, are required to maintain an update assets, and keep on top of the changes to the sources to ensure their workloads run and are stable. Few of these enterprises scale that effort to come close to the vast number of sources Trivial Security maintains, and at any scale it is often more of a challenge to first know what assets they own to make use of the sources they do choose to track.

If the well-funded and dedicated teams of enterprises fail to fundamentally implement the basics for a small threat intelligence capability, it's rare that any smaller companies that may not have dedicated security funding or teams could match those who have well funded programs and dedicated skilled teams.

The unique combination of attack surface scanning and threat intelligence that enables Trivial Security to succeed where these challenges have prevented successful programs in the past.

### Trivial Scanner

Trivial Scanner is a versatile and easy-to-use CLI tool or python library designed for web application security assessments and research. It allows users to scan hosts with open ports and services various protocols, and can identify common vulnerabilities in web applications. With its TLS/SSL certificate verification feature powered by the `tlstrust` library, Trivial Scanner ensures secure communications and prevents potential man-in-the-middle attacks.

Trivial Scanner is compatible with Python 3.9 and runs best with the latest 3.11 release, and is very simple ti install, accessible to users of all skill levels.

### Subdomain Scanner

Trivial Security also integrates with the popular OWASP Amass scanner, which provides additional functionality for mapping out the attack surface of a target domain. By combining Trivial Scanner's port scanning and vulnerability assessment capabilities with Amass's advanced reconnaissance features, users can gain a comprehensive understanding of their target's network and potential attack vectors.

Amass can be used to discover subdomains, domain names, IP addresses, and other network assets that are associated with a target domain. This information can be used to identify potential entry points for an attacker and to help prioritize security efforts. The integration with Trivial Scanner allows users to perform a thorough security assessment of their target's network, including identifying open ports and services, performing vulnerability scans, and discovering potential attack vectors.

By using Trivial Scanner and Amass together, users can have a complete picture of their web applications attack surface, and can take appropriate steps to secure their network and prevent potential cyber attacks.

### Continuous Monitoring

Trivial Scanner's Continuous Monitoring feature provides a comprehensive and proactive approach to web application security. The automated process saves time and resources, while ensuring that the web application is secure and protected from potential cyber attacks. It combines advanced scanning and vulnerability assessment capabilities with real-time threat intelligence and alerts, making it easy for users to stay informed and protected against potential cyber threats.

It combines the power of Trivial Scanner's advanced scanning and vulnerability assessment capabilities with the Early Warning Service's real-time threat intelligence and alerts, providing users with a comprehensive and proactive approach to web application security.

Continuous Monitoring allows users to continuously scan their web application for vulnerabilities, monitor their assets in real-time, and receive alerts and notifications of potential threats. This means that users can take proactive measures to prevent cyber attacks before they happen, instead of reacting after the fact.

### On-demand scanning

Trivial Scanner's On-Demand option provides users with the flexibility to perform ad-hoc scans of their web application whenever they need it. This feature is ideal for users who require immediate visibility into their web applications security posture, or who need to perform one-time scans of specific assets or network segments.

Trivial Scanner's On-Demand option is easy to use, with a simple interface that allows users to customize their scans and choose the specific assets or network segments to be scanned. The scan results are presented in an easy-to-read format, allowing users to quickly identify vulnerabilities and take action to remediate them.

### Early Warning Service

Traditionally, knowing your assets and correlating them to threat intelligence involves a time-consuming and complex process. First, network administrators must manually identify all assets within their network, including devices, applications, servers, and databases. This requires a detailed understanding of the network architecture and all connected devices.

Once the assets are identified, administrators must then correlate them with relevant threat intelligence to determine their exposure to potential vulnerabilities and cyber threats. This involves manually collecting and analyzing data from various sources, including security blogs, vendor alerts, and other threat intelligence feeds.

This process can be time-consuming and error-prone, and requires a significant amount of expertise and resources. However, with Trivial Scanner's Early Warning Service, this process is completely automated.

Trivial Scanner's Early Warning Service continuously scans the web application for new assets and vulnerabilities, and correlates this information with threat intelligence feeds in real-time. This means that web application developers no longer need to manually identify and correlate assets, as Trivial Scanner does this automatically.

The Early Warning Service provides users with real-time alerts and notifications of potential threats, and can automatically take action to mitigate the risk. This makes it easy for web applications developers to stay on top of emerging threats and vulnerabilities, without requiring significant expertise or resources.

In summary, Trivial Scanner's Early Warning Service provides a hassle-free and efficient way for organizations to monitor their web applications and protect against potential cyber threats. With its automated process, users can stay ahead of the threat landscape without the need for manual asset identification and correlation.

### Scanner Reports

Trivial Scanner reports provide users with comprehensive details about their web applications security posture, making it easy for security teams to identify vulnerabilities and take action to remediate them. The reports include compliance with industry-standard regulations like PCI DSS versions 4.0 and 3.2.1, NIST, and FIPS for encryption, providing users with the assurance that their web applications is meeting industry standards.

In addition, the reports include full certificate chains and mapping to Mitre Att&ck attributes for each finding, giving security teams a clear understanding of the risk level and potential impact of each vulnerability. This allows security teams to prioritize their remediation efforts and take action quickly to prevent potential cyber attacks.

Trivial Scanner's remediation recommendations also provide users with actionable steps to address vulnerabilities. This makes it easy for developers and security teams to take a proactive approach to security, ensuring that their web application is protected from potential cyber threats.

### OSINT Pivots

Trivial Scanner's OSINT Pivots feature provides users with a powerful tool for gathering open-source intelligence (OSINT) during investigations and incident response. The feature allows users to perform automated scans of publicly available sources, such as social media, public records, and online forums, to gather information about a target entity or domain.

Trivial Scanner's OSINT Pivots feature uses Trivial Scanner results to correlate the correct information needed for an investigation. The tool automatically collects data from a variety of sources and filters out irrelevant information, allowing investigators to focus on the most relevant data.

Trivial Scanner presents the results in an easy-to-read format that includes detailed information about the target entity, including associated OSINT Pivots.

This information can be used to build a profile of the target entity, potentially leading to the identification of additional targets or threat actors.
