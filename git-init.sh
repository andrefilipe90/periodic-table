#!/bin/bash

mkdir periodic_table
cd ./periodic_table
git init
touch .env
touch .gitignore
echo ".env" >> .gitignore
git add .
git commit -m "kickstart: git init"