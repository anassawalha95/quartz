cd "c:\Users\User\Desktop\Obsidian\hugo-obsidian"; rm -fr "c:\Users\User\Desktop\Obsidian\quartz\content\*"; rm -rf "c:\Users\User\Desktop\Obsidian\public\*"; c:\Users\User\Desktop\Obsidian\obsidian-export\target\debug\obsidian-export  --add-titles --frontmatter=always  c:\Users\User\Desktop\Obsidian\bkb c:\Users\User\Desktop\Obsidian\quartz\content; go run "c:\Users\User\Desktop\Obsidian\hugo-obsidian" -input="c:\Users\User\Desktop\Obsidian\quartz\content" -output="c:\Users\User\Desktop\Obsidian\quartz\assets\indices" -index -root="c:\Users\User\Desktop\Obsidian\quartz"; (cd "c:\Users\User\Desktop\Obsidian\quartz" && hugo --minify)



sleep 100