
@echo off

:: BatchGotAdmin
:--------------------------------------
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
 
if '%errorlevel%' NEQ '0' (
    echo ���ڻ�ȡ����ԱȨ��......
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


title ClassIsland���½ű�
cd %~dp0
@rem ������д���ClassIsland·��
SET gf=D:\ClassIsland\ClassIsland.exe

if exist history.txt (
    echo ���������£�
    echo ��������������´�ɾ��history.txt����ļ�
    pause
    exit
)
if exist classisland.exe (
    if exist %gf% (
        echo ��ʼ����
        taskkill /f /im classisland.exe >nul
        del %gf% /Q >nul
        copy classisland.exe %gf% /Y >nul
        echo ˵�������¼�¼���ڷ�ֹ�󴥣�ɾ�����ļ����Ա��ⵯ��������ʾ�� >history.txt

        echo �Ѹ���
        pause
        exit
    ) else (
        echo ����ClassIslandĿ¼·������
        echo �����Ǵ��ھɰ汾CI��·��Ŷ
        pause
        exit
    )
) else (
    echo ����ClassIsland�����ļ������ڣ�
    pause
    exit
)