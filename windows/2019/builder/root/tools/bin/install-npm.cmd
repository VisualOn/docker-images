@echo off
PowerShell -noni -nop -c "$ErrorActionPreference = 'Stop'; install-npm.ps1 -Name '%1' -Version '%2'"
if not "%ERRORLEVEL%" == "0" exit /B %ERRORLEVEL%
