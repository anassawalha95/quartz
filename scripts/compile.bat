 

REM Define variables for directories used in the script
set obsidianDir=c:\Users\User\Desktop\Obsidian
set quartzDir=%obsidianDir%\quartz
set contentDir=%quartzDir%\content
set publicDir=%quartzDir%\public
set exportDir=%obsidianDir%\obsidian-export\target\debug
set hugoObsidianDir=%obsidianDir%\hugo-obsidian
set obsidianVault=bkb

echo Running script...

cd %hugoObsidianDir% && (
    echo [Success] Chnaged directory successfully.
) 
del /S /Q %contentDir%\* 
del /S /Q %publicDir%\*


echo  obsidian-export
%exportDir%\obsidian-export --add-titles --frontmatter=always %obsidianDir%\%obsidianVault% %contentDir% 

go run %hugoObsidianDir% -input=%contentDir% -output=%quartzDir%\assets\indices -index -root=%quartzDir% --baseUrl=localhost:1313
@REM go run c:\Users\User\Desktop\Obsidian\hugo-obsidian -input=c:\Users\User\Desktop\Obsidian\quartz\content -output=c:\Users\User\Desktop\Obsidian\quartz\assets\indices -index -root=c:\Users\User\Desktop\Obsidian\quartz 

cd %quartzDir% && hugo --minify && (
    echo [Success] hugo --minify ran successfully.
) || (
    echo [Failed] Hugo build failed.
    echo [Failed] Failed
)

REM If the script reaches here, it means that everything completed successfully
echo [Success] Script completed successfully.



