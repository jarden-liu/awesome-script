rem @echo off ����Ĵ��붼����ӡ����
@echo off
REM ������ԱȨ��
REM >nul����ӡ������Ϣ
REM >nul 2����ӡ��ȷ��Ϣ
REM >nul 2>&1 ������ϢҲ��Ϊ��ȷ��Ϣ���Ҳ���ӡ
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

rem Ȩ�޼�⵱ǰerrorlevelΪ 0 ��ʱ���ǹ���ԱȨ��
rem NEQ ������
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else (
    goto  gotAdmin
)

:UACPrompt
  rem ���ɻ�ȡȨ�޵�vbs
  echo Set UAC= CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
  echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
  "%temp%\getadmin.vbs"
  rem ��������bat
  exit /B

:gotAdmin
  rem �Ƴ�getadmin.vbs
  if exist "%temp\getadmin.vbs%" ( del "%temp\getadmin.vbs%" )
  rem �ѻ�ȡ������ԱȨ�ޣ�������������ӹ���Ա������е�����
  echo 123
