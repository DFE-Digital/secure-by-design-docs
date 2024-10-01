# Discovering vulnerabilities

The [CDDO discovering vulnerabilities activity section](https://www.security.gov.uk/policy-and-guidance/secure-by-design/activities/discovering-vulnerabilities/) highlights a number of methods that can be used to discover vulnerabilities in step 1. 

DfE CISD has provided a number of tools, templates and guides to help portfolios to cover this section when building and maintaining their services. As outlined on this page.

## Roles and responsibilities



## SAST (Static Analysis Software Testing)

DfE run SAST scans using two main methods, a reusable workflow that implements CodeQL and Semgrep, as well as SonarCloud.

All three of these tools produce output that is collected by CISD across the organisation and ingested into Splunk for analysis in the [Continuous Assurance platform](../Continuous%20Assurance/continuous_assurance.md).

We can therefore show all teams the current state of their code and any open vulnerabilities across, GitHub configuration, SAST, Dependabot and Azure. We are only able to support the above mentioned tools for now, so note that if you choose to use another tool, that data will not be available for you in your Continuous Assurance dashboard and you will need to prove compliance with SbD using data collected by you.


### CISD produced reusable workflow (CodeQL/Semgrep)

SAST scans are an important component that should be introduced during the development and deployment of your application. SAST scans can be run locally with a CLI or IDE tool, but is more likely to be run in a CI/CD pipeline.

CISD have produced a [reusable workflow for running SAST scans in GitHub Actions](https://github.com/DFE-Digital/github-actions/tree/master/sast-reusable-workflow).

The reusable workflow will:

* run semgrep for repositories that are private or internal
* run CodeQL for repositories that are public
* run policy-as-code to assess the security issues of a repo for repositories that are public
* support Ruby, C#/.NET, python, JavaScript/TypeScript, Go, Java, Swift, C/C++

In order to take advanatage of the reusable workflow, simply create a job in your workflow that looks as follows:

```yaml
jobs:
  run-codeql:
    uses: DFE-Digital/github-actions/.github/workflows/reusable-workflow-sast.yml@master
    with:
      language: 'ruby' 
      policy_action: 'break'
      queries: 'security-extended'
    secrets:
      CODEQL_APP_ID: ${{ secrets.CODEQL_APP_ID }}
      CODEQL_AUTHENTICATION_PRIVATE_KEY: ${{ secrets.CODEQL_AUTHENTICATION_PRIVATE_KEY }} 
```

Note that the secrets used by the workflow must be added to your job as shown above, but are already available at the organisation level in DfE-Digital so there is no need to add them to your repository.

[Full documentation can be found in the README](https://github.com/DFE-Digital/github-actions/tree/master/sast-reusable-workflow).


### SonarCloud

SonarCloud can also be used in DfE, there are a number of licences available from the Digital tools and Apprenticeships teams.

Although we do not provide documentation or support for Sonar, we do collect all SonarCloud data for analysis in the Continuous Assurance platform due to the high number of teams using it and the available licences.

## Software Composition Analysis (SCA) / Dependabot

Due to our high usage of GitHub and the fact that GitHub ships with Dependabot for all repositories, we will support the use of Dependabot for SCA. 

[Recommended configuration for Dependabot config files has been produced and added to the DfE technical guidance site](https://technical-guidance.education.gov.uk/standards/storing-source-code/#dependabot-configuration-options).

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
    Central location TBC. We will ingest your JSON output into [the continuous assurance platform](../Continuous%20Assurance/continuous_assurance.md) so you can easily track threats and vulnerabilities in one place.


