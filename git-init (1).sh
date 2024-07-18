#!/bin/bash

mkdir periodic_table
cd ./periodic_table
git init
touch .env
touch .gitignore
echo ".env" >> .gitignore
git checkout -b main
git add .
git commit -m "Initial commit"
touch element.sh
chmod +x element.sh
git add .
git commit -m "feat: add file element.sh"