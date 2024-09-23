# Continuous Assurance

## Overview

Continuous Assurance is a DfE CISD initiative aimed at constant automated measuring of the Compliance of the Security Posture of key technologies against Policy. The objective is to minimise the possibility of key infrastructure and services being compromised, by quickly identifying, remediating and mitigating any compliance breaches and divergence from Policies and standards -  Security Posture Hardening.

The route is to check configuration against pre-selected policies, architectures and settings, where possible using industry standards and recognised best practice. This gives Service Owners a daily view of status, and allows management to track compliance and  progress on mitigation.

## Security Posture Hardening

This focus on 'Protect' is a key tool in preventing compromises by making it difficult for a prospective actor to find a way into the systems. Other CISD initiatives concentrate on other phases of the process, such 'Detect' (identifying signs that a compromise has occurred, which happens in the SOC), 'Respond', and 'Recover'.

## Foundational Systems

A Foundational System is a technology or system that, were it to be compromised, the workings of the whole DfE would be critically impaired inside a week.
Using this definition, an initial 5 Services were chosen as being Foundational, inasmuch as if any of them was to be taken out, then none of the other DfE Services would continue to operate. Azure, Entra Active Directory, DNS, GitHub, and M365 are the chosen initial Foundational Systems. 

Note : DNS is hosted in AWS, so the actual Controls relate to the department's AWS accounts and configurations.
Note : Applications built by Services inside Microsoft Azure might be extremely important and even critical to the department, but compromise of them would probably not lead to taking down the entire department. So the scope of the Controls is limited to the Azure infrastructure itself because if we lost the Azure platform then by extension we would also have lost all of the Service Applications that run on the platform, and that might in turn compromise the entire department.

## Digital Services & Portfolios

