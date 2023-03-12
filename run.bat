@echo off

set watchScript= scripts\watch.bat
set serveScript= scripts\serve.bat

start cmd /k "%watchScript%"
start cmd /k "%serveScript%"