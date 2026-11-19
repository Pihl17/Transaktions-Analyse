@echo off
SETLOCAL
REM Sætter lokation af subroutine moduler så programmet kan finde dem
set COB_LIBRARY_PATH=%~dp0bin;%COB_LIBRARY_PATH%

REM Køre programmet
bin\Build.exe
ENDLOCAL