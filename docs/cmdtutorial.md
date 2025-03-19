## Steps to run PrimoBrowser or PrimoBeta from the command line (cmd.exe)

__&ndash; Synopsis:__ Sometimes, in order to test/debug issues, or control certain behavior, we want to run Primo from the commandline.
This is also known as Command Prompt, cmd.exe, or the terminal. It allows us to run a program with a set of flags or "arguments",
changing the default behavior of the program internally, in ways that are not allowed or controllable through the UI. This document describes:

1. How to launch cmd.exe
2. How to navigate to where PrimoBrowser (or PrimoBeta) is installed on your system.
3. How to launch Primo with command line arguments
4. The available command line arguments, their syntax, and what they can/should be used for.

### Launching Command Prompt
  There are many ways to do this, and a whole host of ways can be read here > https://www.howtogeek.com/235101/10-ways-to-open-the-command-prompt-in-windows-10/
  However, the easiest way is simply opening the Start Menu and searching for "Command Prompt" or "cmd.exe"
  The icon looks like this: <img src="https://github.com/primo-browser/alex-store/blob/main/imgs/cmd.png" width="42">
  When opened, you will be greeted by a black screen with a blinking cursor. You can type commands in here and they will be run, if the system can
  find the .exe of it.

### Changing to different folders (directories) in Command Prompt
  However, to run Primo, we need to go into the folder/directory that it is installed in. We can use the `cd` command for this (which stands for "change directory").

  To go to where PrimoBrowser is installed:
  ```cmd
  cd %LOCALAPPDATA%\PrimoBrowser\Application
  ```
  (and press Enter)

  To go to where PrimoBeta is installed:
  ```cmd
  cd %LOCALAPPDATA%\PrimoBeta\Application
  ```
  (and press Enter)

  __Technical Note:__ `%LOCALAPPDATA%` is an alias for __C:\Users\\*$USERNAME*\AppData\Local__, and many of you will be familiar with this, since this is where
  the user data dir is stored as well. Specifically:

  `C:\Users\$USERNAME\AppData\Local\PrimoBrowser\Application` -> Where PrimoBrowser is installed (contains .exe, .dll, etc.)  
  `C:\Users\$USERNAME\AppData\Local\PrimoBeta\Application`    -> Same as above but for beta version  
  `C:\Users\$USERNAME\AppData\Local\PrimoBrowser\User Data`   -> Where PrimoBrowser's User Data is stored (contains your history, cookies, cache, profiles, ext, etc.)  
  `C:\Users\$USERNAME\AppData\Local\PrimoBeta\User Data`      ->Same as above but for beta version  

### Running a program (PrimoBrowser.exe)
  Now that you are where `PrimoBrowser.exe` / `PrimoBeta.exe` is actually located (rather than a *shortcut* to it like what you see in your Start Menu), you can run the browser:

  ```cmd
  PrimoBrowser.exe
  (or PrimoBeta.exe)
  ```
  (and press Enter)

  You should see the browser open, or open a new Window if it was already launched.
  Let's close that for now.

### Running Primo with commandline flags
  When running a program, you can add "flags" to it, which modify the programs behavior at runtime.

  Try running this:

  ```cmd
  PrimoBrowser.exe --no-proxy
  ```
  (and press Enter) (If you haven't noticed by now, every command you type into cmd.exe is not actually run until you press Enter).

  The browser should launch, however, you will notice that the Proxy extension is missing, and the browser does not ask for you to log in.  
  Launching it with this flag has disabled the proxy internally!  
  __NOTE:__ Every flag is prepended with "--".

### Using commandline flags for testing
  Now that you know how to do it, multiple command line flags can be appended. Some useful ones that we want all VA's to know how to use is:

  __&#35; Built in Chromium flags inherited by Primo__  
  `--enable-logging`         | Enable logging to a file, by default `chrome_debug.log`, saved in the User Data directory  
  `--enable-logging=stderr`  | Enable logging to the console. You will be able to see live, realtime output in the console of command prompt as the browser is running.

  __&#35; Primo-specific flags I've coded in__  
  `--verbose`                | Enable verbose logging (only useful with one of the above)  
  `--no-updates`             | Disable auto-updater functionality, useful for keeping a build at the same revision, even when re-launching.  
  `--no-proxy`               | Disable proxy functionality, disable log-in.  

  __NOTE to VAs:__ for everyday testing, to capture logging and disable auto-updating to the latest prod build, one should use:

  ```cmd
  PrimoBrowser.exe --no-updates --enable-logging
  (replace with "PrimoBeta" as needed)
  ```
