
@echo off

:: BatchGotAdmin
:--------------------------------------
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
 
if '%errorlevel%' NEQ '0' (
    echo 正在获取管理员权限......
    goto UACPrompt
) else ( goto gotAdmin )
 
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
 
    "%temp%\getadmin.vbs"
    exit /B
 
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:new


title ClassIsland更新脚本
cd %~dp0
@rem 下面填写你的ClassIsland路径
SET gf=D:\ClassIsland\ClassIsland.exe

if exist history.txt (
    echo 你已是最新！
    echo 如果不是那请你下次删除history.txt这个文件
    pause
    exit
)
if exist classisland.exe (
    if exist %gf% (
        echo 开始更新
        taskkill /f /im classisland.exe >nul
        del %gf% /Q >nul
        copy classisland.exe %gf% /Y >nul
        echo 说明：更新记录用于防止误触，删除本文件可以避免弹出更新提示。 >history.txt

        echo 已更新
        pause
        exit
    ) else (
        echo 错误：ClassIsland目录路径错误！
        echo 必须是存在旧版本CI的路径哦
        pause
        exit
    )
) else (
    echo 错误：ClassIsland更新文件不存在！
    pause
    exit
)