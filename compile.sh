#!/bin/bash

cd ~/Sites/hugo-obsidian; rm -fr ~/Sites/quartz/content/*; 
rm -rf ~/Sites/quartz/public/*; 
~/Sites/obsidian-export/target/debug/obsidian-export --add-titles --frontmatter=always /Users/brandonkboswell/My\ Drive/2.\ Areas/Obsidian/bkb ~/Sites/quartz/content;
 go run ~/Sites/hugo-obsidian -input=/Users/brandonkboswell/Sites/quartz/content -output=/Users/brandonkboswell/Sites/quartz/assets/indices -index -root=/Users/brandonkboswell/Sites/quartz; (cd ~/Sites/quartz && hugo --minify)