echo off
cls
IF NOT EXIST EZR.EXE GOTO WRONGDSK
goto START
:WRONGDSK
cls
echo �
echo �   Can not find MouseWare installation files
echo �
pause
goto theend
:START
cls
echo �
echo �    loading Install files...
echo �
ezr -i inst
if errorlevel 2 goto theend
if errorlevel 1 goto testmse
goto theend
:testmse
IF NOT EXIST COMCHECK.EXE GOTO WRONGDSK
mouse > nul
if errorlevel 4 goto ps2err
if errorlevel 2 goto serial2
if errorlevel 1 goto buserr
logimenu > nul
click > nul
mtest
goto theend
:serial2
mouse ser 2 >nul
if errorlevel 1 goto sererr
logimenu
click
mtest
goto theend
:DISKERR
cls
echo �
echo �   Can not find MouseWare installation files
echo �
goto testmse
:BUSERR
cls
echo �
echo �        Your Bus Version mouse is not responding...
echo �
echo �        Please re-check the mouse cable connection
echo �        and Bus board installation (see Chapter 1, How
echo �        To Install Your Mouse, in the "Getting Started"
echo �        booklet).
echo �
goto theend
:PS2ERR
cls
echo �
echo �        Your Serial-PS/2 mouse is not responding...
echo �
echo �        Please re-check the mouse cable connection.
echo �        (see Chapter 1, How To Install Your Mouse,
echo �        in the "Getting Started" booklet).
echo �
goto theend
:SERERR
comcheck
pause
:theend
echo on

