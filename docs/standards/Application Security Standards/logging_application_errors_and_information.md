---
title: "Application Security Standards: Logging application errors and information"
summary: Applicaion security standards for logging application errors and information in DfE based on ASVS 
authors:
    - Sam Pritchard
date: 2024-10-22
---
# Logging application errors and information

A common logging format must be followed throughout an application, and should ideally follow a DfE standardised logging format.

| #       | Description                                                                                                                                                                                                      | ASVS       |
| ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| LO1.0.1 | Ensure that a common logging format is used that contains a standardised list of values that can help an investigation effectively, [such as those shown in the logging format list example](#logging-format). | 1.7<br>7.1 |
| LO1.0.2 | Ensure that notable security events are logged, [as shown in the log events example](#log-events).                                                                                                             | 7.2        |
| LO1.0.3 | Never log sensitive information into logs, [examples of which can be noted in the secure logging example](#secure-logging).                                                                                    | 7.1        |
| LO1.0.4 | Always transmit logs using secure and encrypted channels, store them using encryption at rest, and if necessary push the events to Splunk.                                                                       | 1.7        |
| LO1.0.5 | Always use logging components that appropriately encode data to prevent log injection attacks.                                                                                                                   | 7.3        |
| LO1.0.6 | Protect security logs from unauthorised access and modification.                                                                                                                                                 | 7.3        |

### Logging format

The log should include:

* a timestamp in [ISO 8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) (`2024-08-19T16:29:55Z`)
* the application name
* the action performed
* the user performing the action (without including any sensitive information)
	* could be IP address, GUID, user ID
* the reason for failure (if known)
* where in the application/infrastructure the error occurred
* whether there is a possible security event or use case relating to the error
* HTTP request IDs
* log level (e.g. INFO, WARN, ERROR, FATAL, DEBUG)

### Log events

Logging should be enabled for [a number of specific security related events as noted in the OWASP Logging CheatSheet](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Logging_Cheat_Sheet.md#which-events-to-log), including but not limited to:

* application errors
* input and output validation failures
* authentication successes and failures
* authorisation failures
* session management failures
* privilege elevation successes and failures
* other higher-risk events, like data import and export
* logging initialisation
* opt-ins, like terms of service

### Secure logging

Always ensure that sensitive information is **never** logged such as:

* personal identifiable information (PII)
* application/infrastructure secrets, keys and certificates
* passwords or failed password attempts
* credit card, bank account or other financial information
* anything else deemed sensitive and/or private 