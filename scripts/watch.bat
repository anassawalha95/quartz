@echo off

set OBSIDIAN_DIR=c:\Users\User\Desktop\ObsidianB
set QUARTZ_DIR=%OBSIDIAN_DIR%\quartz
set BKB_DIR=%OBSIDIAN_DIR%\bkb

cd /d %OBSIDIAN_DIR% || (echo Failed to change directory to %OBSIDIAN_DIR% & exit /b 1)

set "WATCH_DIRS=%BKB_DIR% %QUARTZ_DIR%\assets\js %QUARTZ_DIR%\assets\styles %QUARTZ_DIR%\layouts %QUARTZ_DIR%\config.toml %QUARTZ_DIR%\data\config.yaml %QUARTZ_DIR%\data\graphConfig.yaml"

nodemon -w %WATCH_DIRS% -x %QUARTZ_DIR%\scripts\compile.bat -e md,html,js,scss,xml || (echo Failed to run nodemon & exit /b 1)
