rem @echo off 下面的代码都不打印出来
@echo off
REM 检查管理员权限
REM >nul不打印错误信息
REM >nul 2不打印正确信息
REM >nul 2>&1 错误信息也归为正确信息，且不打印
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

rem 权限检测当前errorlevel为 0 的时候是管理员权限
rem NEQ 不等于
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else (
    goto  gotAdmin
)

:UACPrompt
  rem 生成获取权限的vbs
  echo Set UAC= CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
  echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
  "%temp%\getadmin.vbs"
  rem 重新启动bat
  exit /B

:gotAdmin
  rem 移除getadmin.vbs
  if exist "%temp\getadmin.vbs%" ( del "%temp\getadmin.vbs%" )
  rem 已获取到管理员权限，可以在下面添加管理员身份运行的内容
  echo 123
