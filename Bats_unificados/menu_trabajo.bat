@echo off
pushd "%~dp0"
rem PARA EXPANDIR LAS VARIABLES A TODOS LOS ESPACIOS
setlocal enabledelayedexpansion 
rem PARA QUE SE PUEDAN USAR CARACTERES RAROS EN EL CMD 
chcp 65001 
title Bat de trabajo 
rem mode 80,50

:inicio
    cls

    set actual=:menu_principal
    set subRutina=null
    set verif=null

    call :Marca
    call :Model
    call :name_equipo
    call :FechaDate
    call :IpPrint
    call :localEx
    call :revisar_configuracion
    call :update





rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                  MENU PRINCIPAL
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################
:menu_principal
    set subRutina=null
    set op_usuario=""
    set volver=:null
    set actual=:menu_principal
    cls
    call :imagen %actual%
    echo.
    echo    1. PRIMER INICIO           2. WINDOWS 
    echo    3. IMPRESORAS              4. CONFIGURACION APP
    echo    5. CONF RAPIDA             6. VISTA MONITORES
    echo    7. REMOTO PC
    echo.
    echo  ------------------------------------------
    echo  e. Exit                  
    echo.
    echo.
    call :formato " ELIJA UNA OPCION "
    set /p op_usuario=
    if %op_usuario%==1 goto :menu_Primer_inicio
    if %op_usuario%==2 goto :menu_windows 
    if %op_usuario%==3 goto :menu_impresora
    if %op_usuario%==4 goto :menu_configuracion
    if %op_usuario%==5 goto :Configuracion_rapida
    if %op_usuario%==6 goto :menu_vista_monitor
    if %op_usuario%==7 goto :remoto_pc
    if %op_usuario%==8 goto :
    goto :more_if





rem #############################################
rem
rem                                                                                                  MENU windows
rem
rem #############################################


:menu_windows
    set subRutina=null
    set op_usuario=""
    set volver=:menu_principal
    set actual=:menu_windows
    cls
    call :imagen %actual%
    echo.
    ECHO    1. OPCIONES DE ENERGIA                 2. HABILITAR PING
    ECHO.
    ECHO    3. HABILITAR BLOQ NUM                  4. ACTIVAR ESCRITORIO REMOTO
    ECHO.
    ECHO    5. BORRAR TEMPORALES                   6. RAIMVIEWER MENU
    ECHO.
    ECHO    7. DESBLOQUEAR ESCRITORIO              8. BLOQUEAR ESCRITORIO
    ECHO.
    ECHO    9. CAMBIAR LA HORA                    10. CAMBIAR LA FECHA
    ECHO.
    ECHO    11. CAMBIAR NOMBRE DE EQUIPO          12. CAMBIAR DESCRIPCION
    ECHO.
    ECHO    13. CAMBIAR CONTRASENA                14. UPDATE 64 W7 
    ECHO.
    ECHO    15. UPDATE 32 W7                      16. Explorer Full 2.0
    echo.
    echo  ------------------------------------------
    echo  e. Exit                          v. Volver                 
    echo.
    echo.
    call :formato " ELIJA UNA OPCION "
    set /p op_usuario=

    if %op_usuario%==1  call :op_energia
    if %op_usuario%==2  call :hb_ping 
    if %op_usuario%==3  call :act_num
    if %op_usuario%==4  call :act_esc_rem
    if %op_usuario%==5  call :del_temp
    if %op_usuario%==6  call :menu_visor_hi
    if %op_usuario%==7  call :des_escritorio
    if %op_usuario%==8  call :bloq_escritorio
    if %op_usuario%==9  call :set_hora
    if %op_usuario%==10 call :set_fecha
    if %op_usuario%==11 call :set_name_equip
    if %op_usuario%==12 call :set_descrip
    if %op_usuario%==13 call :set_pass_admin
    if %op_usuario%==14 call :update_w7_64
    if %op_usuario%==15 call :update_w7_32
    if %op_usuario%==16 call :Explorer_Full_2_0
    goto :more_if



rem #############################################
rem
rem                                                                                                  MENU impresora
rem
rem #############################################


:menu_impresora
    set subRutina=null
    set op_usuario=""
    set volver=:menu_principal
    set actual=:menu_impresora
    cls
    call :imagen %actual%
    echo.
    call :formato "BARCODE"  
    echo.
    echo     1. BAT VIEJO               2. BAT NUEVO  
    echo.
    call :formato "ESTERILIZACION_RE"
    echo.
    echo    3. DESCATABLE 7x3           4. DESCATABLE 10x1_5
    echo    5. TRAZABLE 7x3             6. TRAZABLE 10x1_5
    echo.
    call :formato "ESTERILIZACION"
    echo.
    echo    7. DESCATABLE 7x3            8. DESCATABLE 10x1_5
    echo    9. TRAZABLE 7x3             10. TRAZABLE 10x1_5
    echo.
    call :formato "GENERAL"
    echo   11. LIMPIAR SPOOL
    echo.
    echo  ------------------------------------------
    echo  e. Exit                          v. Volver 
    echo.
    echo.
    call :formato " ELIJA UNA OPCION "
    set /p op_usuario=
    if %op_usuario%==1 call :bat_viejo
    if %op_usuario%==2 call :bat_nuevo
    if %op_usuario%==3 call :DESCATABLE_7x3_re 
    if %op_usuario%==4 call :DESCATABLE_10x1_5_re
    if %op_usuario%==5 call :TRAZABLE_7x3_re
    if %op_usuario%==6 call :TRAZABLE_10x1_5_re
    if %op_usuario%==7 call :DESCATABLE_7x3 
    if %op_usuario%==8 call :DESCATABLE_10x1_5
    if %op_usuario%==9 call :TRAZABLE_7x3
    if %op_usuario%==10 call :TRAZABLE_10x1_5
    if %op_usuario%==11 call :limpiarSpooler
    goto :more_if





rem #############################################
rem
rem                                                                                                  MENU terminales autogestion
rem
rem #############################################


:menu_Primer_inicio
    set subRutina=null
    set op_usuario=""
    set volver=:menu_principal
    set actual=:menu_Primer_inicio
    cls
    call :imagen %actual%
    echo.
    echo    1. PC                      2. TERMINALES        
    echo.
    echo  ------------------------------------------
    echo  e. Exit                          v. Volver 
    echo.
    echo.
    call :formato " ELIJA UNA OPCION "
    set /p op_usuario=
    if %op_usuario%==1 call :Primer_Inicio
    if %op_usuario%==2 call :Primer_Inicio_Terminales_Autogestion
    goto :more_if    






rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                  MENU CONFIGURACION APP
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################

:menu_configuracion
    set subRutina=null
    set op_usuario=""
    set volver=:menu_principal
    set actual=:menu_configuracion
    cls
    call :imagen %actual%
    echo.
    echo     1. VNC 
    echo.
    echo  ------------------------------------------
    echo  e. Exit                          v. Volver 
    echo.
    echo.
    call :formato " ELIJA UNA OPCION "
    set /p op_usuario=
    if %op_usuario%==1 call :uvnc_ini
    goto :more_if






rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                  MENU windows
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################

:menu_vista_monitor
    set subRutina=null
    set op_usuario=""
    set volver=:menu_principal
    set actual=:menu_vista_monitor
    cls
    call :imagen %actual%
    echo.
    echo.
    ECHO    1. MONITOR PRINCIPAL                   2. MONITOR SECUNDARIO
    ECHO.
    ECHO    3. MONITOR DUPLICADO                   4. MONITOR EXTENDIDO
    ECHO.
    echo  ------------------------------------------
    echo  e. Exit                          v. Volver                 
    echo.
    echo.
    call :formato " ELIJA UNA OPCION "
    set /p op_usuario=

    if %op_usuario%==1  call :monitor_principal
    if %op_usuario%==2  call :monitor_secundario 
    if %op_usuario%==3  call :monitor_duplicado
    if %op_usuario%==4  call :monitor_extendido
    goto :more_if


rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                  MENU Visor HI
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################


:menu_visor_hi
    set subRutina=null
    set op_usuario=""
    set volver=:menu_windows
    set actual=:menu_visor_hi
    cls
    call :imagen %actual%
    echo.
    echo.
    ECHO    1. INSTALAR                   2. BORRAR
    ECHO.
    ECHO    3. ABRIR LINK DE PRUEBA 
    ECHO.
    echo  ------------------------------------------
    echo  e. Exit                          v. Volver                 
    echo.
    echo.
    call :formato " ELIJA UNA OPCION "
    set /p op_usuario=

    if %op_usuario%==1  call :instalar_visor
    if %op_usuario%==2  call :borrar_visor 
    if %op_usuario%==3  call :test_visor
    goto :more_if







rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                  Sub Rutinas
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################


rem : menu_principal
    :Primer_Inicio
        cls
        call :imagen Primer_Inicio
        echo.
        call :set_fecha
        echo.
        call :set_hora
        echo.
        call :set_pass_admin primerInicio
        echo.
        call :set_name_equip
        echo.
        call :set_descrip
        echo.
        call :op_energia primerInicio
        echo.
        call :hb_ping primerInicio
        echo.
        call :act_esc_rem primerInicio
        echo.
        call :act_num primerInicio
        echo.
        call :cuentas_de_usuario
        echo.
        set subRutina=true
        echo.
        call :formato " PRIMER INICIO FINALIZADO "
        
        goto :eof
    :Configuracion_rapida
    echo %actual%
        call :op_energia Configuracion_rapida
        echo.
        call :hb_ping Configuracion_rapida
        echo.
        call :act_esc_rem Configuracion_rapida
        echo.
        call :act_num Configuracion_rapida
        echo.
        set subRutina=true
        echo.
        call :formato " CONFIGURACION RAPIDA FINALIZADA "
        goto :more_if
        
rem : menu_impresora 
    :TRAZABLE_10x1_5_re
        echo.
        call :formato " INICIANDO TRAZABLE_10x1_5 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLTrazable10x1_5.txt \\%dip%\ESTERILIZACION_RE
        copy configuraciones\sato\TestSBPLTrazable10x1_5.txt \\%dip%\ESTERILIZACION_RE
        pause
        set subRutina=true
        goto :eof

    :TRAZABLE_7x3_re
        echo.
        call :formato " INICIANDO TRAZABLE_7x3 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLTrazable7x3.txt \\%dip%\ESTERILIZACION_RE
        copy configuraciones\sato\TestSBPLTrazable7x3.txt \\%dip%\ESTERILIZACION_RE
        pause
        set subRutina=true
        goto :eof

    :DESCATABLE_10x1_5_re
        echo.
        call :formato " INICIANDO DESCATABLE_10x1_5 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLDescarte10x1_5.txt \\%dip%\ESTERILIZACION_RE
        copy configuraciones\sato\TestSBPLDescarte10x1_5.txt \\%dip%\ESTERILIZACION_RE
        pause
        set subRutina=true
        goto :eof

    :DESCATABLE_7x3_re
        echo.
        call :formato " INICIANDO DESCATABLE_7x3 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLDescarte7x3.txt \\%dip%\ESTERILIZACION_RE
        copy configuraciones\sato\TestSBPLDescarte7x3.txt \\%dip%\ESTERILIZACION_RE
        pause
        set subRutina=true
        goto :eof
    :TRAZABLE_10x1_5
        echo.
        call :formato " INICIANDO TRAZABLE_10x1_5 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLTrazable10x1_5.txt \\%dip%\ESTERILIZACION
        copy configuraciones\sato\TestSBPLTrazable10x1_5.txt \\%dip%\ESTERILIZACION
        pause
        set subRutina=true
        goto :eof

    :TRAZABLE_7x3
        echo.
        call :formato " INICIANDO TRAZABLE_7x3 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLTrazable7x3.txt \\%dip%\ESTERILIZACION
        copy configuraciones\sato\TestSBPLTrazable7x3.txt \\%dip%\ESTERILIZACION
        pause
        set subRutina=true
        goto :eof

    :DESCATABLE_10x1_5
        echo.
        call :formato " INICIANDO DESCATABLE_10x1_5 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLDescarte10x1_5.txt \\%dip%\ESTERILIZACION
        copy configuraciones\sato\TestSBPLDescarte10x1_5.txt \\%dip%\ESTERILIZACION
        pause
        set subRutina=true
        goto :eof

    :DESCATABLE_7x3
        echo.
        call :formato " INICIANDO DESCATABLE_7x3 CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPLDescarte7x3.txt \\%dip%\ESTERILIZACION
        copy configuraciones\sato\TestSBPLDescarte7x3.txt \\%dip%\ESTERILIZACION
        pause
        set subRutina=true
        goto :eof

    :bat_viejo
        echo.
        call :formato " INICIANDO BAT VIEJO CON  %dip% "
        echo.
        echo copy configuraciones\sato\rotulo.txt \\%dip%\BARCODE
        copy configuraciones\sato\rotulo.txt \\%dip%\BARCODE
	    pause
        set subRutina=true
        goto :eof

    :bat_nuevo
        call :formato " INICIANDO BAT NUEVO CON  %dip% "
        echo.
        echo copy configuraciones\sato\TestSBPL2.txt \\%dip%\BARCODE
        copy configuraciones\sato\TestSBPL2.txt \\%dip%\BARCODE
        pause
        set subRutina=true
        goto :eof

    :limpiarSpooler
        call :formato " DETENENIENDO EL SERVICIO DE IMPRESION "
	net stop spooler
        cd C:\Windows\System32\spool
        call :formato " ESTAMOS POR LIMPIAR LA COLA DE IMPRESION "
        rd /s /q PRINTERS
        call :formato " INICIANDO EL SERVICIO DE IMPRESION "
        net start spooler
        set subRutina=true
        goto :eof

rem : menu_windows
    :Explorer_Full_2_0
        echo.
        call :formato "Explorer Full 2.0"
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisableCachingOfSSLPages" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "IE5_UA_Backup_Flag" /t REG_SZ /d "5.0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "PrivacyAdvanced" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SecureProtocols" /t REG_DWORD /d "2720" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "User Agent" /t REG_SZ /d "Mozilla/4.0 (compatible; MSIE 8.0; Win32)" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ZonesSecurityUpgrade" /t REG_BINARY /d "86c4dd8499c2d701" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableNegotiate" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MigrateProxy" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonZoneCrossing" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /t REG_SZ /d "http://proxy.hospitalitaliano.net/proxy.pac" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableHttp1_1" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyHttp1.1" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableHTTP2" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnablePunycode" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "UrlEncoding" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisableIDNPrompt" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ShowPunycode" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnPostRedirect" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonBadCertRecving" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache" /v "ContentLimit" /t REG_DWORD /d "330" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache" /v "TotalContentLimit" /t REG_DWORD /d "495" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache" /v "AppContainerTotalContentLimit" /t REG_DWORD /d "1000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache" /v "AppContainerContentLimit" /t REG_DWORD /d "50" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache" /v "Version" /t REG_DWORD /d "4" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Content" /v "CachePrefix" /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Content" /v "CacheVersion" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Content" /v "CacheLimit" /t REG_DWORD /d "337920" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Cookies" /v "CachePrefix" /t REG_SZ /d "Cookie:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Cookies" /v "CacheVersion" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Cookies" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DNTException" /v "CachePrefix" /t REG_SZ /d "DNTException:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DNTException" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Windows\INetCookies\DNTException" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DNTException" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Windows\INetCookies\DNTException" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DNTException" /v "CacheOptions" /t REG_DWORD /d "768" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DNTException" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DNTException" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DOMStore" /v "CachePrefix" /t REG_SZ /d "DOMStore" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DOMStore" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Internet Explorer\DOMStore" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DOMStore" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Internet Explorer\DOMStore" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DOMStore" /v "CacheOptions" /t REG_DWORD /d "8" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DOMStore" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\DOMStore" /v "CacheLimit" /t REG_DWORD /d "1000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieSiteList" /v "CachePrefix" /t REG_SZ /d "EmieSiteList:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieSiteList" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Internet Explorer\EmieSiteList" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieSiteList" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Internet Explorer\EmieSiteList" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieSiteList" /v "CacheOptions" /t REG_DWORD /d "768" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieSiteList" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieSiteList" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieUserList" /v "CachePrefix" /t REG_SZ /d "EmieUserList:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieUserList" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Internet Explorer\EmieUserList" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieUserList" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Internet Explorer\EmieUserList" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieUserList" /v "CacheOptions" /t REG_DWORD /d "768" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieUserList" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\EmieUserList" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\feedplat" /v "CachePrefix" /t REG_SZ /d "feedplat:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\feedplat" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Feeds Cache" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\feedplat" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Feeds Cache" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\feedplat" /v "CacheOptions" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\feedplat" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\feedplat" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompat" /v "CachePrefix" /t REG_SZ /d "iecompat:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompat" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Windows\IECompatCache" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompat" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Windows\IECompatCache" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompat" /v "CacheOptions" /t REG_DWORD /d "777" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompat" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompat" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompatua" /v "CachePrefix" /t REG_SZ /d "iecompatua:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompatua" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Windows\IECompatUaCache" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompatua" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Windows\IECompatUaCache" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompatua" /v "CacheOptions" /t REG_DWORD /d "777" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompatua" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iecompatua" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iedownload" /v "CachePrefix" /t REG_SZ /d "iedownload:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iedownload" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Windows\IEDownloadHistory" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iedownload" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Windows\IEDownloadHistory" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iedownload" /v "CacheOptions" /t REG_DWORD /d "9" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iedownload" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\iedownload" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\IEToEdgeList" /v "CachePrefix" /t REG_SZ /d "IEToEdgeList:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\IEToEdgeList" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\EdgeBho\IEToEdge" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\IEToEdgeList" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\EdgeBho\IEToEdge" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\IEToEdgeList" /v "CacheOptions" /t REG_DWORD /d "768" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\IEToEdgeList" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\IEToEdgeList" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\MSHist012021120920211210" /v "CachePrefix" /t REG_SZ /d ":2021120920211210: " /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\MSHist012021120920211210" /v "CachePath" /t REG_SZ /d "C:\Users\Administrador\AppData\Local\Microsoft\Windows\History\History.IE5\MSHist012021120920211210" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\MSHist012021120920211210" /v "CacheRelativePath" /t REG_SZ /d "Microsoft\Windows\History\History.IE5\MSHist012021120920211210" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\MSHist012021120920211210" /v "CacheOptions" /t REG_DWORD /d "11" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\MSHist012021120920211210" /v "CacheRepair" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Extensible Cache\MSHist012021120920211210" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\History" /v "CachePrefix" /t REG_SZ /d "Visited:" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\History" /v "CacheVersion" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\History" /v "CacheLimit" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\LowCache" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\User Agent\Post Platform" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache" /v "Persistent" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v "SavedLegacySettings" /t REG_BINARY /d "460000000c0000000500000000000000000000002b000000687474703a2f2f70726f78792e686f73706974616c6974616c69616e6f2e6e65742f70726f78792e7061630000000000000000000000000000000000000000000000000000000000000000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v "DefaultConnectionSettings" /t REG_BINARY /d "460000000c0000000500000000000000000000002b000000687474703a2f2f70726f78792e686f73706974616c6974616c69616e6f2e6e65742f70726f78792e7061630000000000000000000000000000000000000000000000000000000000000000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Http Filters\RPA" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "DisplayName" /t REG_SZ /d "Computer" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "PMDisplayName" /t REG_SZ /d "Computer [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "Description" /t REG_SZ /d "Your computer" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "Icon" /t REG_SZ /d "shell32.dll#0016" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005422" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "Flags" /t REG_DWORD /d "33" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "1200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "1400" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "DisplayName" /t REG_SZ /d "Local intranet" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "PMDisplayName" /t REG_SZ /d "Local intranet [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "Description" /t REG_SZ /d "This zone contains all Web sites that are on your organization's intranet." /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "Icon" /t REG_SZ /d "shell32.dll#0018" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005423" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "Flags" /t REG_DWORD /d "219" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "1200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\1" /v "1400" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "DisplayName" /t REG_SZ /d "Trusted sites" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "PMDisplayName" /t REG_SZ /d "Trusted sites [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "Description" /t REG_SZ /d "This zone contains Web sites that you trust not to damage your computer or data." /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "Icon" /t REG_SZ /d "inetcpl.cpl#00004480" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005424" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "Flags" /t REG_DWORD /d "33" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "1200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\2" /v "1400" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "DisplayName" /t REG_SZ /d "Internet" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "PMDisplayName" /t REG_SZ /d "Internet [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "Description" /t REG_SZ /d "This zone contains all Web sites you haven't placed in other zones" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "Icon" /t REG_SZ /d "inetcpl.cpl#001313" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005425" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "Flags" /t REG_DWORD /d "33" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "1200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\3" /v "1400" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "DisplayName" /t REG_SZ /d "Restricted sites" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "PMDisplayName" /t REG_SZ /d "Restricted sites [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "Description" /t REG_SZ /d "This zone contains Web sites that could potentially damage your computer or data." /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "Icon" /t REG_SZ /d "inetcpl.cpl#00004481" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005426" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "Flags" /t REG_DWORD /d "33" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "1200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\4" /v "1400" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\P3P\History" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Passport\LowDAMap" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap" /v "ProxyByPass" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap" /v "IntranetName" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap" /v "UNCAsIntranet" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap" /v "AutoDetect" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hospitalitaliano.net" /v "*" /t REG_DWORD /d "2" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "http" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "https" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "ftp" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "file" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "@ivt" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "shell" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\ProtocolDefaults" /v "knownfolder" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones" /v "SelfHealCount" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones" /v "SecuritySafe" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "DisplayName" /t REG_SZ /d "Computer" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "PMDisplayName" /t REG_SZ /d "Computer [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "Description" /t REG_SZ /d "Your computer" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "Icon" /t REG_SZ /d "shell32.dll#0016" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005422" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "Flags" /t REG_DWORD /d "33" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "1200" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "1400" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "2001" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v "2004" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "DisplayName" /t REG_SZ /d "Intranet local" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "PMDisplayName" /t REG_SZ /d "Local intranet [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "Description" /t REG_SZ /d "Esta zona contiene todos los sitios web que se encuentran en la intranet de su organización." /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "Icon" /t REG_SZ /d "shell32.dll#0018" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005423" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "Flags" /t REG_DWORD /d "219" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1200" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1400" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2500" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2001" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2004" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2707" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2400" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2401" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2402" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1A00" /t REG_DWORD /d "131072" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1402" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1409" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2103" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1407" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2105" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2007" /t REG_DWORD /d "65536" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2000" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1001" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1004" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "270C" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1405" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1201" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "120A" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2201" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2702" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "120B" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1208" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1209" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1803" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1604" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2600" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1802" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1806" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1804" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1601" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2100" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "160A" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2101" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1609" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1607" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1A04" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2300" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2708" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2709" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "120C" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1206" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1608" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2104" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2102" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1606" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "270B" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1406" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "1809" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v "2301" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "DisplayName" /t REG_SZ /d "Sitios de confianza" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "PMDisplayName" /t REG_SZ /d "Trusted sites [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Description" /t REG_SZ /d "Esta zona contiene sitios web que sabe no van a perjudicar el equipo o su información." /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Icon" /t REG_SZ /d "inetcpl.cpl#00004480" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005424" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "CurrentLevel" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Flags" /t REG_DWORD /d "67" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1200" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1400" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2001" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2004" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1001" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1004" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1201" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1206" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1207" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1208" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1209" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "120A" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "120C" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1402" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1405" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1406" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1407" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1408" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1409" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "140A" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "140C" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1601" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1604" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1605" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1606" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1607" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1608" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1609" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "160A" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "160B" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1802" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1803" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1804" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1809" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1812" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A00" /t REG_DWORD /d "131072" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A02" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A03" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A04" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A05" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A06" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A10" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1C00" /t REG_DWORD /d "65536" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2000" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2005" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2007" /t REG_DWORD /d "65536" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2100" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2101" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2102" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2103" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2104" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2105" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2106" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2107" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2108" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2201" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2300" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2301" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2302" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2400" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2401" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2402" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2600" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2700" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2701" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2702" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2703" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2704" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2708" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2709" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "270B" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "270C" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "270D" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "140D" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1806" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2500" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2707" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "120B" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "DisplayName" /t REG_SZ /d "Internet" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "PMDisplayName" /t REG_SZ /d "Internet [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "Description" /t REG_SZ /d "Esta zona contiene todos los sitios web que no situó en otras zonas" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "Icon" /t REG_SZ /d "inetcpl.cpl#001313" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005425" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "CurrentLevel" /t REG_DWORD /d "70912" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "Flags" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1200" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1400" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2001" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2004" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1001" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1004" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1201" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1206" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1207" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1208" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1209" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "120A" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "120C" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1402" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1405" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1406" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1407" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1408" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1409" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "140A" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "140C" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1601" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1604" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1605" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1606" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1607" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1608" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1609" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "160A" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "160B" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1802" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1803" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1804" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1809" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1812" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1A00" /t REG_DWORD /d "131072" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1A02" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1A03" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1A04" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1A05" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1A06" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1A10" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1C00" /t REG_DWORD /d "65536" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2000" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2005" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2007" /t REG_DWORD /d "65536" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2100" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2101" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2102" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2103" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2104" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2105" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2106" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2107" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2201" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2300" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2301" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2302" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2400" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2401" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2402" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2600" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2700" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2701" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2702" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2703" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2704" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2708" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2709" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "270B" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "270C" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "270D" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "140D" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2500" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2707" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "120B" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /ve /t REG_SZ /d "" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "DisplayName" /t REG_SZ /d "Sitios restringidos" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "PMDisplayName" /t REG_SZ /d "Restricted sites [Protected Mode]" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "Description" /t REG_SZ /d "Esta zona contiene sitios web que potencialmente podrían perjudicar el equipo o su información." /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "Icon" /t REG_SZ /d "inetcpl.cpl#00004481" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "LowIcon" /t REG_SZ /d "inetcpl.cpl#005426" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "CurrentLevel" /t REG_DWORD /d "73728" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "Flags" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1400" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2001" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2004" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1001" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1004" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1201" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1206" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1207" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1208" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1209" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "120A" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "120C" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1402" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1405" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1406" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1407" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1408" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1409" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "140A" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "140C" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1601" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1604" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1605" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1606" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1607" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1608" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1609" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "160A" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "160B" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1802" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1803" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1804" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1809" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "180B" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1812" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1A00" /t REG_DWORD /d "65536" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1A02" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1A03" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1A04" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1A05" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1A06" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1A10" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "1C00" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2000" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2005" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2007" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2100" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2101" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2102" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2103" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2104" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2105" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2106" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2107" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2200" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2201" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2300" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2301" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2302" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2400" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2401" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2402" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2600" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2700" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2701" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2702" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2703" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2704" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2708" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2709" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "270B" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "270C" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "270D" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "140D" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2500" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "2707" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4" /v "120B" /t REG_DWORD /d "3" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Anchor Underline" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Cache_Update_Frequency" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Disable Script Debugger" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableScriptDebuggerIE" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Display Inline Images" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Do404Search" /t REG_BINARY /d "01000000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Local Page" /t REG_SZ /d "%%11%%\blank.htm" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Save_Session_History_On_Exit" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Search Page" /t REG_SZ /d "http://go.microsoft.com/fwlink/?LinkId=54896" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Show_FullURL" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Show_StatusBar" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Show_ToolBar" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Show_URLinStatusBar" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Show_URLToolBar" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Use_DlgBox_Colors" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "UseClearType" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "XMLHTTP" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Enable Browser Extensions" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Play_Background_Sounds" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Play_Animations" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "http://go.microsoft.com/fwlink/p/?LinkId=255141" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "ImageStoreRandomFolder" /t REG_SZ /d "mgh5het" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "CompatibilityFlags" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "SearchBandMigrationVersion" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "FullScreen" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Window_Placement" /t REG_BINARY /d "2c0000000200000003000000fffffffffffffffffffffffffffffffffb0700004d000000150c0000dd020000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE10RunOncePerInstallCompleted" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE10RunOnceCompletionTime" /t REG_BINARY /d "ea7bbd516533d801" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE10TourShown" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE10TourShownTime" /t REG_BINARY /d "ea7bbd516533d801" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DownloadWindowPlacement" /t REG_BINARY /d "2c0000000000000000000000ffffffffffffffffffffffffffffffffd8010000e100000058040000c1020000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE11EdgeNotifyTime" /t REG_BINARY /d "c8dce73b5e89d701" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "EdgeReminderRemainingCount" /t REG_DWORD /d "4" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Expand Alt Text" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Move System Caret" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "PlaySounds" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "NscSingleExpand" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "UseThemes" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "GotoIntranetSiteForSingleWordEntry" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Friendly http errors" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Error Dlg Displayed On Every Error" /t REG_SZ /d "no" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "NotifyDownloadComplete" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Check_Associations" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "HideNewEdgeButton" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "HideOpenWithEdgeInContextMenu" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "SmoothScroll" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "UseSWRender" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Enable AutoImageResize" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "EnableAlternativeCodec" /t REG_SZ /d "yes" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Show image placeholders" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "MixedContentBlockImages" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DoNotTrack" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DOMStorage" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Isolation" /t REG_SZ /d "PMIL" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IEAppEolNotificationLastShownTimeStamp" /t REG_BINARY /d "fe6e9b6acd46d901" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE11DefaultsFREConfigUpdateTimestamp" /t REG_BINARY /d "bcbeb192d146d901" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE11DefaultsFRECompletionTime" /t REG_BINARY /d "bcbeb192d146d901" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "OperationalData" /t REG_QWORD /d "0x0d00000000000000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION" /v "Zoom.exe" /t REG_DWORD /d "11000" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION" /v "TeamViewer.exe" /t REG_DWORD /d "11001" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "iexplore.exe" /t REG_DWORD /d "1" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v "LOCALMACHINE_CD_UNLOCK" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_NINPUT_LEGACYMODE" /v "TeamViewer.exe" /t REG_DWORD /d "0" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\WindowsSearch" /v "Version" /t REG_SZ /d "10.0.19041.1052" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\WindowsSearch" /v "User Favorites Path" /t REG_SZ /d "file:///C:\Users\PC\Favorites\\" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\WindowsSearch" /v "UpgradeTime" /t REG_BINARY /d "ea7bbd516533d801" /f
            Reg.exe add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\WindowsSearch" /v "ConfiguredScopes" /t REG_DWORD /d "5" /f
        set subRutina=true
        goto :eof

    :update_w7_32
        echo.
        call :formato "UPDATE W7 64 - MODO SILENCIOSO"
        wusa.exe \\132.1.1.20\windows\Windows7-KB3102810-x86-error8007000e.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4099950-x86_c0646f3cc3b5e380f7992f0fcd36f7dc8956b0e6.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4345459-x86_022e33c702492e68ceec50725fea6fe6bdeba88e.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4474419-v3-x86_0f687d50402790f340087c576886501b3223bec6.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4490628-x86_3cdb3df55b9cd7ef7fcb24fc4e237ea287ad0992.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4516065-x86_662c716c417149d39d5787b1ff849bf7e5c786c3.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4517297-x86_9321421c6bda4a3a3471fb01521f1ef283eeb9e3.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4539602-x86_88331dcdecd5f05d23921d1dc26cf5715099a927.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4575903-x86_5905c774f806205b5d25b04523bb716e1966306d.msu /quiet
        shutdown -r -f -t 5
        set subRutina=true
        goto :eof

    :update_w7_64
        echo.
        call :formato "UPDATE W7 64 - MODO SILENCIOSO"
        wusa.exe \\132.1.1.20\windows\windows7-KB3102810-x64-error8007000e.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4099950-x64_245d5aaf7d50587297825f9176be166c47ad10f7.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4345459-x64_b25787ba69cb98de9f4c82588c306c48d0d2ae9b.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4474419-v3-x64_b5614c6cea5cb4e198717789633dca16308ef79c.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4490628-x64_d3de52d6987f7c8bdc2c015dca69eac96047c76e.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4517297-x64_6c27bad12668a2552e36b1753e913e10d61e88ad.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4539602-x64_977d8a5421d03ba7ddd992ddf79175dddcfb90d4.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows6.1-kb4575903-x64_b4d5cf045a03034201ff108c2802fa6ac79459a1.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\Windows6.1-KB947821-v34-x64.msu /quiet /norestart
        wusa.exe \\132.1.1.20\windows\windows7-KB3102810-x64-error8007000e.msu /quiet
        shutdown -r -f -t 5
        set subRutina=true
        goto :eof

    :cuentas_de_usuario
        echo.
        call :formato "CUENTAS DE USUARIO"
        netplwiz
        set subRutina=true
        goto :eof

    :del_temp
        call :formato " BORRAR TEMPORALES  "
        echo.
        call :formato " QUERES VER LOS USUARIOS DE ESTE EQUIPO? [s-n] "
        set /p r= 
        if not defined op_usuario echo NO ELIGIO NADA. 
        if %r%==s (goto :del_temp_s) else (goto :del_temp_n)
        
        :del_temp_s
            call :list_usuarios
            echo. 
            call :formato " INGRESA EL NOMBRE DEL USUARIO "
            set /p us=
            goto del_temp_fin
        :del_temp_n    
            echo. 
            call :formato " INGRESA EL NOMBRE DEL USUARIO "
            set /p us=
            goto del_temp_fin
        :del_temp_fin    
        echo.
        call :formato " BORRAR TEMPORALES ... ESTO PUEDE DEMORAR "
        echo.
        cd C:\Users\%us%\AppData\Local
        RD /S /q Temp
        
        set subRutina=true
        goto :eof
    :act_esc_rem
        call :formato " ACTIVANDO ESCRITORIO REMOTO  "
        echo.
        call :formato " CAMBIANDO ESTADO DEL SERVICIO "
        echo . 
        sc config RemoteRegistry start= auto
        echo.
        call :formato " INICIANDO SERVICIO "
        echo.
        net start remoteregistry
        echo.
        call :formato " CAMBIANDO LLAVE DEL REGISTRO "
        echo.
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
        echo.
        set subRutina=true
        if exist %1 == "primerInicio" (goto :eof)
        if exist %1 == "Configuracion_rapida" (goto :eof)
       
        goto :eof
    :act_num
        call :formato " ACTIVANDO BLOQ NUMBER POR DEFECTO "
        reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f
        set subRutina=true
        if exist %1 == "primerInicio" (
            goto :eof
            )
        if exist %1 == "Configuracion_rapida" (
            goto :eof
            )
       
        goto :eof
    :hb_ping
        call :formato " HABILITANDO PING "
        if exist "regla_v4.txt" (
            del regla_v4.txt
            )
        netsh advfirewall firewall show rule name="Regla Solvetic PING IPv4" >regla_v4.txt
        FOR /F "tokens=*" %%a IN (regla_v4.txt ) DO (
            if "%%a"=="Nombre de regla:                      Regla Solvetic PING IPv4" (
                echo Ya existe la regla
                echo ----------------------------------
                echo %%a ...
                echo ----------------------------------
                )
            if "%%a"=="Ninguna regla coincide con los criterios especificados." (
                echo ----------------------------------
                echo Habilitando ping ...
                echo ----------------------------------
                netsh advFirewall Firewall add rule name="Regla Solvetic PING IPv4" protocol=icmpv4:8,any dir=in action=allow
                )
        )
        if exist "regla_v4.txt" (
            del regla_v4.txt
            )
        set subRutina=true
        if exist %1 == "primerInicio" (
            goto :eof
            )
        if exist %1 == "Configuracion_rapida" (
            goto :eof
            )
        
        goto :eof
    :op_energia
        call :formato " CONFIGURACION DE ENERGIA "
        echo POWERCFG /CHANGE monitor-timeout-ac 0
        POWERCFG /CHANGE monitor-timeout-ac 0

        echo POWERCFG /CHANGE monitor-timeout-dc 0
        POWERCFG /CHANGE monitor-timeout-dc 0

        echo POWERCFG /CHANGE disk-timeout-ac 0
        POWERCFG /CHANGE disk-timeout-ac 0

        echo POWERCFG /CHANGE disk-timeout-dc 0
        POWERCFG /CHANGE disk-timeout-dc 0

        echo POWERCFG /CHANGE standby-timeout-ac 0
        POWERCFG /CHANGE standby-timeout-ac 0

        echo POWERCFG /CHANGE standby-timeout-dc 0
        POWERCFG /CHANGE standby-timeout-dc 0

        echo POWERCFG /CHANGE hibernate-timeout-ac 0
        POWERCFG /CHANGE hibernate-timeout-ac 0

        echo POWERCFG /CHANGE hibernate-timeout-dc 0
        POWERCFG /CHANGE hibernate-timeout-dc 0

        set subRutina=true
        if exist %1 == "primerInicio" (
            goto :eof
            )
        if exist %1 == "Configuracion_rapida" (
            goto :eof
            )
        
        goto :eof
    :des_escritorio
        call :formato " DESBLOQUEAR ESCRITORIO "
            call :formato " CAMBIANDO LLAVES DE REGISTRO "
                REG DELETE "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /f             
            call :formato " BORRANDO TAREAS PROGRAMADAS "
                SCHTASKS /delete /tn inicio_explorer /f
            call :formato " TERMINANDO PROCESOS DE EXPLORER "
                TASKKILL /IM "explorer.exe" /F
            call :formato " INICIANDO PROCESO DE EXPLORER "
                START explorer.exe
            call :formato " CREANDO TAREA PROGRAMADA PARA EL USUARIOHI "    
                SCHTASKS /create /tn start_explorer_usuariohi /xml "test_explorer.xml"
            call :formato " PROCESO TERMINADO "    
                
                set subRutina=true
                goto :eof
    :bloq_escritorio
        call :formato " BLOQUEANDO ESCRITORIO "
            call :formato " CAMBIANDO LLAVES DE REGISTRO "
                REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktop /t REG_DWORD  /d 00000001 /f
            call :formato " TERMINANDO PROCESOS DE EXPLORER"    
                taskkill /IM "explorer.exe" /F
            call :formato " INICIANDO PROCESOS DE EXPLORER"
                start explorer.exe
                
                set subRutina=true
                goto :eof
    :set_hora
        call :formato " INGRESE LA HORA EN EL SIGUIENTE FORMATO HH:MM AM/PM"
        set /P hour=
        time %hour%
        set subRutina=true
        goto :eof
    :set_fecha
        call :formato " INGRESE LA FECHA EN EL SIGUIENTE FORMATO DD/MM/AAAA "
        set /P date=
        date %date%
        set subRutina=true
        goto :eof
    :set_pass_admin
        if exist %1 == "primerInicio" (
            call :formato " INGRESE LA CONTRASEÑA DEL USUARIO ADMINISTRADOR "
            net user "Administrador" *
            goto :eof

            )
        call :list_usuarios
        call :formato " SELECCIONE EL USUARIO AL QUE LE QUIERE CAMBIAR LA CONTRASEÑA "
        set /p newUsuario=
        net user "%newUsuario%" *
        
        set subRutina=true
        goto :eof
    :set_name_equip
        call :formato " ingrese el nuevo nombre de la pc "
        set /P name=
        wmic computersystem where caption="%computername%" call rename name=%name%
        set subRutina=true
        goto :eof
    :set_descrip
        call :formato " INGRESE DESCRIPCION DE LA PC EN EL SIGUIENTE FORMATO : EDIFICIO - PISO - SECTOR - OFICINA "
        set /P desc=
        net config server /srvcomment:"%desc%"
        set subRutina=true
        goto :eof
    :andy
        call :formato " andyyyyyy "
        
        start \\193.4.0.180\taller\Andy.wav
        
        set subRutina=true
        goto :eof
    :explorer
        call :formato "explorer.reg"
        pause
        start \\193.4.0.180\taller\Bat\"Explorer Full 2.0.reg"
        pause
        set subRutina=true
        goto :eof    

rem : menu_configuracion
    :uvnc_ini
        set URLPF="C:\Program Files\UltraVNC"
        set URLPF86="C:\Program Files (x86)\UltraVNC"
        set Inicial=%CD%\configuraciones\VNC

        if exist %URLPF% (
            rem echo EXISTE  
            call :configuracion_vnc %URLPF%
            goto :eof

            )
        if exist %URLPF86% (
            rem echo EXISTE 
            call :configuracion_vnc %URLPF86%
            goto :eof
            )
        :configuracion_vnc
            SET "STRING=%~1"
            rem echo %1
            rem echo !STRING!
            call :formato "APAGANDO SERVICIO VNC"
            net stop uvnc_service
            call :formato "COPIANDO CONFIGURACION VNC"
            robocopy %Inicial% "%STRING%" /e  /z /r:0 /w:0 
            call :formato "INICIANDO SERVICIO DEL VNC"
            sc config uvnc_service start= auto
            net start uvnc_service
            set subRutina=true
            goto :eof

rem : menu_terminales
    :Primer_Inicio_Terminales_Autogestion
        cls
        call :imagen Primer_Inicio_Terminales_Autogestion
        echo.
        call :set_fecha
        echo.
        call :set_hora
        echo.
        call :set_name_equip
        echo.
        call :set_descrip
        echo.
        call :op_energia primerInicio
        echo.
        call :hb_ping primerInicio
        echo.
        call :act_esc_rem primerInicio
        echo.
        call :act_num primerInicio
        echo.
        set subRutina=true
        echo.
        call :formato " PRIMER INICIO FINALIZADO "
        
        goto :eof

rem : menu_vista_monitor
    :monitor_principal
        echo.
        DisplaySwitch.exe /internal
        echo DisplaySwitch.exe /internal
        set subRutina=true
        goto :eof        
    :monitor_secundario
        echo.
        DisplaySwitch.exe /external
        echo DisplaySwitch.exe /external
        set subRutina=true
        goto :eof     
 
    :monitor_duplicado
        echo.
        DisplaySwitch.exe /clone
        echo DisplaySwitch.exe /clone
        set subRutina=true
        goto :eof     

    :monitor_extendido
        echo.
        DisplaySwitch.exe /extend
        echo DisplaySwitch.exe /extend
        set subRutina=true
        goto :eof     

rem : menu_visor_hi
    :instalar_visor
        echo.
        "\\193.4.0.180\taller\PROGRAMAS\VisorHI\Visor RAIM 2021\RVPack_SM_HIBA_PRO_v2_8_4_0.exe"
        set subRutina=true
        goto :eof  

    :borrar_visor
        echo.
        "C:\Users\Public\RVU\Uninstall.exe"
        set subRutina=true
        goto :eof          

    :test_visor
        echo.
        start chrome "http://raimweb.hospitalitaliano.net/rvdeploy/index.html?OpenModel=RIS&ConfSrv=http://raimweb.hospitalitaliano.net/raimserver6/RAIMweb.aspx&ConfUsr=ConfUsr&ConfPass=ConfPass&RefSrv=HI_PACS&amp;User=ris&AccessionNumber=10925413"
        set subRutina=true
        goto :eof   









rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                  UPDATE
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################




:update
    cls
    set subRutina=true
    set actual=Actualizacion
    call :imagen %actual%
    if exist "dia.txt" (
        FOR /F " tokens=* " %%a IN (dia.txt ) DO (
            if "%%a" equ "%dates% " (
                rem echo entro en EQU = igual
                call :update2
                goto :eof
                 
                ) 
                echo %date% > dia.txt
                rem echo salta a automatico
                set respuesta=s
                
                call :respuestaUpdate
                goto :eof
            )
        )
     if not exist "dia.txt" (
        rem log del dia
        echo %dates% > dia.txt
        rem echo salta a automatico
        set respuesta=s
        
        call :respuestaUpdate
        goto :eof
        )
    :update2
        call :formato " QUIERE ACTUALIZAR [s/n] "
        set /p respuesta=
        rem echo %respuesta%
        :respuestaUpdate 
        if "%respuesta%"=="s" (
            if !actualizar!==true (
                rem log del dia
                echo %dates% > dia.txt
                if exist "use.txt" (del use.txt)
                if exist "use1.txt" (del use1.txt)
                if exist "use2.txt" (del use2.txt)
                net use > use.txt
                FOR /F "tokens=1,2,3 skip=6 delims=" %%a IN (use.txt ) DO (
                    if not "%%a"=="Se ha completado el comando correctamente." (
                        echo %%a>>use1.txt
                        )
                    )
                if exist "use.txt" (del use.txt)

                if exist "use1.txt" (
                    FOR /F "tokens=1,2,3" %%a IN (use1.txt) DO (
                        echo %%b>>use2.txt
                        )
                    )
                if exist "use1.txt" (del use1.txt)
                
                if exist "use2.txt" (
                    set ipc=\\193.4.0.180\IPC$
                    FOR /F %%a IN (use2.txt) DO (
                        if %%a==!ipc! (NET USE "%Sv%"\IPC$ /delete)
                        )
                    )
                if exist "use2.txt" (del use2.txt)
                
                NET USE "%Sv%"\IPC$ /u:server\!uc! 
                
                robocopy "%Sv%%ActulizarURL%" "%CD%" /e /MIR /z /r:0 /w:0 
                
                NET USE "%Sv%"\IPC$ /D

                call :revisar_configuracion
                )   
            
            if !actualizar!==false (
                call :formato " ACTUALIZACION DENEGADA "
                
                )
            
            cls
            goto :eof
        )
        if "%respuesta%"=="n" (
            goto :eof
            )
        call :formato " DEBE DE INGRESAR UNA RESPUESTA VALIDA SI:s -- NO:n "
        goto :update2





rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                  sub rutinas Variables
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################


:more_if
    :set op_usuario=%~1
        if %subRutina% == true goto %actual%
        if not defined op_usuario echo NO ELIGIO NADA. & echo. & pause & goto %actual%
        if %op_usuario%=="" echo NO ELIGIO NADA. & echo. & pause & goto %actual%
        if %actual%==:menu_principal (if %op_usuario%==v goto:volver_fail )
        if %op_usuario%==e goto :exi 
        if %op_usuario%==E goto :exi 
        if %op_usuario%==EXIT goto :exi 
        if %op_usuario%==exit goto :exi 
        if %op_usuario%==v goto %volver%
        if %op_usuario%==V goto %volver% 

    rem **********************************************************************************    
    rem llamados rapidos de sub rutinas
        if %op_usuario%==version call :version & goto %actual%
        if %op_usuario%==creditos call :creditos & goto %actual%
        if %op_usuario%==config call :config & goto %actual%
        if %op_usuario%==update call :update & goto %actual%
        if %op_usuario%==fix call :fix & goto %actual%
        if %op_usuario%==del_temp call :del_temp & goto %actual%
        if %op_usuario%==inicio call :Primer_Inicio & goto %actual%
        if %op_usuario%==andy call :andy & goto %actual%
        if %op_usuario%==andy call :explorer & goto %actual%
        if %op_usuario%==visorhi call :visorhi & goto %actual%
        if %op_usuario%==visorhi-delete call :visorhidelete & goto %actual%
        if %op_usuario%==visorhi-test call :visorhitest & goto %actual%
        if %op_usuario%=="explorer full" call :Explorer_Full_2_0 & goto %actual%


    rem **********************************************************************************    
    rem llamados rapidos de menus
        if %op_usuario%==menu_principal goto :menu_principal 
        if %op_usuario%==menu_windows goto :menu_windows 
        if %op_usuario%==menu_impresora goto :menu_impresora
        echo    ERROR:LA OPCION ELEGIDA NO ES VALIDA {%op_usuario%}
        goto %actual%


rem                                                 #############################################
rem                                  #############################################
rem                 #############################################
rem #############################################
rem
rem                                                                                                 Comandos Finales
rem
rem #############################################
rem                 #############################################
rem                                    #############################################
rem                                                 #############################################


:exi
    cls
    call :imagen
    echo.
    echo.
    echo.
    echo    GRACIAS POR USAR EL MENU DE TRABAJO
    echo.
    echo    -----------------------BARTENDER----
    echo.
    echo.
    pause
    exit /b

:Volver_fail
    cls
    call :imagen
    echo.
    echo.
    call :formato " A DONDE QUERES VOLVER ?? ESTE ES EL MENU PRICIPAL "
    echo.
    pause nul
    goto %actual%

:revisar_configuracion
    FOR /F "tokens=1,2 delims=:" %%a IN (config.bt) DO (
        if %%a==actualizar (set actualizar=%%b)
        if %%a==uc (set uc=%%b)
        if %%a==version (set version=%%b)
        if %%a==desarrollo (set desarrollo=%%b)
        if %%a==caracter (set caracter=%%b)
        if %%a==ActulizarURL (set ActulizarURL=%%b)
        if %%a==Sv (set Sv=%%b)
        )
    goto :eof

:list_usuarios

    if exist "user.txt" (del user.txt)
    if exist "user1.txt" (del user1.txt)
    if exist "user2.txt" (del user2.txt)
    net user > user.txt
    FOR /F "tokens=1,2,3 skip=4 delims=" %%a IN (user.txt ) DO (
        if not "%%a"=="Se ha completado el comando correctamente." (         
            echo %%a>>user1.txt
            )
        )
    if exist "user.txt" (del user.txt)

    FOR /F "tokens=1,2,3" %%a IN (user1.txt) DO (
    echo %%a>>user2.txt
    echo %%b>>user2.txt
    echo %%c>>user2.txt
        )
    if exist "user1.txt" (del user1.txt)

    ::set count=0
    for /F %%a in (user2.txt) do (
        if not "%%a"=="ECHO" (
            ::set /a count+=1
            echo * - %%a
            )
        )
    if exist "user2.txt" (del user2.txt)
    goto :eof

:remoto_pc    
    echo.
    :inicio_remoto
        call :formato " INGRESE *_IP_* DEL PC REMOTO "
        set /p IP_REMOTO=
        echo.
        call :formato " INGRESE *_USUARIO_* PC REMOTO "
        set /p USUARIO_REMOTO=
        echo.
        "%~dp0/configuraciones/Remoto/psexec.exe" \\%IP_REMOTO% -U %USUARIO_REMOTO% cmd.exe
        echo.
        call :formato " FINALIZANDO LA SESION REMOTA.. "
        echo.
        timeout /t 2 /nobreak>>nul

    :fin
        set subRutina=true
        goto :more_if 

:config
    cls
    echo.
    FOR /F "tokens=*" %%a IN (config.bt) DO (
        echo %%a
        )
    echo.
    pause nul
    goto :eof

:fix
    cls
    echo.
    FOR /F "tokens=*" %%a IN (fix.bt) DO (
        echo %%a
        )
    echo.
    pause nul
    goto :eof

:version
    cls
    echo.
    call :formato " VERSION : !Version! "
    echo.
    pause nul
    goto :eof

:creditos
    cls
    echo.
    echo    #######################
    echo.
    echo    Desarrollo  : !desarrollo!
    echo    Version     : !Version!
    echo.
    echo    #######################
    echo.
    pause nul
    goto :eof

:imagen
    echo  #########################################
    echo.
    echo                   ^.----^.         #   Ubicacion   :   %1
    echo      ^.----------^. ^| == ^|         #   Version     :   %version% 
    echo      ^|^.-''''''-^.^| ^|----^|         #   Fecha       :   %dates%
    echo      ^|^|        ^|^| ^| == ^|         #   
    echo      ^|^|   HI   ^|^| ^| == ^|         #   IP          :   %dip%
    echo      ^|^|        ^|^| ^|----^|         #   Nombre      :   %name_host%
    echo      ^|'-......-'^| ^|::::^|         #   Marca       :   %MarcaPC%
    echo      `''^)----^(''` ^|____^|         #   Modelo      :   %ModelPC%
    echo     /::::::::::::\^"  \ ^"         #
    echo    /:::========:::\   \          #
    echo   /''''''''''''''''\  '-'        #
    echo.
    echo  #########################################
    echo.
    goto :eof

:largoString
    SETLOCAL        
    SET "STRING=%~1"
    :: Empieza el contador en 0
    IF "%TMPVAR%"=="" SET/A CONT=0
    :: Si no se mandan parametros salimos
    IF NOT DEFINED STRING ENDLOCAL & EXIT/B 1 
    ::
    :: Extracción de caracteres que aumenta en 1
    CALL SET "VAR=%%STRING%:~%CONT%,1%%"
    ::
    IF DEFINED VAR (
        :: Sumamos el contador y llamamos a la funcion
        SET "TMPVAR=$" & SET/A CONT+=1 & CALL %~0 "%STRING%"
    ) ELSE (
        ::Declaramos la variable len
        CALL SET LEN=%%CONT%%
    )
    ENDLOCAL & SET "LEN=%LEN%"
    goto :eof

:formato
    rem para pasar a largoString
    SET "frase=%~1"
    rem set frase== %1 
    set /a flag=1
    set signo=!caracter!

    call :largoString %1 rem esto devuelve LEN
    :formato2
        if %flag% neq %LEN% (
            set /a flag+=1
            set signo=!signo!!caracter!
            goto :formato2
            )
        if %flag% equ %LEN% (
            if %verif%=="true" (
                echo %frase% 
                goto :eof
                )
            )
            if %actual%==:menu_impresora (
                echo %frase% & echo !signo!
                goto :eof
                )
            if %actual%==:menu_principal (
                echo %frase% & echo !signo!
                goto :eof
                )
            if %actual%==:menu_windows (
                echo %frase% & echo !signo!
                goto :eof
                )

            echo !signo! & echo. & echo %frase% & echo. & echo !signo!
            goto :eof
        )

:localEx
    rem verificamos que la ejecucion se realize de forma local y no desde el servidor
    set R=%0
    set R1=%R:~1,14%
    rem echo %R%
    if "%R1%" == "\\193.4.0.180\" (
        echo.
        echo PARA PODER UTILIZAR TODAS LAS FUNCIONES DEBE DE EJECUTAR LOCALMENTE.
        echo.
        pause
        exit /B
        ) 

:FechaDate
    rem set dia=%date:~0,2% 
    rem set mes=%date:~3,2% 
    rem set year=%date:~6,4% 
    set dates=%date%
    goto :eof

:IpPrint
    set "i=0.0.0.0"
    set "j="
    for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (
      if not defined j for %%b in (%%a) do set "i=%%b" & set "j=1")
    endlocal & set "dip=%i%"
    goto :eof

:name_equipo
    for /f "tokens=*" %%a in ('hostname') do (
      set name_host=%%a
      )
    goto :eof

:Marca
    for /f "tokens=* skip=1" %%a in ('wmic csproduct get vendor') do (
        rem echo %%a
        set MarcaPC=%%a
        goto :eof
      )

:Model 
  for /f "tokens=* skip=1" %%a in ('wmic csproduct get name') do (
        rem echo %ModelPC%
        set ModelPC=%%a
        goto :eof
      )


