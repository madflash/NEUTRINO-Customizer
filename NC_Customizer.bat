@echo off

set DEFAULT_NAME_SCORE=
set DEFAULT_NAME_VC=
set ENABLE_SKIP=
set ENABLE_OUTPUTNAME=
set TESTMODE=

: INIT
setlocal enabledelayedexpansion
cd /d %~dp0
for /f "usebackq delims== tokens=1,2" %%a in ("setting.txt") do set %%a=%%b

: START
echo  NEUTRINO Optimizer for ver Electron v1.1.0
set NAME_SCORE=%DEFAULT_NAME_SCORE%
set NAME_VC=%DEFAULT_NAME_VC%
set NAME_OUTPUT=%DEFAULT_NAME_SCORE%
if "%ENABLE_SKIP%"=="1" goto :INPUT_END

: INPUT_CONF
echo +-------------------------------------------------------+
echo  Score's name:[%NAME_SCORE%], VC's name:[%NAME_VC%], is correct?
echo +-------------------------------------------------------+
choice
if %errorlevel%==1 goto :INPUT_END
if %errorlevel%==2 goto :INPUT_SCORE

: INPUT_SCORE
echo +-------------------------------------------------------+
echo  Score's name:[%NAME_SCORE%], is correct?
echo +-------------------------------------------------------+
choice
if %errorlevel%==1 goto :INPUT_VC
echo +-------------------------------------------------------+
echo  Scorefile's name?
echo +-------------------------------------------------------+
set NAME_SCORE=
set /p NAME_SCORE=
goto :INPUT_SCORE

: INPUT_VC
echo +-------------------------------------------------------+
echo  VC's name:[%NAME_VC%], is correct?
echo +-------------------------------------------------------+
choice
if %errorlevel%==1 goto :INPUT_CONF
echo +-------------------------------------------------------+
echo  VC's name?
echo +-------------------------------------------------------+
set NAME_VC=
set /p NAME_VC=
goto :INPUT_VC

: INPUT_END
@rem change OUTPUTNAME
set "%ENABLE_OUTPUTNAME%"=="1"(
  set tmptime=%time: =0%
  set NAME_OUTPUT=%NAME_SCORE%_%NAME_VC%_%date:~0,4%%date:~5,2%%date:~8,2%%tmptime:~0,2%%tmptime:~3,2%%tmptime:~6,2%
)
if %TESTMODE%==1 goto :CALL_TEST
echo +-------------------------------------------------------+
echo  call NC_Run.bat
echo +-------------------------------------------------------+
call NC_Run.bat %NAME_SCORE% %NAME_VC% %NAME_OUTPUT%

: CALL_TEST
echo +-------------------------------------------------------+
echo  call test.bat
echo +-------------------------------------------------------+
call test.bat %NAME_SCORE% %NAME_VC% %NAME_OUTPUT%
