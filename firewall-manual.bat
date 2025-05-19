@echo off

REM      BATCH FILE

chcp 65001

cls

color 70

ECHO УКАЖИТЕ ДИСК: ПРИМЕР: C

set /p "ddссk1="
set "ddссk2=%ddссk1%:"
%ddссk2%

cd "%ddссk2%\"
:loop
dir
echo Введите путь к директории в которой находятся файлы: ПРИМЕР: Users 

set /p "path1="
echo %path1%
set "path2=%path1%"
echo %path2%
cd %path2%
dir
echo Если в нужном каталоге, то введите 1, а если нет, то 3 и больше.

set /p "var1=" && cls

SET var2=2 && cls

IF %var1% GTR %var2% (
    goto loop

)


REM      BATCH FILE
echo Введите 3 и больше для block ИСХОДЯЩЕГО и block ВХОДЯЩЕГО ДОСТУПА
echo Введите 1 для allow ИСХОДЯЩЕГО и block ВХОДЯЩЕГО ДОСТУПА
echo Введите 2 для allow ИСХОДЯЩЕГО и allow ВХОДЯЩЕГО ДОСТУПА

set /p "var3="

SET var4=2 


IF %var3% GTR %var4% (
    set inn=block
    set outt=block

) ELSE IF %var3% LSS %var4% (
    set inn=block
    set outt=allow

) ELSE (
    set inn=allow
    set outt=allow
)

FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name=" %RANDOM%%RULENAME%-%%~nxG%RANDOM% " dir=in program="%%G" action="%inn%" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name=" %RANDOM%%RULENAME%-%%~nxG%RANDOM% " dir=out program="%%G" action="%outt%" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name=" %RANDOM%%RULENAME%-%%~nxG%RANDOM% " dir=in program="%%G" action="%inn%" enable="yes")
FOR /r %%G in ("*.dll") Do (@echo %%G
NETSH advfirewall firewall add rule name=" %RANDOM%%RULENAME%-%%~nxG%RANDOM% " dir=out program="%%G" action="%outt%" enable="yes")

pause
cls
exit
