---
title: "Application Security Standards: Handling files"
summary: Applicaion security standards for handling files in DfE based on ASVS 
authors:
    - Sam Pritchard
date: 2024-10-22
---
# Handling files


| #       | Description                                                                                                                                                                                                                                                                                                                     | ASVS |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---- |
| HF1.0.1 | Apply a suitable file size limit when accepting files from users to prevent potential Denial of Service issues. In cases where the application accepts compressed files, ensure that the size and number of files of the compressed file is also validated.                                                                     | 12.1 |
| HF1.0.2 | Implement a per-user file storage limit.                                                                                                                                                                                                                                                                                        | 12.1 |
| HF1.0.3 | Verify that the file type the application accepts are what it receives. Before processing each file, an assessment should be made to check the extension and the body/content of the file to ensure that the file is what is expected.                                                                                          | 12.2 |
| HF1.0.4 | Filename metadata must be ignored, not used directly with system APIs/libraries and all files must be retrieved using an API or method that prevents the user from manipulating the file path to mitigate OS command injection, Local File Inclusion (LFI), Remote File inclusion (RFI) and Server-Side Request Forgery (SSRF). | 12.3 |
| HF1.0.5 | Ignore filenames in all request parameters and ensure that the `Content-Type` response header is set to `text/plain`, and the `Content-Disposition` response header has a fixed filename.                                                                                                                                       | 12.3 |
| HF1.0.6 | Prevent the application from including and/or executing functionality from untrusted sources such as unverified CDNs, JavaScript libraries, npm libraries, or server-side binaries/scripts.                                                                                                                                     | 12.3 |
| HF1.0.7 | Run antivirus scanners to prevent files containing malware from being processed.                                                                                                                                                                                                                                                | 12.4 |
| HF1.0.8 | Prevent users from being able to download files that could result in information leakage, such as specific files, folders and file types (`.bak`, `.zip`, `.git/`).                                                                                                                                                             | 12.5 |
| HF1.0.9 | Ensure the code in uploaded files is never processed or executed, including for server side code and HTML/JavaScript.                                                                                                                                                                                                           | 12.5 |
