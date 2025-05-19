@echo off

:loop
set /p "bbc="

NETSH advfirewall firewall add rule name=" %RANDOM%" dir=in program=%bbc% action="block" enable="yes"
NETSH advfirewall firewall add rule name=" %RANDOM%" dir=out program=%bbc% action="block" enable="yes"

pause
cls
goto loop

