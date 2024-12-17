---
title: "Secure by Design threat modelling policy"
summary: A markdown template for SBD policies
authors:
    - Simon Bishop
date: 2024-12-13
---

# Threat modelling policy (Secure by Design)

## Purpose
This policy establishes guidelines for conducting threat modelling to identify, assess, and mitigate security threats within XXX. Adoption of a threat modelling standard for threat identification and an information security controls framework, this policy aims to ensure a systematic and consistent approach to managing security risks through the lifecycle of the service offering.  

## Scope  
This policy applies to all new or significant changes to digital service and technology projects either built within departments or procured through suppliers. This policy does not apply to digital services which are currently in operation or routine maintenance. Over time, it is expected that all digital services will either be retired or come into scope for this policy. As part of DfE secure by design implementation strategy, the mission is to work with all services to ensure threat modelling meets the Secure by Design (SbD) security requirement.

## Exceptions
Exceptions to this policy are likely to occur. Exception requests shall be made by email to the policy author(s) identified in the revision history and must contain:  

- the reason for the request
- risk to DfE of not following the written policy
- specific mitigations that will not be implemented
- technical and other difficulties
- date of review

## Policy statements

- threat modelling should be considered by the senior leadership in accordance with the risk appetite (SRO) sign off for threat models, risks owners and acceptance process.
- risk owners are accountable for managing cyber security risks for a service throughout its lifecycle. These must be senior stakeholders with the experience, knowledge and authority to lead on security activities.
- threat and risk management activities should be supported by a suitability qualified SME identified in the RACI.  
- threat modelling should be appropriately resourced throughout the service lifecycle, be dynamic and frequent to respond to emerging threats
- when threat modelling, make informed risk management decisions and ensure risks have been mitigated to a level that meets your project’s security risk appetite.
- threat models, validation and all identified risks should be reviewed by the SRO within 21 days of (milestone/checkpoint XX).

## Responsible Accountable Consulted Informed (RACI)

|       Tasks                              | CISO           | SRO | Project / operations security leads | Development / operations teams  |   
|------------------------------------------|----------------|-----|-------------------------------------|---------------------------------|
| Define and enable strategy               | R              | C   | I                                   | I                               |
| Risk appetite                            | R              | C   | I                                   | I                               |
| Ensure teams conduct threat modelling    | A              | R   | R                                   | I                               |
| Gather threat appropriate intelligence   | A              | R   | R                                   | I                               |
| Conduct threat assessment                | A              | R   | R                                   | I                               |
| Lead threat modelling exercise           | A              | C   | R                                   | R                               |
| Participate in threat modelling workshop | A              | C   | R                                   | R                               |
| Design risk treatment strategy           | Not applicable | R   | R                                   | R                               |
| Accept risk as a treatment option        | C              | A   | R                                   | C                               |
| Document and report threat model         | A              | R   | C                                   | I                               |
| Threat model validation                  | A              | C   | R                                   | R                               |

## Threat modelling and key dependencies

### Threat modelling definition
A structured process used to identify, assess, and address potential security threats and vulnerabilities within a system. It helps organisations understand and manage risks by analysing how an attacker might exploit system weaknesses to achieve malicious objectives. This approach is proactive, aiming to integrate security into the design and development phases of IT systems and processes.
Threat modelling should leverage input from the following areas of the business described in the sections below.

### Risk appetite
Cyber security risk for project should be managed in line with to your organisation’s risk appetite statement. Begin with creating a risk appetite specific to your service/project, talk to the risk management team to understand the organisation’s overall risk acceptance thresholds. For further information review the [SbD risk appetite advice](https://www.security.gov.uk/policy-and-guidance/secure-by-design/activities/working-out-the-projects-security-risk-appetite/).  

### Asset management
Projects should identify and categorise all in scope physical and information assets, for criticality, and ownership.  

### Threat assessment
Current and emerging threats relevant to the organisation, the project assets and service should be understood to inform an accurate and up to date threat picture supporting threat modelling.  

### System architecture
Detailed systems architecture documentation should be available, clearly mapping all components, interfaces, and data flows within the system. Specifications included should be for hardware, software, networks, and cloud services. Provide a top-level view of the system, highlighting key functionalities and interconnections. Illustrate dependencies, critical paths, and trust boundaries to support security analysis.

## Project service lifecycle  
Threat modelling is dynamic and must:

- respond promptly to changes in the threat environment, including new vulnerabilities or threat actor TTPs
- address significant changes to the service or infrastructure, such as system upgrades, integrations, or decommissioning
- be conducted on a regular, predefined lifecycle basis (for example, annually or as part of scheduled reviews)

## Threat modelling framework
The organisation should use a threat modelling methodology as the primary approach to identify and categorise threats across its systems, processes, and assets.  

- [MITRE ATT&CK](https://attack.mitre.org/), [MITRE D3FEND](https://d3fend.mitre.org/) and [MITRE CAPEC](https://capec.mitre.org/) – used to explore possible vulnerabilities and issues that might apply to your service
- [STRIDE](https://www.gov.uk/government/publications/secure-connected-places-playbook-documents/conducting-a-stride-based-threat-analysis) (Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, and Elevation of privilege) – a model for exploring different threat categories
- [attack trees](https://www.ncsc.gov.uk/collection/risk-management/using-attack-trees-to-understand-cyber-security-risk) – for representing the paths adversaries may use to attack your service so you can design solutions to prevent them
- a threat modelling framework should apply during the design, development, and review phases of systems and applications to identify potential threat events or attack paths.  
- identified threats should be mapped to business processes, technical components, and operational activities.  
- outputs from threat analysis must be documented in threat modelling reports, which shall inform subsequent risk treatment plans 
- threat models should be reviewed and, updated annually or when significant changes as defined under the Scope section of this document  
- security controls should be identified that mitigate/reduce the likelihood of one or more of the threat events/attack paths

## Security controls framework
The risk register produced when performing a security risk assessment outlines the risks and their rating prior to implementing any controls. You could reduce the likelihood or the impact of the risks by selecting appropriate controls from your security controls set.

As part of any project or service the project team should implement security controls from a recognised cyber security control framework. A secure by design control taxonomy is available at the XXXX website.  

- use security controls to harden operating systems, network devices, and cloud configurations  
- regularly assess compliance with the selected security controls through automated tools and manual validation  
- Project security lead should maintain documentation of security controls status for audit and reporting purposes  
- Risk management activities should address gaps identified during assessments with priority given to high-risk areas  

## Risk identification and management
Risks identified through threat modelling must be documented, prioritised, and managed in alignment with organisational risk management policies and frameworks.

## Continuous improvement
Lessons learned from previous threat modelling cycles and risk management outcomes must inform updates to asset management practices, threat assessment methodologies, and system architecture design.

## Data handling and privacy  
The following must be considered when using collecting, analysing and sharing threat modelling data:  

- anonymisation or masking of sensitive data before sharing externally  
- secure storage of threat modelling data and limited access based on least privilege and need to know
- use of the government classification scheme to protect sensitive data in line with policy

## Related policies
The following polices are associated with this policy and should also be read as they directly interact or support the policy:

- [Vulnerability Management Policy](vulnerability_management_policy.md)
- Incident Management Policy
- Security Monitoring Policy
- Asset Management Policy (TBC)
- Risk Management Policy (TBC)
- Supplier Management Policy (TBC)

## Revision history

### Revision table

| Date of change | Author             | Review Date          | Version |
| -------------- | ------------------ | -------------------- | ------- |
| YYYY-MM-DD     | FULL_NAME          | YYYY-MM-DD (+1 year) | v0.1    |


### Approved by

| Name            | Title     | Date       | Version |
| --------------- | --------- | ---------- | ------- |
| FULL_NAME       | TITLE     | YYYY-MM-DD | v0.1    |        

### Policy updates and decision record

| Decision | Reason for decision | Author (Job title) | Date       |
| -------- | ------------------- | ------------------ | ---------- |
|          |                     |                    | 2024-03-07 |

# Appendix A: Glossary

| Term                    | Meaning in this context |
| ----------------------- | ----------------------- |
|                         |                         |


# Appendix B: Centre for Internet Security (CIS) safeguards mapping