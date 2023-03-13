@echo off

REM Define variables for directories used in the script
set obsidianDir=c:\Users\User\Desktop\ObsidianB
set quartzDir=%obsidianDir%\quartz
set contentDir=%quartzDir%\content
set publicDir=%quartzDir%\public
set exportDir=%obsidianDir%\obsidian-export\target\debug
set hugoObsidianDir=%obsidianDir%\hugo-obsidian
set obsidianVault=bkb

echo Running script...

cd %hugoObsidianDir% && (
    echo [Success] Chnaged directory successfully.
) || (
    echo Error in changing directory.
    echo [Failed] Failed
    
)
del /S /Q %contentDir%\* >nul 2>&1 && (
    echo [Success] Content files deleted successfully.
) || (
    echo [Failed] Deletion failed for quartz/content files.
    echo [Failed] Failed
    echo [Failed] Error message: %errorlevel%
    
)
del /S /Q %publicDir%\* >nul 2>&1 && (
    echo [Success] Public files deleted successfully.
) || (
    echo [Failed] Deletion failed for quartz/public files.
    echo [Failed] Failed
    echo [Failed] Error message: %errorlevel%
   
)

%exportDir%\obsidian-export --add-titles --frontmatter=always %obsidianDir%\%obsidianVault% %contentDir%  >nul 2>&1 || (
    echo [x] Error in running Obsidian Export.
    echo [x] Failed
    for /f "tokens=* delims=" %%i in ('%exportDir%\obsidian-export --add-titles --frontmatter=always %obsidianDir%\%obsidianVault% %contentDir%  2^>^&1') do (
        set errorMessage=%%i
    )
    echo [x] Error message: %errorMessage%
    goto :end
)

go run %hugoObsidianDir% -input=%contentDir% -output=%quartzDir%\assets\indices -index -root=%quartzDir% >nul 2>&1 || (
    echo [x] Hugo build failed.
    echo [x] Failed
    for /f "tokens=* delims=" %%i in ('go run %hugoObsidianDir% -input=%contentDir% -output=%quartzDir%\assets\indices -index -root=%quartzDir% 2^>^&1') do (
        set errorMessage=%%i
    )
    echo [x] Error message: %errorMessage%
    goto :end
)

cd %quartzDir% && hugo --minify && (
    echo [Success] hugo --minify ran successfully.
) || (
    echo [Failed] Hugo build failed.
    echo [Failed] Failed
)

REM If the script reaches here, it means that everything completed successfully
echo [Success] Script completed successfully.

:end
