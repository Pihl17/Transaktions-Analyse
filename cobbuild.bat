@echo off 
REM Wrapper til GnuCOBOL på Windows 
REM Sætter include- og lib-stier automatisk 

set COBINC=C:\GnuCobol\include 
set COBLIB=C:\GnuCobol\lib 

REM Tilføj bin-mappen til PATH midlertidigt 
set PATH=C:\GnuCobol\bin;%PATH% 

REM Byg subroutiner
cobc -m "Konverter-til-dkk.cob"

REM Preload subroutiner
set COB_PRE_LOAD=KONVERTER-TIL-DKK

REM Kald cobc med de rigtige flags 
cobc -I"%COBINC%" -L"%COBLIB%" %* 
