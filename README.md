# IF NOT WORK VARIANT WITH "firewall.bat"

YOU SEE TO ALLOW BLOCK OPTIONS FOR BLOCK OR ALLOW RULES


> @echo off

> 
> 
> :loop

> set /p "bbc="
> 
> NETSH advfirewall firewall add rule name=" %RANDOM%" dir=in program=%bbc% action="block" enable="yes"
>
> NETSH advfirewall firewall add rule name=" %RANDOM%" dir=out program=%bbc% action="allow" enable="yes"
>
> pause
> cls
> goto loop


CLS && CLS & CLS
