@echo off
SET /P Message=Enter git C769-ROM3 commit comment:
title C769-ROM3: compile html, save to repo folder, update GitHub repo and website
cd "D:\OneDrive - Western Governors University\jupyter-books\C769-ROM3"
FOR /d /r . %%d IN (.history) DO @IF EXIST "%%d" rd /s /q "%%d"
jupyter-book build "D:\OneDrive - Western Governors University\jupyter-books\C769-ROM3"
echo "Compiling local D:\OneDrive - Western Governors University\jupyter-books\C769-ROM3 ..."
xcopy /s /e /h /i /y "D:\OneDrive - Western Governors University\jupyter-books\C769-ROM3" "D:\OneDrive - Western Governors University\jupyter-books\github_book_repo\C769-ROM3"
echo "Copied local book to D:\... \jupyter-books\github_book_repo\C769-ROM3 ..."
cd "D:\OneDrive - Western Governors University\jupyter-books\github_book_repo\C769-ROM3" 
git add ./*
git commit -m "%Message%"
echo "Commited..."
git push
echo "Pushed..."
ghp-import -n -p -f _build/html
echo "Imported to git page..."
start https://ashejim.github.io/C769-ROM3/intro_ROM3.html
echo "Gitpage may take a few minutes to update. END"
cd D:\OneDrive - Western Governors University\jupyter-books\C769-ROM3