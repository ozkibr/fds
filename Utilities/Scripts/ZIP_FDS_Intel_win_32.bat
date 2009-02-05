@echo off

Rem Batch file used to create a self-extracting archive containing FDS

set version=upload_test
set revision=r3202

set bin=d:\bin

Rem --------- should not need to edit lines below ------

set togoogle=to_google
set fdsdir=fds_%version%_%revision%_win32

copy ..\Makefile\Intel_Win_32\fds5_win_32.exe %togoogle%\fds5.exe

echo
echo winzipping distribution directory
cd %togoogle%
wzzip -a -r -P %fdsdir%.zip *

echo
echo creating self-extracting archive
%bin%\winzip\wzipse32 %fdsdir%.zip -d "C:\Program Files\nist\FDS"
copy %fdsdir%.exe ..\.


pause