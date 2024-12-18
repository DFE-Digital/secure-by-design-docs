---
title: "Secure by Design threat intelligence policy"
summary: A threat intelligence policy to incorporate the requirements of CDDO's Secure by Design for DfE
authors:
    - Steve Heneghan
date: 2024-12-17
---

# Threat intelligence policy (Secure by Design)

## Terminology

| Term       | Meaning / Application                                               |
| ---------- | ------------------------------------------------------------------- |
| Must       | This term is used to state a mandatory requirement of this policy   |
| Should     | This term is used to state a recommended requirement of this policy |
| May        | This term is used to state an optional requirement of this policy   |


## Purpose
The purpose of this policy is to establish the use of threat intelligence within DfE (Department for Education) to ensure the early identification, analysis, and mitigation of threats to business systems or data and to focus resources to protect critical or sensitive systems and data assets.

## Scope
This policy applies to new projects or significant changes (for example, those requiring a treasury business case or those where there is significant change to the cyber risk profile) to digital service and technology infrastructure either built within teams or procured through suppliers which are in scope of [digital and technology spend controls](https://www.gov.uk/government/publications/digital-and-technology-spend-control-version-6) approval process.

It covers the management and use of internal and external threat intelligence data and applies to all technology and software products and services developed, tested, deployed, operated and maintained by DfE. This includes third party software and services directly used in the delivery or support of DfE services.

This policy includes employees, contractors, and third-party service providers involved in DfE’s threat intelligence creation and use activities across project lifecycles, from start to finish (concept to retirement/disposal).

## Objectives

The objectives of this policy are to:

- define the purpose of threat intelligence use and ensure appropriate threat intelligence is sourced, analysed and utilised
- support risk management by proactively identifying and mitigating significant cyber threats at earliest opportunity
- protect critical assets, systems, and data
- inform incident management, response and recovery efforts
- ensure departmental staff are aware of threats to the cyber security posture of DfE
- protect the brand and reputation of DfE
- support the secure by design lifecycle and operational practices by continuously updating threat intelligence, to reduce risks to DfE


## Responsibility
The following stakeholder roles have responsibilities for the successful use of threat intelligence to help manage cyber security risk. Expected activities are covered in the threat intelligence use section of this policy.


### Chief Information Security Officer (CISO)

This role is responsible for the development and implementation of threat intelligence strategy and ensuring compliance with the policy and applicable laws.


### Senior Responsible Owners (SRO)

Staff in this role ensure that programmes and projects within their area of responsibility utilise threat intelligence as part of their secure by design project delivery methodologies as stated in [the threat intelligence use section](#threat-intelligence-use) of this policy.


### Cyber Threat Intelligence (CTI) team

This team is responsible for the collection, collation, analysis and distribution of threat intelligence to the stakeholder roles identified in this policy.


### Project and operational cyber security leads

This role is responsible for coordination of threat intelligence between the CTI team and development and operations teams.


### Development and Operations teams

These teams are responsible for design and build of secure systems using threat intelligence and threat modelling in design and development to identify and address vulnerabilities early and ongoing. For example, ensuring threat intelligence is considered into sprint planning, backlogs and Continuous Integration/Continuous Development (CI/CD) pipelines for automated security scanning and real-time monitoring.

They are also responsible for sharing Threat Intelligence collected by their teams with the central CTI team.


### Incident management teams

These teams are responsible for ensuring capability is in place so significant threats to DfE can be detected, contained, mitigated and recovered from.


### Security monitoring teams

The security monitoring teams are responsible for using threat intelligence to ensure monitoring and detection activity is relevant to the cyber threats that have greatest impact to DfE. For example, through creation of standard detection rules or through focussed threat hunting exercises.


### Learning and development and end users

Learning and development teams are responsible for ensuring training and awareness programmes are prioritised based on the threats relevant to DfE.

End users are responsible for keeping themselves aware of the threats to the department and raising security concerns / reporting security incidents based on these threats.


### Supply chain management teams

Supplier and third-party management teams are responsible for ensuring third party vendors and partners:

- share threat intelligence that could impact DfE’s security posture
- take appropriate action on threat intelligence passed to them from DfE
  

### Responsible Accountable Consulted Informed (RACI) matrix

| Role<br><br>Activity | CISO | SRO | CTI team | Project/<br><br>Operations security leads | Development/Operations teams | Incident Management teams | Security monitoring<br><br>teams | End Users | Supply Chain teams | Learning & Development |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Define and enable strategy | A   | C   | I   | I   | I   | I   | I   | I   | I   | I   |
| Ensure teams make use of threat intelligence | \-  | A   | I   | R   | R   | R   | R   | \-  | R   | R   |
| Collect, collate, analyse and distribute threat intelligence | C   | C   | R   | R   | C   | C   | C   | \-  | C   | \-  |
| Coordinate threat intelligence activity | \- | A   | R   | R   | C   | C   | C   | \-  | R   | \-  |
| Be aware of threat intelligence | \- | A   | R   | I   | I   | I   | I   | I   | I   | I   |
| Utilise threat intelligence to detect vulnerabilities | A   | A   | C   | C   | R   | R   | R   | \-  | R   | \-  |
| Utilise threat intelligence to design out vulnerabilities | A   | A   | C   | C   | R   | R   | R   | \-  | R   | \-  |
| Utilise threat intelligence to manage incidents | A   | A   | C   | R   | R   | R   | C   | \-  | R   | \-  |
| Feedback usefulness of threat intelligence | \- | A   | R   | R   | C   | C   | C   | C   | C   | C   |
| Report on threat intelligence | I   | I   | A   | R   | C   | C   | C   | \-  | C   | C   |
| Arrange TI sharing agreements with OGDs and ALBs | A   | C   | R   | \-  | \-  | \-  | I   | \-  | C   | R   |
| Arrange training based on TI | A   | R   | C   | I   | I   | I   | I   | I   | I   | \- |


## Exceptions
Exceptions to this policy are likely to occur. Exception requests shall be made by email to the policy owner identified in the [Revision history](#revision_history) and must contain:

- the reason for the request
- risk to DfE of not following the policy
- specific mitigations that will not be implemented
- technical and other difficulties
- date of review


## Threat intelligence definition

Threat Intelligence (TI) refers to data that allows organisations to identify whether a security breach has occurred or understand a threat actor’s motives, targets, movement and attack behaviours. Some examples of common forms of threat intelligence include:

- manual research of threat actor origin and motivation
- research into threat actor ways of working
- IP addresses
- malicious file hashes and malware samples
- email addresses
- domain names


## Threat intelligence categories

To support the threat intelligence objectives outlined above, DfE must collect tactical, operational, and strategic threat intelligence for the following purposes:

- tactical threat intelligence – information about specific indicators of compromise and malware signatures associated with threat actors, for action by developers and operational support teams
- operational threat intelligence – information about the Tactics, Techniques, and Procedures (TTPs) used by threat actors, for the development of counter measures by development and operational security teams
- strategic threat intelligence – provision of high-level overviews of threat landscape, for communication with the senior management team as part of strategic decision-making

DfE will collect threat intelligence from external sources in support of the objectives outlined above, considering factors including (but not limited to):

- relevance of the data (for example, industry sector or threat actor trends)
- reputation of source for quality and timeliness of data
- frequency of updates


## Sources

Threat intelligence should be gathered from a variety of sources:

- industry and government threat intelligence, such as UK’s National Cyber Security Centre (NCSC), Cyber Security Information Sharing Partnership (CiSP) and industry groups such as Warning Advice and Reporting Points (WARP)
- commercial threat intelligence feeds (for example, Digital Shadows, Recorded Future, Team Cymru, VirusTotal)
- internal threat intelligence - Historical data from previous incidents and internal logs and alerts shall be used to enhance threat intelligence and detection
- open-source intelligence - OSINT (for example, MISP-project.org, Spamhaus, Virusshare, Abuse.ch)

Data collected will include:

- known vulnerabilities for example, Common Vulnerabilities and Exposures (CVE)
- zero-day exploits from bug bounty and vulnerability reporting processes
- indicators of compromise (IOCs)
- emerging malware and phishing tactics
- known exploits and tactics, techniques and procedures (TTPs) of key threat actors
- identification of exposed DfE or customer data found on the internet
- identification of fraudulent sites /cyber-squatting

Agreements should also be established for regular intelligence sharing between government departments


## Analysis

Threat intelligence collected should be analysed to:

- aggregate and eliminate duplicate data
- assess the credibility, relevance, reputation and context of the collected intelligence
- prioritise the intelligence, in a timely manner, based on criticality and potential impact


## Communication / distribution

The prioritised and targeted threat intelligence must then be distributed to the relevant stakeholder groups:

- internal teams identified in the responsibility section in this policy
- external partners and third parties (as permitted by data sharing agreements)

The distributed threat intelligence should be clear, concise and provide appropriate information to:

- raise and maintain awareness of the threats to DfE 
- provide detail that enables teams to take appropriate action. For example, record and manage security incidents


## Threat intelligence use

DfE teams should actively use threat intelligence to help manage risk in the following activities.


### Risk management

Threat intelligence should be used to inform the threat assessment and following risk assessment activities of DfE and its projects. Threats identified from the threat assessment shall be fed back to the threat intelligence team for inclusion into the threat intelligence process.


### Threat modelling

Threat intelligence updates must be used during threat modelling as defined by the threat modelling policy, ensuring that development efforts address any new vulnerabilities or attack techniques.

New threats identified during threat modelling must be fed back to the threat intelligence team for inclusion into the threat intelligence process.

During the operational lifecycle, threat intelligence must be used to inform and update threat models whenever there is significant change to the projects mission, threat landscape or technology. This will ensure that projects remain resilient to known threats, with new threats being integrated into the design/maintain/operate life cycle.


### Vulnerability management

Threat intelligence must be fed into vulnerability management processes to ensure that identified vulnerabilities from known threats are detected and addressed within DfE estate soon as practicable.


### Incident management

Threat intelligence must be used to identify high impact threats and determine appropriate detection and response capabilities and activity.

Threat intelligence must be used to guide incident management procedures, providing context to security incidents, and guide security professionals to conduct remediation and recovery activities in real time.

Threat intelligence must be used to develop incident response playbooks that can adapt to emerging threats and attack vectors.

Threat intelligence must be used to inform real-time threat detection and response during the project lifecycle.

Post incident reviews should include opportunities to refine threat intelligence.


### Security monitoring

Threat intelligence must be integrated as real-time feeds into security monitoring systems for continuous monitoring during project lifecycles.

Continuous monitoring and alerting must be implemented using threat intelligence to detect new vulnerabilities, exploits, and anomalies in the project deployments and onward through the operational life.


### Supply chain threat management

Threat intelligence should be included in supply chain risk assessments and should inform procurement and vendor risk management decisions at each phase.

Third-party components and software dependencies should be regularly / continuously monitored using threat intelligence feeds to stay informed of new vulnerabilities and potential threats.

Threat intelligence should be regularly reviewed in the backlog to address third-party risks during sprints.


### End users

Threat intelligence should be used to:

- raise awareness of threats and how they can be identified
- advise users of potential suspicious activity
- guide security awareness education and training


## Data handling and privacy

The following must be considered when using collecting, analysing and sharing threat intelligence:

- compliance with applicable laws and regulations when collecting and sharing threat intelligence data
- anonymisation or masking of sensitive data before sharing externally
- secure storage of threat intelligence data and access based on least privilege and need to know


## Performance monitoring and review

The quality (accuracy and timeliness) of threat intelligence sources and effectiveness of its use within DfE should be regularly assessed to ensure threats are addressed early in project lifecycles.

The effectiveness of threat intelligence should be measured using metrics such as:

- coverage of critical assets by threat intelligence feeds
- number of threats detected and mitigated
- time to detect and respond to incidents

This policy must be reviewed annually or after significant changes to DfE’s mission objectives, threat landscape or significant changes in delivery methodologies.

## Related policies

The following documents are associated with this policy and should also be read as they directly interact with or support the policy:

- [Vulnerability Management Policy](vulnerability_management_policy.md)
- Incident Management Policy
- Security Monitoring Policy
- [Threat Modelling Policy](threat_modelling_policy.md)
- Asset Management Policy (TBC)
- Risk Management Policy (TBC)
- Supplier Management Policy (TBC)


## Revision history and decision records

### Revision table

Each time this document is updated, this table should be updated.

| Date of change | Author             | Review Date          | Version |
| -------------- | ------------------ | -------------------- | ------- |
| 2024-12-17     | Steve Heneghan     | 2025-12-17           | v0.1    |


### Approved by

| Name            | Title     | Date       | Version |
| --------------- | --------- | ---------- | ------- |
| Martin Sivorn   | CISO      | YYYY-MM-DD | v0.1    |      


### Policy updates and decision record

| Decision | Reason for decision | Author (Job title) | Date       |
| -------- | ------------------- | ------------------ | ---------- |
| DECISION | REASON              | AUTHOR (JOB_TITLE) | YYYY-MM-DD |


# Appendix A: Glossary

| Term | Definition |
| ----- | --------- |
| Threat Intelligence | Knowledge about relevant threats that helps mitigate risk by providing a useful context for decision making. Threat Intelligence (TI) refers to data that allows organisations to identify whether a security breach has occurred or understand a threat actor’s motives, targets, movement and attack behaviours. |
| IOCs | Indicators of Compromise. Data used to detect malicious activity, such as IP addresses, domains, and file hashes. | 
| TTPs | The behaviour and methods of a threat actor preparing for and undertaking a cyber-attack. |
| TIP | A system for managing and operationalising threat intelligence. |
| Asset | Anything that can be used to produce value for DfE. This includes information, such as intellectual property or customer data. It encompasses technology, hardware and software, physical locations and financial capital, people, their knowledge and skills. |
| Incident | An occurrence that actually or potentially jeopardizes the confidentiality, integrity, or availability of an information system or the information the system processes, stores, or transmits or that constitutes a violation or imminent threat of violation of security policies, security procedures, or acceptable use policies. |
| Threat | Any circumstance or event with the potential to adversely impact organisational operations, assets, individuals, or the Nation through an information system.<br><br>An event or condition that has the potential for causing asset loss and undesirable consequences. |
| Risk | Possible adverse future outcomes that we can describe in terms of their chances of occurrence, and the impact they would have if realised. An outcome to be avoided (where possible), or minimised through active management. |


# Appendix B: Centre for Internet Security (CIS) safeguards mapping

CIS controls and safeguards covered by this policy.

This policy helps to support all Implementation Group (IG) Safeguards (IG1, IG2 and IG3) in CIS Control (State Control). This table shows which IG Safeguards are covered by this policy.


# Appendix C: Secure by Design Supported Principles and Activities

| Principle | Title | Activities supported by this policy |
| --------- | ------------------------------------ | ----------------------------------- |
| 2         | Sourcing secure technology products  | Managing third-party product security risks<br><br>Discovering vulnerabilities |
| 3         | Adopt a risk driven approach         | Sourcing a threat assessment<br><br>Performing threat modelling<br><br>Performing a security risk assessment<br><br>Responding to and mitigating security risks |
| 5         | Build in detect and respond security | Responding to and mitigating security risks<br><br>Implementing a vulnerability management process<br><br>Discovering vulnerabilities<br><br>Managing observability |
| 7         | Minimise the attack surface          | Performing threat modelling<br><br>Responding to and mitigating security risks<br><br>Implementing a vulnerability management process<br><br>Discovering vulnerabilities<br><br>Managing observability |

