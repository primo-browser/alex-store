## Allowing and using PowerShell scripts

Premise: In addition to `cmd.exe` (Command Prompt) which many of you now know how to use, Windows has a more advanced command-line environment called PowerShell (`powershell.exe`). 
This allows us to write more complex scripts (a .ps1 file) to achieve goals that wouldn't be possible in cmd.exe. This is fine, however, for security, running PowerShell scripts is disabled by default. 
This document describes how to allow them, and how to run them. You will need these skills to be able to run a script that will automatically tell you the exact amount of Total RAM usage for PrimoBrowser, PrimoBeta, and Insomniac.

### 1. Opening PowerShell as administrator
 - To make changes to the policy, we must have priveleges.
 Search the Start Menu for "powershell". Note that there will be more than one entry. Do not select the "Windows Powershell (x86)", or any of the "ISE" ones.
