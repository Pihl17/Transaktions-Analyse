@echo off 
SETLOCAL
REM Wrapper til GnuCOBOL på Windows 
REM Sætter include- og lib-stier automatisk 

set COBINC=C:\GnuCobol\include 
set COBLIB=C:\GnuCobol\lib 

REM Tilføj bin-mappen til PATH midlertidigt 
set PATH=C:\GnuCobol\bin;%PATH% 

REM Byg og preload subroutiner
for /f "tokens=* delims=" %%s in (Subroutines.txt) do (
    cobc -m "%%s.cob"
    REM Preloading of subroutines has to be done outside of the for loop
    REM Otherwise the environment variable won't be properly updated
    set var=%%s
    call :preloadsubroutine
)

REM Kald cobc med de rigtige flags 
cobc -I"%COBINC%" -L"%COBLIB%" %* 
ENDLOCAL
goto :eof

:preloadsubroutine
set COB_PRE_LOAD=%var%;%COB_PRE_LOAD%
goto :eof