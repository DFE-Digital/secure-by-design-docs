# Controls & Benchmarks

## Benchmarks
Industry Standard Benchmarks are hugely valuable asset for Posture Hardening because it allows DfE to make rely on global expertise while saving the time and resources to develop Policies in-house, meaning that the time to market is much smaller. Also, it is a far better approach to make a single decision around which benchmark to choose than to defend each individual decision for every single policy and implementation.

## Centre for Internet Security

CIS has a large number of industry benchmarks covering most of the major cloud-based technologies. The documentation can be found at https://downloads.cisecurity.org/#/. One of the positives of the CIS Benchmarks is that they are extremely detailed and prescriptive in what needs to happen in order to audit and remediate, the priorities, and the impacts. Where possible, the CIS Benchmarks have been used; where there is no CIS Benchmark available, a custom set of Policies will have been developed by the DCAP team, having done a rudimentary Threat Modelled against the target system.
CIS Benchmarks have some interesting overlays regarding the priorities and impacts of implementing their recommendations. There are 2 levels - L3 & L5 - which relate to the difficulty levels of implementation and the dependency on having available specific Microsoft products. IG1, IG2, and IG3 are CIS 'Implementation Groups'; these are cumulative (ie all controls in IG1 will also be in IG2 and IG3, and all in IG2 will also be in IG3) and relate to the priorities and importance of adopting the recommendations. The ‘Benchmark Standard’ says that every organisation should have at least implemented all IG1 controls as a minimum; so IG1 recommendations are the first phase to be ‘DfE Mandated’. Best Practice is to have implemented all the Controls, so that is the CISD longer-term objective.

## Controls

A 'Control' or 'Use Case' is the manifestation, in Splunk, of a specific Policy against which Compliance is being measured. So Controls, Use Cases, and Policies are effectively all the same thing. For every Control, the output from running the control is either 'Compliant' or 'Non-Compliant'.

## Scores

In order to be more useful, the output from a Control is actually a 'Score'; a score being more granular than simply reporting 'Compliant' or Non-Compliant', since it can hint at the degree of non-compliance. Scores will mean different things in different contexts, but throughout DCAP a score of 100 is perfectly compliant, and a score of 0 is the worst possible where every single test failed. Scores 0 to 99 are non-compliant, but the closer to 100 the better.
For each Control, the Score is calculated from a 'Numerator' and a 'Denominator'. The denominator is the number of things tested, and the numerator is the number of those tests which failed.
There are 2 types of Controls – (a) those which require a single setting or collection of settings to be a certain way for the system or service as a whole, and (b) those which require many users or resources to each have the specified settings. For the former, the denominator is the number of fields that were tested and the numerator is the number of fields that failed the tests. For the latter, each line is either a pass or a fail based on whether it contains 1 or more fields which failed a test, the denominator is the total number of lines that were tested, and the numerator is the number of lines that failed one or more tests.

## DfE Mandated Controls

Every Control has been assigned a level of priority within 3 bands - DfE Mandated, Recommended, Desirable. The designation is largely based on the IG categorisation in the CIS Benchmark docs (DfE Mandated being IG1, etc), but some have been moved depending on CISO’s interpretation of risk based on DfE's usage.

In the first phase, System and Service Owners are expected to be compliant with all of the DfE Mandated Controls that relate to their particular technology. Where they are not, they are expected to remediate, or to demonstrate to the satisfaction of the CISO that the associated risk has been mitigated in a different way. It is very much the intent of CISO for CISD to work with Service Owners to ensure that risk is mitigated and their service status is Compliant.
In later phases and over time, all services will be expected to become compliant with the Controls in all 3 bands.

## Naming of Controls

The name of each Control is based on the source system and the naming in CIS Benchmark v8.
NOTE : Once developed, the Controls will not change name, even if CIS renumber their documents in future versions of the Benchmark. The dashboards will display the equivalent new number for reference, but the Control will retain its original code. For example, the Control named 'M365 001 [CIS 1.1.2]' relates to M365, is in category 1 in the document which relates to "Account / Authentication", and is control 1.1.2.

## Cadence

The configuration data from the underlying systems and services is requested every day at 3am, and sent to Splunk. The Control algorithms run during a period between 4am and 7am.
So the data in the dashboards is updated on a daily basis.
NOTE : By default, new Controls are installed in Splunk without having their Schedule set as enabled. This is to mitigate that, when deploying using the Splunk Victoria Experience, apps are installed on all Search Heads which means that they would run more than once. So each new Control must be manually scheduled in order to make it active.

## DCAP Source Code

With the single above exception of scheduling SavedSearches, ALL of the source code for DCAP is managed in GitHub and deployed from GitHub – in other words, nothing is ever built using the Splunk UI. This is an especially important principle to be continued, since it is VERY bad practice to be developing or changing Splunk apps using the UI.
This practice also allows for the Development and Production versions of the DCAP app to be namespaced and kept separate.
The DCAP GitHub repos contain a lot of tooling to enable efficient development and deployment of the app.


