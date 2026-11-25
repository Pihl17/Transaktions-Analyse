@echo off 
SETLOCAL
REM Tjekker om alle input variabler er cobol filer
for %%f in (%*) do (
    set var=%%f
    if [%%f]==[] goto :wrongfile
    if [%%~xf]==[] goto :wrongfile
    if not %%~xf==.cob goto :wrongfile
    dir %%f /b >nul 2>nul || goto :wrongfile
)

REM Wrapper til GnuCOBOL på Windows 
REM Sætter include- og lib-stier automatisk 
set COBINC=C:\GnuCobol\include 
set COBLIB=C:\GnuCobol\lib

REM Tilføj bin-mappen til PATH midlertidigt 
set PATH=C:\GnuCobol\bin;%PATH% 

REM Opret bin mappen
if not exist bin (
    md bin
)

REM Byg og preload subroutiner
for /f "tokens=1,2 delims=," %%a in (project\Subroutines.txt) do (
    if [%%b]==[] (cobc -m "%%a.cob" -o "./bin/%%a.dll" || Exit 1) else (cobc -m "%%b/%%a.cob" -o "./bin/%%a.dll" || Exit 1)
    REM preloading af subroutinerne skal gøres udenfor for loopet
    REM ellers vil miljøvariablet ikke blive ændret ordenligt
    set var=%%a
    call :preloadsubroutine
)

REM Kald cobc med de rigtige flags 
for %%f in (%*) do (
    cobc -I"%COBINC%" -L"%COBLIB%" -x %%f -o "bin\%%~nf.exe" || Exit 1
)
ENDLOCAL
goto :eof

REM Funktion for at preloade subroutines
:preloadsubroutine
set COB_PRE_LOAD=%var%;%COB_PRE_LOAD%
goto :eof

REM Giver fejl-besked og stopper scriptet
:wrongfile
echo Error for input %var%: Input argument doesn't match a cobol file
Exit 1