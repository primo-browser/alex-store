## Allowing and using PowerShell scripts

__Premise:__ In addition to `cmd.exe` (Command Prompt) which many of you now know how to use, Windows has a more advanced command-line environment called PowerShell (`powershell.exe`).  
This allows us to write more complex scripts (a .ps1 file) to achieve goals that wouldn't be possible in cmd.exe. This is fine, however for security, running PowerShell scripts is disabled by default.  
This document describes how to allow them, and how to run them. You will need these skills to be able to run a script that will automatically tell you the exact amount of Total RAM usage for PrimoBrowser, PrimoBeta, and Insomniac.

### 1. Opening PowerShell as Administrator
 - To make changes to the policy, we must have privileges.  
 Search the Start Menu for "powershell".  
  Note that there will be more than one entry. Do not select the "Windows Powershell (x86)", or any of the "ISE" ones. The first (and highlighted) result in this image is the correct one.  
 Click "Run as Administrator" (Important).

 <img src="https://github.com/primo-browser/alex-store/blob/main/imgs/searching_for_powershell.png" width="500">

### 2. Changing the execution policy
 - Now we must allow running scripts on the machine. Copy this, and then you can paste it into PowerShell with `Ctrl + V`.

 ```cmd
 Set-ExecutionPolicy RemoteSigned
 ```
 (and press Enter)

 As you can see in the image below, you must now press "__Y__" and Enter to confirm yes to changing the policy.

 <img src="https://github.com/primo-browser/alex-store/blob/main/imgs/set_execution_policy.png" width="500">

 - As long as no errors occur, you should have succeeded in allowing powershell scripts to run.

### 3. Running a .ps1 script

 Method 1: Right click a `.ps1` script file and click "Run with PowerShell"

 Method 2. Open PowerShell where the file is located, and simply type the name + Enter to run it.
