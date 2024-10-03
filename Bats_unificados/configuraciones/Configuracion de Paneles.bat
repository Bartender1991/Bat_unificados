@echo off
color A
 :inicio
SET var=0
cls
echo ########################################################
echo .
echo . Menu de instalacion de Paneles
echo . 
echo .
echo ########################################################

echo  %DATE% ^| %TIME%
echo ------------------------------------------------------------------------------
echo  1    PANEL LLAMADOR  
echo  2    PANEL DE TURNOS 
echo  3    PANEL DASHBOARD 
echo  4    CAMBIAR DESCRIPCION 
echo  5    Salir
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Seleccione una opcion [1-4]:

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:op1
    echo.
    echo. Has elegido la opcion No. 1
    echo.
        xcopy "C:\Paciente\paneles.bat" /A/I/C "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
	start explorer.exe "shell:common startup"
        color A
    echo.
    pause
    goto:inicio

:op2
    echo.
    echo. Has elegido la opcion No. 2
    echo.
        xcopy "C:\Numerico\paneles.bat" /A/I/C "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" /Y
	start explorer.exe "shell:common startup"
        color A
    echo.
    pause
    goto:inicio

:op3
    echo.
    echo. Has elegido la opcion No. 3
    echo.
        xcopy "C:\DB\dashboard.bat" /A/I/C "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" /Y
	start explorer.exe "shell:common startup"
        color A
    echo.
    pause
    goto:inicio

:op4
    echo.
    echo. Has elegido la opcion No. 4
    echo.
        start  control sysdm.cpl
        color A
    echo.
    pause
    goto:inicio
  
:salir
    @cls&exit
 
