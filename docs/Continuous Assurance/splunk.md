# Splunk

## Splunk Access



## Posture Dashboard

This dashboard is for Senior Management - it provides a view of overall Compliance with DfE Mandated Controls for each of the Foundational Services. The objective is to be a starting point for drilling down to understand specific issues.

The Dashboard shows a single panel for each Foundational Service. The level of compliance will be displayed either be as an 'absolute' (ie `X` of `Y`) or a 'percentage' (ie `N%`), where `Y` is the total number of Controls tested for that Service, and `X` is the number that passed the tests (ie are Compliant). 

In order to change to/from absolute/percentage - click 'show filters' at the top, and the options will appear.

Clicking on any of the Tiles will open the Service Dashboard for the chosen Service in a new browser tab.

## Service Dashboard

This dashboard is for the Service Owners; the technical teams responsible for remediation. It shows the list of all the Controls, their Scores, and their compliance statuses.

The top row is the overall Compliance situation for the Service as a whole. This will be displayed either be as an 'absolute' (ie `X` of `Y`) or a 'percentage' (ie `N%`). In order to change to/from absolute/percentage - click 'show filters' at the top, and the options will appear. The filters also offer the option to change to view the compliance status of a different Foundational Service.

The description text below the Service status says "`<service>` Compliant of `#` DfE Mandated Controls"... so, when the display is 'absolute', the 2nd number (`Y`) is the total number of Controls for the Service that are DfE Mandated. The first number (`X`) is the number of Controls for the Service that are DfE Mandated and the status is 'Compliant'.

The 2nd row shows the name of the Service, and below, in [], is the total number of Controls that are monitored for that Service. This will include CIS Controls, DfE Controls, and any other Controls from any source that are relevant to the Service.

Also on the 2nd row are the 'Show Only' checkboxes, which are both clear by default. By checking either or both of these boxes, the Controls listed in the table below is reduced to include only Non-Compliant `+/-` DfE Mandated Controls. The `[]` number of Controls to the left will change according the number in the list below ie according to the filter. The numbers in the Service status row will be unaffected by these filters.

The 3rd row is the list table of the Controls for the Service, filtered as above. 

The columns 'Score' and 'Compliance Status' are colour coded as follows : 

* Compliant = Green
* DfE Mandated & Non-Compliant = Red
* Recommended & Non-Compliant = Orange
* Desirable & Non-Compliant = White

By default, the rows are sorted so that all the DfE Mandated Controls are at the top, then Recommended, then Desirable. Within each of these categories, the Non-Compliant Controls are at the top.

Clicking anywhere on a row will open the Detail Dashboard in a new browser tab, and the context will automatically be set to the Control that was clicked.

## Detail Dashboard

This dashboard is intended for the person responsible for understanding and remediating individual non-compliance issues; it shows the field level details about the tests that were run for a single Control, the expected results, and what needs to be changed in order to comply.

??? note "The dashboard will only work if it is passed the id of a Control, so it can only really be used by a click through from the Service Dashboard."
    Manually adding the Control ID to the URL is another way of setting the target control for the dashboard (in the format `?tkn_use_case_id=m365_001_cis_1-1-2` or `?tkn_use_case_id=dns_dfe_2-0`).

The Dashboard displays different details depending on the source of the Benchmark - for Controls based on the CIS Benchmarks, the detail fields in the dashboard will show description and other metadata taken from the benchmark document. For DfE Custom Controls developed by Threat Modelling, the fields will come from the Control itself and there will be no reference to the CIS fields.

The Score is calculated from the 'numerator' (Tests Failed in this Control) / 'denominator' (Number of Tests in this Control), expressed as a percentage. 
The 'Underlying Data' panel shows what was returned by the underlying system's API when the posture data was requested. The panel labelled 'Compliance' gives details of exactly what field settings are expected for each line item in the 'Underlying Data' panel. Fields with a red background have been determined to be problematic (Non-Compliant) and need to be remediated. The dashboard is intended to be extremely detailed in explaining what the tests expected and which items of data were deemed to require remediation.

For CIS Benchmark Controls, the dashboard includes details of IG status and which 'CIS Navigator Critical Security Controls' match.

## Menus

There is a default Menu for users of the DCAP Splunk App - in the top-left of the browser tab. Each of the Dashboards described can be accessed via the menu.

By default, every user will be taken to the DCAP Home dashboard when they open the app or log into Splunk. DCAP Home is effectively a ‘router’; it analyses the user’s role and then routes them to the page most relevant to that individual or their Service.
