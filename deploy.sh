#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

#提交到github参考
git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:funet8/vuepress.xgss.net.git master


# 生成静态文件
yarn docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

git init
git remote add origin git@github.com:funet8/vuepress.xgss.net.git
git add .
git commit -m "脚本自动提交"
git branch -M master
git push --force --quiet "git@github.com:funet8/vuepress.xgss.net.git" master:gh-pages
cd -

