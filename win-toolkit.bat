@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
mode con: cols=160 lines=60
title FLZ TOOLKIT - Windows System Utilities

:main_system
    call :init_system
    call :main

:: ═════════════════════════════════════════════════════════════════
::                     SYSTEM FUNCTIONS
:: ═════════════════════════════════════════════════════════════════

:init_system
    set "USER_INFO=%USERNAME%"
    set "PC_INFO=%COMPUTERNAME%"
    set "DATE_INFO=%date%"
    
    for /f "tokens=3" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild 2^>nul') do set "BUILD=%%i"
    if defined BUILD (
        if !BUILD! GEQ 22000 (
            set "OS_INFO=Windows 11"
        ) else (
            set "OS_INFO=Windows 10"
        )
    ) else (
        set "OS_INFO=Windows"
    )
    
    if defined ProgramFiles(x86) (
        set "OS_INFO=!OS_INFO! 64-bit"
    ) else (
        set "OS_INFO=!OS_INFO! 32-bit"
    )
    
    net session >nul 2>&1
    if %errorlevel%==0 (
        set "ADMIN_ICON=✅"  
        set "ADMIN_INFO=SI"
    ) else (
        set "ADMIN_ICON=⚠️"
        set "ADMIN_INFO=NO"
    )
goto :EOF

:main
    cls
    echo                        ╔══════════════════════════════════════════════════════════════════════════════════════════════╗  
    echo                        ║                                                                                              ║
    echo                        ║                                    ███████╗ ██╗   ██████═╗                                   ║  
    echo                        ║                                    ██╔═══╝  ██║       ██╔╝                                   ║
    echo                        ║                                    █████╗   ██║      ██╔╝                                    ║
    echo                        ║                                    ██╔══╝   ██║     ██╔╝                                     ║
    echo                        ║                                    ██║      ██████╗ ███████╗                                 ║
    echo                        ║                                                                                              ║
    echo                        ╚══════════════════════════════════════════════════════════════════════════════════════════════╝  
    echo.
    echo               ⚙️  Sistema: %OS_INFO%    👤 Usuario: %USER_INFO%    %ADMIN_ICON%  Admin: %ADMIN_INFO%     🗓️  Fecha: %DATE_INFO%    💻 PC: %PC_INFO%
    echo.
    echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
    echo ║                                                                MENÚ PRINCIPAL                                                                   ║ 
    echo ╠═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
    echo ║ ┌─────────────────────────────────┐ ┌─────────────────────────────────┐ ┌─────────────────────────────────┐ ┌─────────────────────────────────┐ ║
    echo ║ │          🔧 SISTEMA 🔧          │ │           🌐  RED  🌐           │ │         🔒 SEGURIDAD 🔒         │ │        🔋 RENDIMIENTO 🔋        │ ║
    echo ║ ├─────────────────────────────────┤ ├─────────────────────────────────┤ ├─────────────────────────────────┤ ├─────────────────────────────────┤ ║
    echo ║ │ [1]  Verificar archivos sistema │ │ [11] Limpiar caché DNS          │ │ [18] Escanear con Defender      │ │ [25] Configurar efectos visuales│ ║
    echo ║ │ [2]  Limpiar archivos temp.     │ │ [12] Ver conexiones activas     │ │ [19] Escanear puertos abiertos  │ │ [26] Configurar plan de energía │ ║
    echo ║ │ [3]  Verificar salud del disco  │ │ [13] Ver adaptadores de red     │ │ [20] Ver usuarios y grupos      │ │ [27] Limpiar inicio de Windows  │ ║
    echo ║ │ [4]  Reparar imagen de Windows  │ │ [14] Configurar perfil de red   │ │ [21] Ver sesiones remotas       │ │ [28] Liberar memoria RAM        │ ║
    echo ║ │ [5]  Escanear errores de unidad │ │ [15] Visualizar datos TCP/IPv4  │ │ [22] Revisar logs de seguridad  │ │ [29] Desfragmentar disco        │ ║
    echo ║ │ [6]  Reparar unidad completa    │ │ [16] Test de conectividad       │ │ [23] Menú de Firewall           │ │                                 │ ║
    echo ║ │ [7]  Limpieza profunda de disco │ │ [17] Escanear puertos abiertos  │ │ [24] Backup de registros        │ │                                 │ ║
    echo ║ │ [8]  Restaurar permisos         │ │                                 │ │                                 │ │                                 │ ║
    echo ║ │ [9]  Desactivar rep. arranque   │ │                                 │ │                                 │ │                                 │ ║
    echo ║ │ [10] Limpiar eventos            │ │                                 │ │                                 │ │                                 │ ║
    echo ║ └─────────────────────────────────┘ └─────────────────────────────────┘ └─────────────────────────────────┘ └─────────────────────────────────┘ ║
    echo ║ ┌─────────────────────────────────┐ ┌─────────────────────────────────┐ ┌─────────────────────────────────────────────────────────────────────┐ ║
    echo ║ │    🔨 PROCESOS Y TAREAS 🔨      │ │     🧩   ACTUALIZACIONES   🧩   │ │                 ⚡    OPCIONES ADICIONALES   ⚡                     │ ║
    echo ║ ├─────────────────────────────────┤ ├─────────────────────────────────┤ ├─────────────────────────────────────────────────────────────────────┤ ║
    echo ║ │ [30] Ver procesos activos       │ │ [34] Buscar actualizaciones     │ │ [M] Mantenimiento automático  [P] Crear punto restauración          │ ║
    echo ║ │ [31] Terminar proceso           │ │ [35] Reiniciar servicio Update  │ │ [I] Información del sistema   [E] Exportar logs del sistema         │ ║
    echo ║ │ [32] Ver servicios de Windows   │ │ [36] Historial de updates       │ │ [H] Ayuda                     [S] Salir                             │ ║
    echo ║ │ [33] Programas instalados       │ │                                 │ │ [R] Reiniciar sistema                                               │ ║ 
    echo ║ └─────────────────────────────────┘ └─────────────────────────────────┘ └─────────────────────────────────────────────────────────────────────┘ ║
    echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
    echo.

:menu_input
    set /p "option=  🟢 Seleccione una opción ➤  "
    if "%option%"=="" goto :menu_input
    call :select_option "%option%"
    goto :main

:select_option
    set "option=%~1"
        REM Sistema
        if "%option%"=="1" call :sfc
        if "%option%"=="2" call :clear_temp
        if "%option%"=="3" call :chkdsk_f
        if "%option%"=="4" call :dism_options
        if "%option%"=="5" call :chkdsk_f
        if "%option%"=="6" call :chkdsk_fr
        if "%option%"=="7" call :disk_cleanup
        if "%option%"=="8" call :reset_permissions
        if "%option%"=="9" call :bcdedit_no
        if "%option%"=="10" call :clear_event_viewer
        
        REM Red
        if "%option%"=="11" call :flush_dns
        if "%option%"=="12" call :show_connections
        if "%option%"=="13" call :show_interface
        if "%option%"=="14" call :network_profile_menu
        if "%option%"=="15" call :configurar_red
        if "%option%"=="16" call :test_connectivity
        if "%option%"=="17" call :scan_ports
        
        REM Seguridad
        if "%option%"=="18" call :defender_scan
        if "%option%"=="19" call :scan_ports
        if "%option%"=="20" call :show_users_groups
        if "%option%"=="21" call :show_remote_sessions
        if "%option%"=="22" call :security_logs
        if "%option%"=="23" call :firewall_menu
        if "%option%"=="24" call :backup_registry
        
        REM Rendimiento
        if "%option%"=="25" call :optimize_visual_effects
        if "%option%"=="26" call :energy
        if "%option%"=="27" call :clean_startup
        if "%option%"=="28" call :free_ram
        if "%option%"=="29" call :defrag
        
        REM Procesos
        if "%option%"=="30" call :show_processes
        if "%option%"=="31" call :kill_process
        if "%option%"=="32" call :show_services
        if "%option%"=="33" call :show_programs
        
        REM Actualizaciones
        if "%option%"=="34" call :check_updates
        if "%option%"=="35" call :start_wuauserv
        if "%option%"=="36" call :update_history
        
        REM Opciones adicionales (mayúsculas y minúsculas)
        if "%option%"=="M" call :mantenimiento
        if "%option%"=="m" call :mantenimiento
        if "%option%"=="P" call :create_restore_point
        if "%option%"=="p" call :create_restore_point
        if "%option%"=="I" call :system_info
        if "%option%"=="i" call :system_info
        if "%option%"=="E" call :export_logs
        if "%option%"=="e" call :export_logs
        if "%option%"=="H" call :show_help
        if "%option%"=="h" call :show_help
        if "%option%"=="R" call :shutdown_system_safe
        if "%option%"=="r" call :shutdown_system_safe
        if "%option%"=="S" call :end
        if "%option%"=="s" call :end
goto :EOF

:: ═══════════════════════════════════════════════════════════════
::                              HELP
:: ═══════════════════════════════════════════════════════════════

:show_help
    cls
    ECHO.
    ECHO                         ⚡ Este es un kit de herramientas para el mantenimiento y reparacion de Windows ⚡ 
    ECHO.
    ECHO.                                                 ⭐ Creado por Felipe Iribas ⭐
    ECHO.
echo ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ 
echo │                                               ❓    INFORMACION DEL SCRIPT   ❓                                                   │ 
ECHO │───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────│
ECHO │ 🟢 1 → sfc /scannow - Verificar integridad archivos sistema     │ ⚪ 20 → net user/localgroup - Ver usuarios y grupos             │
ECHO │ ⚪ 2 → del /s /f /q "temp" - Limpiar archivos temporales        │ 🟢 21 → query session - Ver sesiones remotas activas            │
ECHO │ 🟢 3 → chkdsk C: /f - Verificar y reparar errores de disco      │ ⚪ 22 → EventLog Security - Revisar logs de seguridad           │
ECHO │ ⚪ 4 → DISM /Online /Cleanup-Image - Reparar imagen Windows     │ 🟢 23 → Menu completo de configuracion de Firewall              │
ECHO │ 🟢 5 → chkdsk C: /f - Verificar errores disco                   │ ⚪ 24 → reg export - Crear backup del registro                  │
ECHO │ ⚪ 6 → chkdsk C: /f /r - Verificar errores y sectores           │ 🟢 25 → Optimizar efectos visuales para mejor rendimiento       │
ECHO │ 🟢 7 → cleanmgr /sagerun:1 - Ejecutar limpieza de disco         │ ⚪ 26 → Modificar planes de energia del sistema                 │
ECHO │ ⚪ 8 → icacls /reset - Restablecer permisos de archivos         │ 🟢 27 → Mostrar programas de inicio de Windows                  │
ECHO │ 🟢 9 → bcdedit - Deshabilitar reparacion automatica             │ ⚪ 28 → Liberar memoria RAM del sistema                         │
ECHO │ ⚪ 10 → wevtutil cl - Limpiar registros del Visor Eventos       │ 🟢 29 → defrag C: - Desfragmentar unidad C                      │
ECHO │ 🟢 11 → ipconfig /flushdns - Limpiar cache DNS                  │ ⚪ 30 → tasklist - Mostrar procesos en ejecucion                │
ECHO │ ⚪ 12 → netstat - Mostrar conexiones activas                    │ 🟢 31 → taskkill - Terminar procesos especificos                │
ECHO │ 🟢 13 → netsh interface show - Mostrar adaptadores de red       │ ⚪ 32 → sc query - Ver servicios de Windows                     │
ECHO │ ⚪ 14 → Menu para cambiar perfil de red (Privado/Publico)       │ 🟢 33 → Win32_Product - Ver programas instalados                │
ECHO │ 🟢 15 → Mostrar configuracion de red IPv4                       │ ⚪ 34 → wuauclt /detectnow - Detectar actualizaciones Windows   │
ECHO │ ⚪ 16 → ping - Test de conectividad de red                      │ 🟢 35 → net start wuauserv - Iniciar servicio Windows Update    │
ECHO │ 🟢 17 → Escanear puertos abiertos                               │ ⚪ 36 → Get-HotFix - Mostrar historial de actualizaciones       │
ECHO │ ⚪ 18 → Windows Defender - Escaneo rapido de seguridad          │                                                                 │
ECHO │ 🟢 19 → netstat LISTENING - Analizar puertos abiertos           │                                                                 │
ECHO │─────────────────────────────────────────────────────────────────│─────────────────────────────────────────────────────────────────│
ECHO │ ⚪ M → Ejecuta un mantenimiento automatico de varias funciones  │ ⚪ P → Crear punto de restauracion del sistema                  │
ECHO │ 🟢 E → Exportar logs del sistema al escritorio                  │ 🟢 R → Reinicia el sistema en modo seguro                       │
ECHO │ ⚪ S → Sale de la aplicacion                                    │ ⚪ I → Muestra la informacion del sistema                       │
ECHO │ 🟢 H → Muestra esta pantalla de ayuda                           │                                                                 │
ECHO └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
ECHO.
    echo                                        🏛️  Presione cualquier tecla para volver al menu 🏛️
    pause >nul
GOTO :EOF

:: ═══════════════════════════════════════════════════════════════
::                    FUNCIONES DE SISTEMA
:: ═══════════════════════════════════════════════════════════════

:sfc
    echo.
    echo     ==========================================
    echo     ✅ Ejecutando verificacion de archivos ✅
    echo     ==========================================
    sfc /scannow
    echo.
    echo     ======================================
    echo     ✅ Proceso ejecutado correctamente ✅
    echo     ======================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:clear_temp
    echo.
    del /s /f /q "%temp%\*.*" >nul 2>&1
    echo.
    echo     =====================================
    echo     ✅ Archivos temporales eliminados ✅
    echo     =====================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :eof

:chkdsk_f
    echo.
    echo     ======================================
    echo     ✅ Verificando errores en disco C: ✅
    echo     ======================================
    echo.
    chkdsk C: /f
    echo.
    echo     ==============================
    echo     ✅ Verificacion completada ✅
    echo     ==============================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:chkdsk_fr
    echo.
    echo     =================================================
    echo     ✅ Verificando errores y sectores defectuosos ✅
    echo     =================================================
    echo.
    chkdsk C: /f /r
    echo.
    echo     ==========================================
    echo     ✅ Reparacion completa finalizada ✅
    echo     ==========================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:disk_cleanup
    echo.
    echo     ==========================================
    echo     ✅ Ejecutando limpieza de disco ✅
    echo     ==========================================
    echo.
    start cleanmgr /sagerun:1
    echo.
    echo     ==========================================
    echo     ✅ Limpieza de disco completada ✅
    echo     ==========================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:reset_permissions
    echo.
    echo     ========================================
    echo     ⚠️  RESTABLECER PERMISOS DEL SISTEMA ⚠️
    echo     ========================================
    echo.
    echo     ADVERTENCIA: Esta operacion restablecera todos los
    echo     permisos NTFS a los valores predeterminados del sistema.
    echo.
    echo     Esto puede:
    echo     - Eliminar configuraciones de seguridad personalizadas
    echo.
    set /p confirmacion="     ¿Estas seguro de continuar? (S/N): "
    if /i not "%confirmacion%"=="S" (
        echo.
        echo     Operacion cancelada.
        echo.
        echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
        pause >nul
    GOTO :EOF
    )
    echo.
    echo     ==========================================
    echo     ✅ Restableciendo permisos del sistema ✅
    echo     ==========================================
    echo. 
    start icacls * /T /Q /C /RESET
    echo.
    echo     ==========================================
    echo     ✅ Permisos restablecidos ✅
    echo     ==========================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:bcdedit_no
    echo.
    echo.
    BCDEDIT /SET {CURRENT} RECOVERYENABLED NO
    echo.
    echo     ==========================================
    echo     ✅ Reparacion automatica deshabilitada ✅
    echo     ==========================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:clear_event_viewer
    start wevtutil el | FOR /F "tokens=*" %%G IN ('findstr /v /c:"="') DO wevtutil cl "%%G" >nul 2>&1
    echo.
    echo     ================================
    echo     ✅ Visor de Eventos limpiado ✅
    echo     ================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:dism_options
    DISM /Online /Cleanup-Image /CheckHealth
    DISM /Online /Cleanup-Image /ScanHealth
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo   ==========================================
    echo     ✅ Reparacion de imagen completada ✅
    echo   ==========================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:defrag
    echo.
    echo     ==================================
    echo     ✅ Ejecutando desfragmentación ✅
    echo     ==================================
    defrag C: /r
    echo.
    echo     ==================================
    echo     ✅ Desfragmentacion completada ✅
    echo     ==================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:: ═══════════════════════════════════════════════════════════════
::                    FUNCIONES DE RED
:: ═══════════════════════════════════════════════════════════════

:flush_dns
    echo.
    ipconfig /flushdns
    echo.
    echo     =======================================
    echo     ✅ Cache DNS limpiada correctamente ✅
    echo     =======================================
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:show_connections
    echo.
    echo     ================================
    echo     ✅ Conexiones de red activas ✅
    echo     ================================
    echo.
    netstat -an | findstr ESTABLISHED
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:show_interface
    echo.
    echo     =========================
    echo     ✅ Adaptadores de red ✅
    echo     =========================
    echo.
    netsh interface show interface
    echo.
    echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
    pause >nul
GOTO :EOF

:network_profile_menu
    cls
    echo.
    echo ╔════════════════════════════════════════════════════════════╗
    echo ║                🌐 CONFIGURAR PERFIL DE RED 🌐              ║
    echo ╠════════════════════════════════════════════════════════════╣
    echo ║ [1] Cambiar red a perfil Privado                           ║
    echo ║ [2] Cambiar red a perfil Público                           ║
    echo ║ [3] Ver perfil actual de red                               ║
    echo ║ [0] Volver al menú principal                               ║
    echo ╚════════════════════════════════════════════════════════════╝
    echo.
    set /p "net_option=Seleccione una opción: "

    if "%net_option%"=="1" call :set_private
    if "%net_option%"=="2" call :set_public
    if "%net_option%"=="3" call :show_network_profile
    if "%net_option%"=="0" goto :EOF

goto :network_profile_menu

:set_private
    echo.
    start "Private" powershell -Command "Get-NetConnectionProfile ^| Set-NetConnectionProfile -NetworkCategory Private" >nul 2>&1
    echo.
    echo     ===================================
    echo     ✅ Red configurada como Privada ✅
    echo     ===================================
    echo.
    echo   🛠️ Presione cualquier tecla para continuar 🛠️
    pause >nul
GOTO :EOF

:set_public
    echo.
    start "Public" powershell -Command "Get-NetConnectionProfile ^| Set-NetConnectionProfile -NetworkCategory Public" >nul 2>&1
    echo.
    echo     ===================================
    echo     ✅ Red configurada como Publica ✅
    echo     ===================================
    echo.
    echo   🛠️ Presione cualquier tecla para continuar 🛠️
    pause >nul
GOTO :EOF

:show_network_profile
    echo.
    echo     ===========================
    echo     ✅ Perfil actual de red ✅
    echo     ===========================
    start PowerShell -NoExit -Command "Get-NetConnectionProfile | Format-Table Name,NetworkCategory,IPv4Connectivity -AutoSize"
    echo.
    echo   🛠️ Presione cualquier tecla para continuar 🛠️
    pause >nul
GOTO :EOF

:configurar_red
   SETLOCAL ENABLEDELAYEDEXPANSION
   echo.
   echo     =====================================
   echo     ✅ INFORMACION BASICA DE RED IPv4 ✅
   echo     =====================================
   echo.

   REM Obtener IP
    FOR /F "tokens=2 delims=:" %%a IN ('ipconfig ^| findstr /C:"IPv4 Address"') DO (
    SET "TEMP_IP=%%a"
    IF NOT "!TEMP_IP:~1!"=="" SET "IP=!TEMP_IP:~1!"
)

   REM Obtener Subnet Mask
    FOR /F "tokens=2 delims=:" %%a IN ('ipconfig ^| findstr /C:"Subnet Mask"') DO (
    SET "TEMP_SUBNET=%%a"
    IF NOT "!TEMP_SUBNET:~1!"=="" SET "SUBNET=!TEMP_SUBNET:~1!"
)

   REM Obtener Gateway
    FOR /F "tokens=2 delims=:" %%a IN ('ipconfig ^| findstr /C:"Default Gateway"') DO (
    SET "TEMP_GATEWAY=%%a"
    IF NOT "!TEMP_GATEWAY:~1!"=="" SET "GATEWAY=!TEMP_GATEWAY:~1!"
)

   REM Mostrar información
   ECHO IP: %IP%
   ECHO SUBNET MASK: %SUBNET%
   ECHO GATEWAY: %GATEWAY%
   echo.
   echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
   pause >nul
   GOTO :EOF

:test_connectivity
echo.
echo     ===================================
echo     ✅ Probando conectividad de red ✅
echo     ===================================
ping -n 4 8.8.8.8
echo.
ping -n 4 google.com
echo.
echo     ======================================
echo     ✅ Test de conectividad completado ✅
echo     ======================================
echo.
echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
pause >nul
GOTO :EOF

:system_info
ECHO.
echo     =========================================
echo     ✅ Desplegando ventana de información ✅
echo     =========================================
ECHO.
echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
start cmd /k systeminfo
pause >nul
GOTO :EOF

:scan_ports
echo.
echo     ==================================
echo     ✅ Analizando puertos abiertos ✅
echo     ==================================
echo.
netstat -an | findstr LISTENING
echo.
echo     =====================================
echo     ✅ Analisis de puertos completado ✅
echo     =====================================
echo.
echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
pause >nul
GOTO :EOF

:: ═══════════════════════════════════════════════════════════════
::                    FUNCIONES DE SEGURIDAD
:: ═══════════════════════════════════════════════════════════════

:defender_scan
echo.
echo     =====================================
echo     ✅ Iniciando escaneo con Defender ✅
echo     =====================================
echo.
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
echo.
echo     ======================================
echo     ✅ Escaneo de seguridad finalizado ✅
echo     ======================================
echo.
echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
pause >nul
GOTO :EOF

:show_users_groups
echo.
echo     ====================================
echo     ✅ Usuarios y grupos del sistema ✅
echo     ====================================
echo --- USUARIOS ---
net user
echo.
echo --- GRUPOS ---
net localgroup
echo.
echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
pause >nul
GOTO :EOF

:show_remote_sessions
echo.
echo     ===============================
echo     ✅ Sesiones remotas activas ✅
echo     ===============================
echo.
query session
echo.
echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
pause >nul
GOTO :EOF

:security_logs
echo.
echo     =====================================
echo     ✅ Eventos de seguridad recientes ✅
echo     =====================================
echo.
START "Eventos de seguridad" PowerShell -NoExit -Command "Get-EventLog -LogName Security -Newest 20 | Format-Table TimeGenerated,EventID,Message -Wrap"
echo.
echo   🛠️ Presione cualquier tecla para volver al menu 🛠️
pause >nul
GOTO :EOF

:firewall_menu
cls
   echo.
   echo ╔════════════════════════════════════════════════════════════════╗
   echo ║                      🔒 MENU DE FIREWALL 🔒                    ║
   echo ╠════════════════════════════════════════════════════════════════╣
   echo ║ [1]  Habilitar Firewall en todos los perfiles                  ║
   echo ║ [2]  Deshabilitar Firewall en todos los perfiles               ║
   echo ║ [3]  Ver estado actual del Firewall                            ║
   echo ║ [4]  Ver reglas de entrada activas                             ║
   echo ║ [5]  Ver reglas de salida activas                              ║
   echo ║ [6]  Restablecer Firewall a configuración por defecto          ║
   echo ║ [7]  Bloquear aplicación específica                            ║
   echo ║ [8]  Permitir aplicación específica                            ║                              
   echo ║ [0]  Volver al menú principal                                  ║
   echo ╚════════════════════════════════════════════════════════════════╝
   echo.
set /p "fw_option=Seleccione una opción: "

    if "%fw_option%"=="1" call :enable_firewall
    if "%fw_option%"=="2" call :disable_firewall
    if "%fw_option%"=="3" call :firewall_status
    if "%fw_option%"=="4" call :show_inbound_rules
    if "%fw_option%"=="5" call :show_outbound_rules
    if "%fw_option%"=="6" call :reset_firewall
    if "%fw_option%"=="7" call :block_app
    if "%fw_option%"=="8" call :allow_app
    if "%fw_option%"=="0" goto :EOF

goto :firewall_menu

:enable_firewall
   echo.
   netsh advfirewall set allprofiles state on
   echo.
   echo     ==========================
   echo     ✅ Operación procesada ✅
   echo     ==========================
   echo.
   echo   🛠️ Presione cualquier tecla para continuar 🛠️
   pause >nul
GOTO :EOF

:disable_firewall
   echo.
   netsh advfirewall set allprofiles state off
   echo.
   echo     ==========================
   echo     ✅ Operación procesada ✅
   echo     ==========================
   echo.
   echo   🛠️ Presione cualquier tecla para continuar 🛠️
   pause >nul
GOTO :EOF

:firewall_status
   echo.
   echo     =================================
   echo     ✅ Estado actual del Firewall ✅
   echo     =================================
   echo.
   netsh advfirewall show allprofiles
   echo.
   echo   🛠️ Presione cualquier tecla para continuar 🛠️
   pause >nul
GOTO :EOF

:show_inbound_rules
   echo.
   echo     ============================================
   echo     ✅ Reglas de entrada activas desplegadas ✅
   echo     ============================================
   echo.
   start "Reglas de entrada" cmd /k "netsh advfirewall firewall show rule dir=in name=all"
   echo.
   echo   🛠️ Presione cualquier tecla para continuar 🛠️
   pause >nul
GOTO :EOF

:show_outbound_rules
   echo.
   echo     ===========================================
   echo     ✅ Reglas de salida activas desplegadas ✅
   echo     ===========================================
   echo.
   start "Reglas de entrada" cmd /k "netsh advfirewall firewall show rule dir=in name=all & echo. & echo Presiona cualquier tecla para cerrar & pause >nul & exit"
   echo.
   echo   🛠️ Presione cualquier tecla para continuar 🛠️
   pause >nul
GOTO :EOF

:reset_firewall
   echo.
   echo    =============================================
   echo     ⚠️  Restableciendo Firewall por defecto ⚠️
   echo     ===========================================
   echo.
   netsh advfirewall reset
   echo.
   echo     ==========================
   echo     ✅ Operación procesada ✅
   echo     ==========================
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:block_app
echo.
echo     =====================================
echo     🚫 Bloquear aplicación específica 🚫
echo     =====================================
echo.
set /p "app_path=Ingrese la ruta completa de la aplicación (ej: C:\Program Files\app.exe): "
if not "%app_path%"=="" (
    echo.
    echo Creando regla de bloqueo para: %app_path%
    netsh advfirewall firewall add rule name="Bloquear %app_path%" dir=in action=block program="%app_path%"
    netsh advfirewall firewall add rule name="Bloquear %app_path%" dir=out action=block program="%app_path%"
    echo.
    echo     ========================================
    echo     ✅ Aplicación bloqueada exitosamente ✅
    echo     ========================================
) else (
    echo.
    echo     ==================================
    echo     ❌ No se especificó aplicación ❌
    echo     ==================================
)
echo.
echo   🏛️ Presione cualquier tecla para continuar 🏛️
pause >nul
GOTO :EOF

:allow_app
echo.
echo     =====================================
echo     ✅ Permitir aplicación específica ✅
echo     =====================================
echo.
set /p "app_path=Ingrese la ruta completa de la aplicación (ej: C:\Program Files\app.exe): "
if not "%app_path%"=="" (
    echo.
    echo Creando regla de permiso para: %app_path%
    netsh advfirewall firewall add rule name="Permitir %app_path%" dir=in action=allow program="%app_path%"
    netsh advfirewall firewall add rule name="Permitir %app_path%" dir=out action=allow program="%app_path%"
    echo.
    echo     ========================================
    echo     ✅ Aplicación permitida exitosamente ✅
    echo     ========================================
) else (
    echo.
    echo     ==================================
    echo     ❌ No se especificó aplicación ❌
    echo     ==================================
)
echo.
echo   🏛️ Presione cualquier tecla para continuar 🏛️
pause >nul
GOTO :EOF

:: ═══════════════════════════════════════════════════════════════
::                FUNCIONES DE RENDIMIENTO
:: ═══════════════════════════════════════════════════════════════

:clean_startup
   echo.
   echo     =====================================
   echo     ✅ Programas de inicio de Windows ✅
   echo     =====================================
   echo.
   PowerShell -Command "Get-CimInstance Win32_StartupCommand | Select-Object Name,Command,Location | Format-Table -AutoSize"
   echo.
   echo   ⚠️  Para deshabilitar elementos, use msconfig manualmente
   echo.
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:free_ram
   START "Liberar RAM" PowerShell -NoExit -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers(); [System.GC]::Collect()"
   echo.
   echo     =========================================
   echo     ✅ Optimizacion de memoria completada ✅
   echo     =========================================
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:optimize_visual_effects
cls
   ECHO Desactivar los efectos visuales optimizara el rendimiento del sistema.
   echo.
   echo ╔════════════════════════════════════════════════════════════════╗
   echo ║                🎬 MENU DE EFECTOS VISUALES 🎬                  ║
   echo ╠════════════════════════════════════════════════════════════════╣
   echo ║ [1] Rendimiento maximo (Mínimos efectos visuales)              ║
   echo ║ [2] Equilibrado (Efectos esenciales)                           ║
   echo ║ [3] Máxima calidad                                             ║
   echo ║ [4] Personalizado                                              ║
   echo ║ [0] Salir                                                      ║
   echo ╚════════════════════════════════════════════════════════════════╝
   ECHO.
SET /P visual_choice="🎬 Seleccione una opción ➤  "

    IF "%visual_choice%"=="1" GOTO :performance_mode
    IF "%visual_choice%"=="2" GOTO :balanced_mode
    IF "%visual_choice%"=="3" GOTO :full_effects
    IF "%visual_choice%"=="4" GOTO :custom_mode
    IF "%visual_choice%"=="0" GOTO :EOF
   echo.
   echo     ❌ Opcion no valida. Intente nuevamente.
   pause >nul
   GOTO :optimize_visual_effects

:performance_mode
   ECHO.
   ECHO     =========================================================
   ECHO     ✅ Configuracion de rendimiento aplicada exitosamente ✅
   ECHO     =========================================================
   REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
   REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038000000000 /f
   REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v DisableAnimations /t REG_DWORD /d 1 /f
   REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f
   ECHO.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :optimize_visual_effects

:balanced_mode
   ECHO.
   ECHO     ======================================================
   ECHO     ✅ Configuracion equilibrada aplicada exitosamente ✅
   ECHO     ======================================================
   REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
   REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012078000000000 /f
   REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v DisableAnimations /t REG_DWORD /d 0 /f
   REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "1" /f
   ECHO.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
pause >nul
GOTO :optimize_visual_effects

:full_effects
   ECHO.
   ECHO     =============================================================
   ECHO     ✅ Configuracion de máxima calidada aplicada exitosamente ✅
   ECHO     =============================================================
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9e3e078012000000 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "1" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d "2" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v FontSmoothingType /t REG_DWORD /d 2 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v DropShadows /t REG_SZ /d "1" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v FontSmoothingGamma /t REG_DWORD /d 578 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d "1" /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d "400" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v Composition /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ExtendedUIHoverTime /t REG_DWORD /d 400 /f
   ECHO.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
pause >nul
GOTO :optimize_visual_effects

:custom_mode
   ECHO.
   ECHO     ========================================
   ECHO     ✅ Panel de configuracion desplegado ✅
   ECHO     ========================================
   START SystemPropertiesPerformance.exe
   ECHO.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :optimize_visual_effects

:energy
cls
echo.
   echo.
   echo ╔════════════════════════════════════════════════════════════════╗
   echo ║                      ⚡ MENU DE ENERGÍA ⚡                     ║
   echo ╠════════════════════════════════════════════════════════════════╣
   echo ║ [1] Plan Equilibrado                                           ║
   echo ║ [2] Plan PowerSaver                                            ║
   echo ║ [3] Plan De Alta Performance                                   ║
   echo ║ [4] Mostrar Plan De Energía Actual                             ║
   echo ║ [0] Salir                                                      ║
   echo ╚════════════════════════════════════════════════════════════════╝
echo.
set /p energy_choice="⚡ Seleccione una opción ➤  "

if "%energy_choice%"=="1" goto :balanced
if "%energy_choice%"=="2" goto :power_saver
if "%energy_choice%"=="3" goto :high_performance
if "%energy_choice%"=="4" goto :show_current
if "%energy_choice%"=="0" goto :EOF
echo.
echo     ❌ Opcion no valida. Intente nuevamente.
pause >nul
goto :energy

:balanced
echo.
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
if %errorlevel%==0 (
   echo     ===============================================
   echo     ✅ Plan equilibrado configurado exitosamente ✅
   echo     ===============================================
) else (
    echo Error al activar el plan. Verificando disponibilidad...
    powercfg /duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e
    powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
)
echo.
echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
pause >nul
goto :energy

:power_saver
echo.
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
if %errorlevel%==0 (
   echo     ===============================================
   echo     ✅ Plan PowerSaver configurado exitosamente ✅
   echo     ===============================================
) else (
    echo Error al activar el plan. Verificando disponibilidad...
    powercfg /duplicatescheme a1841308-3541-4fab-bc81-f71556f20b4a
    powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
)
echo.
echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
pause >nul
goto :energy

:high_performance
echo.
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
if %errorlevel%==0 (
   echo     ========================================================
   echo     ✅ Plan de alto rendimiento configurado exitosamente ✅
   echo     =======================================================
) else (
    echo Error al activar el plan. Verificando disponibilidad...
    powercfg /duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
)
echo.
echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
pause >nul
goto :energy

:show_current
echo.
echo        ============================
echo        📋 PLAN DE ENERGIA ACTUAL 📋
echo        ============================
echo.
echo Plan activo:
powercfg /getactivescheme
echo.
echo Todos los planes disponibles:
powercfg /list
echo.
echo.
echo   🏛️ Presione cualquier tecla para continuar 🏛️
pause >nul
goto :energy

:: ═══════════════════════════════════════════════════════════════
::                FUNCIONES DE RED
:: ═══════════════════════════════════════════════════════════════

:test_connectivity
   echo.
   echo     ===================================
   echo     ✅ Probando conectividad de red ✅
   echo     ===================================
   ping -n 4 8.8.8.8
   echo.
   ping -n 4 google.com
   echo.
   echo     ======================================
   echo     ✅ Test de conectividad completado ✅
   echo     ======================================
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:: ═══════════════════════════════════════════════════════════════
::                FUNCIONES DE PROCESOS/TAREAS
:: ═══════════════════════════════════════════════════════════════

:kill_process
   echo.
   echo     ============================
   echo     ✅ Procesos en ejecucion ✅
   echo     ============================
   tasklist | findstr /V "Image Name"
   echo.
    set /p "process_name=Ingrese el nombre del proceso a terminar (ej: notepad.exe): "
if not "%process_name%"=="" (
    echo.
    echo     ========================================
    echo     ✅ Terminando proceso %process_name% ✅
    echo     ========================================
    taskkill /IM "%process_name%" /F
    echo.
    echo     ========================
    echo     ✅ Proceso terminado ✅
    echo     ========================
) else (
    echo No se especificó ningún proceso.
)
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:show_services
   echo.
   echo     ====================================
   echo     ✅ Desplegando servicios y status ✅
   echo     ====================================
   start "Servicios y status" PowerShell -NoExit -Command "Get-Service | Select-Object Name, Status"
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:show_programs
   echo.
   echo     =====================================
   echo     ✅ Desplegando lista de programas ✅
   echo     =====================================
   echo.
   start "Programas instalados" PowerShell -NoExit "Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher | Format-List"
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:update_history
   echo.
   echo     ===================================
   echo     ✅ Historial de actualizaciones ✅
   echo     ===================================
   PowerShell -Command "Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 10 | Format-Table -AutoSize"
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:: ═══════════════════════════════════════════════════════════════
::                FUNCIONES ADICIONALES
:: ═══════════════════════════════════════════════════════════════

:create_restore_point
   echo.
   echo     ====================================
   echo     ✅ Creando punto de restauracion ✅
   echo     ====================================
   start "ToolKit Restore Point" PowerShell -NoExit -Command "Checkpoint-Computer -Description 'FLZ Toolkit Restore Point' -RestorePointType 'MODIFY_SETTINGS'"
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:export_logs
   echo.
   echo     ==================================
   echo     ✅ Exportando logs del sistema ✅
   echo     ==================================

:: Fecha
for /f "tokens=2-4 delims=/.- " %%a in ('echo %date%') do (
    set YYYY=%%c
    set MM=%%a
    set DD=%%b
)
set LOGDATE=%YYYY%%MM%%DD%

:: Output
set OUTDIR=%TEMP%

:: Exportar logs
wevtutil epl System "%OUTDIR%\System_Logs_%LOGDATE%.evtx"
wevtutil epl Application "%OUTDIR%\Application_Logs_%LOGDATE%.evtx"

   echo.
   echo     =====================================
   echo     ✅ Exportacion de logs completada ✅
   echo     =====================================
   echo.
   echo   🏛️ Archivos guardados en: %OUTDIR%
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
goto :EOF



:shutdown_system_safe
   echo.
   echo     ==========================
   echo     ✅ Reiniciando sistema ✅
   echo     ==========================
shutdown /r /t 5 /c "El sistema se reiniciará en 5 segundos"
   echo.
   echo   🏛️ Presione cualquier tecla para cancelar 🏛️
   pause >nul
   shutdown /a
GOTO :EOF

:defrag
   echo.
   echo     ==================================
   echo     ✅ Ejecutando desfragmentación ✅
   echo     ==================================
   defrag C: /r
   echo.
   echo     ==================================
   echo     ✅ Desfragmentacion completada ✅
   echo     ==================================
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:check_updates
   echo.
   echo     ============================================
   echo     ✅ Desplegando ventana de Windows Update ✅
   echo     ============================================
   start ms-settings:windowsupdate
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:start_wuauserv
   echo.
   echo     ========================================
   echo     ✅ Iniciando servicio Windows Update ✅
   echo     ========================================
   echo.
   net start wuauserv
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:show_processes
   echo.
   echo     =====================================
   echo     ✅ Lista de procesos en ejecucion ✅
   echo     =====================================
   start "Procesos activos" cmd /k tasklist
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:show_netstat
   echo.
   echo     ==========================
   echo     ✅ Estadisticas de red ✅
   echo     ==========================
   netstat
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:backup_registry
   echo.
   echo     ==================================
   echo     ✅ Creando backup del registro ✅
   echo     ==================================
   reg export HKLM "%USERPROFILE%\Desktop\Registry_Backup_%date:~-4,4%%date:~-10,2%%date:~-7,2%.reg"
   echo.
   echo     =====================================
   echo     ✅ Backup del registro completado ✅
   echo     =====================================
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:network_diagnosis
   echo.
   echo     ==================================
   echo     ✅ Diagnostico completo de red ✅
   echo     ==================================
   echo.
   echo --- Configuracion IP ---
   ipconfig /all
   echo.
   echo --- Test de conectividad ---
   ping -n 2 8.8.8.8
   echo.
   echo --- Tabla de enrutamiento ---
   route print
   echo.
   echo --- Conexiones activas ---
   netstat -an
   echo.
   echo     ====================================
   echo     ✅ Diagnostico de red completado ✅
   echo     ====================================
   echo.
   echo   🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF

:mantenimiento
   echo.
   echo     ===========================================================
   echo     ✅ Ejecutando mantenimiento automatico en segundo plano ✅
   echo     ===========================================================
   echo.

:: Script Temporal de mantenimiento

set "script_name=mant_%random%.bat"
   echo @echo off > "%temp%\%script_name%"
   echo title Mantenimiento Automatico FLZ >> "%temp%\%script_name%"
   echo cls >> "%temp%\%script_name%"
   echo echo ================================== >> "%temp%\%script_name%"
   echo echo INICIANDO MANTENIMIENTO AUTOMATICO >> "%temp%\%script_name%"
   echo echo ================================== >> "%temp%\%script_name%"
   echo echo. >> "%temp%\%script_name%"
   echo echo -------------------------------------------------------------------------------->> "%temp%\%script_name%"
   echo echo El equipo se reiniciara automaticamente al terminar el proceso de mantenimiento >> "%temp%\%script_name%"
   echo echo -------------------------------------------------------------------------------->> "%temp%\%script_name%"
   echo echo. >> "%temp%\%script_name%"
   echo echo [1/7] Verificacion de archivos del sistema... >> "%temp%\%script_name%"
   echo sfc /scannow >> "%temp%\%script_name%"
   echo echo [2/7] Limpiando archivos temporales... >> "%temp%\%script_name%"
   echo del /q "%%temp%%\*.tmp" ^>nul 2^>^&1 >> "%temp%\%script_name%"
   echo del /q "%%temp%%\*.log" ^>nul 2^>^&1 >> "%temp%\%script_name%"
   echo del /q "%%SystemRoot%%\Temp\*.tmp" ^>nul 2^>^&1 >> "%temp%\%script_name%"
   echo echo Archivos temporales limpiados. >> "%temp%\%script_name%"
   echo echo [3/7] Limpiando cache DNS... >> "%temp%\%script_name%"
   echo ipconfig /flushdns >> "%temp%\%script_name%"
   echo echo [4/7] Limpiando registros de eventos... >> "%temp%\%script_name%"
   echo for /f "tokens=*" %%%%G in ('wevtutil el') do wevtutil cl "%%%%G" ^>nul 2^>^&1 >> "%temp%\%script_name%"
   echo echo [5/7] Limpieza de disco... >> "%temp%\%script_name%"
   echo cleanmgr /sagerun:1 >> "%temp%\%script_name%"
   echo echo [6/7] Liberando memoria RAM... >> "%temp%\%script_name%"
   echo powershell -Command "[System.GC]::Collect()" ^>nul 2^>^&1 >> "%temp%\%script_name%"
   echo echo [7/7] Verificacion de disco... >> "%temp%\%script_name%"
   echo chkdsk C: /scan ^>nul 2^>^&1 >> "%temp%\%script_name%"
   echo echo. >> "%temp%\%script_name%"
   echo echo ========================================== >> "%temp%\%script_name%"
   echo echo ✅ MANTENIMIENTO COMPLETADO ✅ >> "%temp%\%script_name%"
   echo echo ========================================== >> "%temp%\%script_name%"
   echo echo. >> "%temp%\%script_name%"
   echo echo El sistema se reiniciara en 60 segundos... >> "%temp%\%script_name%"
   echo echo Presione CTRL+C para cancelar el reinicio >> "%temp%\%script_name%"
   echo timeout /t 60 /nobreak >> "%temp%\%script_name%"
   echo shutdown /r /t 0 /c "Reinicio automatico por mantenimiento FLZ Toolkit" >> "%temp%\%script_name%"

:: Ejecutar en nueva ventana
start "Mantenimiento FLZ" "%temp%\%script_name%"

   echo         🔧 El equipo se reiniciará automaticamente al terminar el proceso 🔧
   echo.
   echo     🏛️ Presione cualquier tecla para volver al menu 🏛️
   pause >nul
GOTO :EOF
