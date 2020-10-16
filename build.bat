@ECHO OFF

REM ============================================================
REM === environment ============================================
REM ============================================================

SET COMPILER=msvc60
SET RTL=%W%, %I%
SET DISTRIBUTION=IRFA

REM ============================================================
REM === define list of Source Releases =========================
REM ============================================================

SET REL1=MIS_RD.05.24
SET FIX1=13
SET BAT1=build.bat
SET PRE1=
SET CRLF1=1

REM ============================================================
REM global parameters
REM ============================================================

SET SOURCE_RELEASE=MIS_RD

REM ============================================================
REM Move install directory from source release
REM subdirectory to this directory
REM ============================================================

@ECHO ON

IF NOT EXIST IRFA MKDIR IRFA

IF NOT EXIST IRFA\support mkdir IRFA\support

IF EXIST %SOURCE_RELEASE%\mis\Info.txt COPY %SOURCE_RELEASE%\mis\Info.txt IRFA\support\Info.txt > NUL

IF EXIST LevelMembers.inf MOVE LevelMembers.inf IRFA\support\LevelMembers.inf
IF EXIST compiler.reg MOVE compiler.reg IRFA\support\compiler.reg

IF EXIST %SOURCE_RELEASE%\mis\install XCOPY %SOURCE_RELEASE%\mis\install IRFA\install\ /E /I /Q

IF EXIST %SOURCE_RELEASE%\mis\install RD /S /Q %SOURCE_RELEASE%\mis\install 
