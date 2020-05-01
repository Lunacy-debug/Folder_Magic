@echo off
color 0A
title Folder Magic!

:main
color 0A
title Folder Magic - Main Menu - current spamming directory: [%cd%]
cls
echo Select an option:
echo 1. Use the spammer
echo 2. Use the reverser (reverses whatever the spammer creates)
echo 3. Use the random spammer (might crash your computer)
echo 4. Change spamming directory (don't use if you're going to spam in the current directory)
echo 5. Exit
set /p choice= "-> "

if %choice% EQU 1 goto choice1
if %choice% EQU 2 goto choice2
if %choice% EQU 3 goto choice3
if %choice% EQU 4 goto direct
if %choice% EQU 5 exit

:choice1
cls
color 4
title Confirmation
choice /c:yn /n /m "Are you sure you want to proceed? (Y/N)"
if %errorlevel% EQU 1 goto spammer
goto main

:spammer
cls
set /a renum1= 0
color 0A
title Total Spammed: %renum1%, to stop the spamming exit the program or use CTRL+C 
echo Welcome to the folder spammer!
set /p num= "Please select the amount of folders you want to spam: "

FOR /L %%i IN (1,1,%num%) DO (
set renum1= 0
 title Total Spammed: %renum1%, to stop the spamming exit the program or use CTRL+C
  mkdir %%i
 set /a renum1=%renum1%+1
)
cls
set i= %%i
echo Done! %num% folders have been created!

for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
echo [%mydate%:%mytime%]: %num% folders have been created in [%cd%]>> spam_logs.txt

echo.
pause
goto main

:choice2
cls
color 4
title Confirmation
choice /c:yn /n /m "Are you sure you want to proceed? (Y/N)"
if %errorlevel% EQU 1 goto reverse
goto main

:reverse
cls
color 0a
title reversing folders, to stop the spamming exit the program or use CTRL+C 
echo Welcome to the folder spam reverser!
set /p num= "Type in the number of the largest folder in the directory: "

 FOR /L %%i IN (1,1,%num%) DO (
echo Folder number: %%i

 rmdir %%i 
)
cls
echo Done!
echo.
pause
goto main

:choice3
cls
color 4
title Confirmation
choice /c:yn /n /m "Are you sure you want to proceed? (Y/N)"
if %errorlevel% EQU 1 goto rand1
goto main

:rand1
cls
color 0A
title press enter to start spamming! 
echo press enter to start spamming!
pause
echo [%mydate%:%mytime%]: A random folder attack has started in [%cd%]>> spam_logs.txt
goto rand

set /a renum= 0
:rand
cls
title Total Spammed: %renum%, to stop the spamming exit the program or use CTRL+C
mkdir %random%
set /a renum=%renum%+1
goto rand

:direct
cls
color 0A
title Current Active Directory: [%cd%]
echo please type in the directory you want to spam with folders (EX: C:\Windows\System32):
set /p di= "-> "

cd %di%

title Successfully changed to: [%cd%]!

echo.

echo Successfully changed to: [%cd%]!

ping 127.0.0.1 -n 3 > nul

goto main