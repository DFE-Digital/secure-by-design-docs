---
title: "Application Security Standards: Protecting Data (Encryption and Cryptography)"
summary: Applicaion security standards for protecting data (Encryption and Cryptography) in DfE based on ASVS 
authors:
    - Sam Pritchard
date: 2024-10-22
---
# Protecting data (Encryption and Cryptography)

When processing, receiving, sending and storing data, applications must protect the data from unauthorised access and snooping. We must comply with all relevant laws and regulations including (but not limited to) the [Data Protection Act](https://www.legislation.gov.uk/ukpga/2018/12/contents/enacted), [GDPR](https://gdpr-info.eu/) and [PCI DSS](https://www.pcisecuritystandards.org/) (where credit cards are processed).

| #       | Description                                                                                                                                                                                                                                                                     | ASVS |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---- |
| CR1.0.1 | Ensure that all private data such as Personal Identifiable Information (PII), sensitive personal information, data relating to schools, individuals, financials or health is stored encrypted at rest and in transit.                                                           | 6.1  |
| CR1.0.2 | Ensure that all cryptographic modules fail securely.                                                                                                                                                                                                                            | 9.2  |
| CR1.0.3 | Ensure that only the latest approved cryptographic algorithms and libraries are used. For Azure applications, the most secure cipher suite can be set, and at the time of writing is `TLS_AES_256_GCM_SHA384`. Avoid the use of algorithms that are considered weak such as CBC. | 6.2  |
| CR1.0.4 | Minimum TLS versions must be set for all traffic to TLS 1.2 or TLS 1.3.                                                                                                                                                                                                         | 6.2  |
| CR1.0.5 | Only allow the use of trusted TLS certificates and avoid the use of self-signed certificates for both public and private connections.                                                                                                                                           | 9.2  |
| CR1.0.6 | All inbound and outbound communications must use TLS and never fallback to plaintext channels.                                                                                                                                                                                  | 9.2  |
