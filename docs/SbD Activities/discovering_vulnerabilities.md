# Discovering vulnerabilities

The [CDDO discovering vulnerabilities activity section](https://www.security.gov.uk/policy-and-guidance/secure-by-design/activities/discovering-vulnerabilities/) highlights a number of methods that can be used to discover vulnerabilities in step 1. 

DfE CISD has provided a number of tools, templates and guides to help portfolios to cover this section when building and maintaining their services. As outlined on this page.

## SAST (Static Analysis Software Testing)

SAST scans are an important component that should be introduced during the development and deployment of your application. SAST scans can be run locally with a CLI or IDE tool, but is more likely.


## Threat modelling

Threat modelling is an activity that helps services to discover potential threats to their systems in the early design stages of their product. It will save time in the long term by forcing you to think about security in the early stages. 

We can use frameworks such as [STRIDE](https://owasp.org/www-community/Threat_Modeling_Process#stride) or [DREAD](https://threat-modeling.com/dread-threat-modeling/) to help us categorise the threats and guide mitigation plans, but the main output of threat models should be a [mitigation plan](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html#response-and-mitigations) that gives the development team well defined tasks that will mitigate their applications against the potential threats that were highlighted in the sessions.

The [OWASP Threat Modelling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html) is a great resource to help you understand the threat modelling process.

### Frequency

DfE CISD encourage all services to conduct threat modelling as regularly as possible, depending on the capacity of the team. If the team has no security resource available, and you are unable to use a security architect due to time-constraints, then you may only be able to threat model once a year, or whenever you have significant new features or changes. However, it would be beneficial to teams if threat models are done more frequently.

Threat models could be conducted:

* every sprint
* every significant change
* every new feature
* once a year


### Tools

There are a number of tools available for threat modelling, CISD recommend the use of [SecureFlag's Threat Canvas](https://www.secureflag.com/threat-canvas). We have obtained a limited number of licences of SecureFlag for our secure development training, and a licence will also include Threat Canvas.

The tool does not require any prior training, and takes advantage of a lot of automation, allowing any developer or architect to build a basic threat model relatively easily. 

You can:

* describe your service and app architecture in free text
* upload terraform
* upload application code

Once a basic diagram has been created, you can ask the tool to adjust any changes you want to make, or to run analysis (if it hasn't already).

Outputs include:

* a PDF document with your threats
* a JSON file with machine readable outputs

??? warning "Once your threat model is complete, please provide CISD with your JSON output"
    Central location TBC. We will ingest your JSON output into [the continuous assurance platform](Continuous%20Assurance/continuous_assurance.md) so you can easily track threats and vulnerabilities in one place.


