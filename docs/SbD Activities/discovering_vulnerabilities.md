# Discovering vulnerabilities

The [CDDO discovering vulnerabilities activity section](https://www.security.gov.uk/policy-and-guidance/secure-by-design/activities/discovering-vulnerabilities/) highlights a number of methods that can be used to discover vulnerabilities in step 1. 

DfE CISD has provided a number of tools, templates and guides to help portfolios to cover this section when building and maintaining their services. As outlined on this page.

## Roles and responsibilities

### Service teams and portfolios

It is the service teams and portfolios responsibility to produce secure digital services and to follow good practices when building their services.

Part of building digital services is to ensure that potential vulnerabilities are found and fixed within reasonable timeframes to reduce the risk to the service and data. This should include steps that should be taken in multiple steps within the software development lifecycle to try and discover vulnerabilities and mitigate them.

### CISD

It is CISDs responsibility to provide support, guidance and tooling to digital service teams and portfolios in vulnerability discovery, mitigation planning, vulnerability tracking and risk management. 

CISD will:

* provide SAST tooling, templates and guidance
* provide SCA tooling, templates and guidance
* provide threat modelling tooling, guidance and resource
* provide mitigation plan assistance 
* provide vulnerability management for critical issues
* run a Vulnerability Disclosure Programme
* run vulnerability scans for virtual machines in Azure
* provide assistance and guidance on building DAST scans into CI/CD
* provide guidance and assistance on running penetration tests and producing mitigations for vulnerabilities


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

## Software Composition Analysis (SCA)

### Dependabot

Due to our high usage of GitHub and the fact that GitHub ships with Dependabot for all repositories, we will support the use of Dependabot for SCA. 

[Recommended configuration for Dependabot config files has been produced and added to the DfE technical guidance site](https://technical-guidance.education.gov.uk/standards/storing-source-code/#dependabot-configuration-options).


### Nuget in Azure DevOps

For those using .NET in Azure DevOps, an example template is available to enable Azure pipelines to audit for vulnerabilities in dependencies and then raise alerts and break builds. The dotnet cli has the capability to run the audit, and with some extra PowerShell you can collect that information and produce alerts.

[The full template file can be found in the root of this respository](https://github.com/DFE-Digital/secure-by-design-docs/blob/main/dotnet-dependency-audit-azure-devops.yml).

#### Code snippet
```
[...]
    - task: DotNetCoreCLI@2
      displayName: Dotnet Restore
      inputs:
        command: restore
        projects: |
          $(Build.SourcesDirectory)/**/*.csproj
          !$(Build.SourcesDirectory)/**/*Backup*csproj
          !$(Build.SourcesDirectory)/**/Web/**/*.csproj
          !$(Build.SourcesDirectory)/**/Desktop/**/*.csproj
        vstsFeed: ${{ parameters.NugetFeed }}

   # Recurse all directories to look for potentional csproj files, then run the dotnet command and compare the risk levels against provided threshold parameter
    - task: PowerShell@2
      displayName: Read output
      continueOnError: true # set to false to break builds when vulnerabilities above threshold is found
      inputs:
        targetType: 'inline'
        script: |
          $vulnerablePackages = @()
          $riskLevels = @{
            "Critical" = 4
            "High" = 3
            "Moderate" = 2
            "Low" = 1
          }
          $minRiskLevel = $riskLevels["${{ parameters.DependencyAuditRiskLevel }}"]

          $paths = Get-ChildItem -Path $(Build.SourcesDirectory) -Recurse -Include *.csproj -Exclude *Backup* -Name 
          
          foreach ($path in $paths) {
            Write-Host $path
            $output = dotnet list $(Build.SourcesDirectory)/$path package --vulnerable --include-transitive --format json
            $jsonOutput = $output | Out-String | ConvertFrom-Json

            foreach ($project in $jsonOutput.projects) {
              foreach ($framework in $project.frameworks) {
                foreach ($package in $framework.topLevelPackages + $framework.transitivePackages) {
                  foreach ($vulnerability in $package.vulnerabilities) {
                    $severity = $vulnerability.severity
                    if ($riskLevels[$severity] -ge $minRiskLevel) {
                      Write-Host "##vso[task.logissue type=error]Found vulnerable NuGet package $($package.id) with severity $($vulnerability.severity) at $($vulnerability.advisoryurl)"
                      $vulnerablePackages += $project.path
                    }
                  }
                }
              }
            }
          }

          if ($vulnerablePackages.Count -gt 0) {
            Write-Host "##vso[task.setvariable variable=vulnerablePackages]$($vulnerablePackages -join ',')"
            exit 1
          }
```

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


## Vulnerability scanning

The Vulnerability Management team currently run Qualys vulnerability scans across all Azure Virtual Machines in DfE. The scans are agent based, with the agents automatically being deployed to any VM that is created in our tenancies. 

The VM team will manage the vulnerabilities with teams, and notify teams of critical risk issues over SLA. They will also provide dashboards in the Continuous Assurance platform for teams to view vulnerabilities themselves.


## Penetration testing

Digital services should run regular pen testing to provide assurance that the service is secure, and teams should keep money in their budget for tests every year.

Common testing schedules include:

* before a new service goes live
* when significant changes are made to the codebase or infrastructure
* quarterly
* yearly

CISD are here to advise teams on expected schedules, to risk assess the output from pen tests, and to provide guidance on mitigation plans.


## Peer review (Pull Requests)

Before merging code to production, teams should follow a pull request process managed by strong branch protection rules.

Branch protection rules should include (for example):

* at least one approval before merging
* dismissal of stale approvals when new commits are pushed
* codeowners review requirement
* approval of most recent push
* conversation resolution before merging
* status checks to have passed
* signed commits 

More guidance can be found on the [DfE technical guidance standards](https://technical-guidance.education.gov.uk/standards/storing-source-code/#repository-requirements).