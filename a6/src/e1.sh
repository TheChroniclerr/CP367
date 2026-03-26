#!/bin/bash
#-------------------------
# File: e1.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-03-26
#-------------------------
# Setup
rm -rf exer
mkdir exer
cd exer

# Process
git init

touch file.txt
git add .
git commit -m "Init"

echo "Hello World!" > file.txt
git add .
git commit -m "Modify file.txt"

touch file1.txt
touch file2.txt
git add file1.txt
git commit -m "Add file1.txt"
git status

git reset --soft HEAD~1
git add file2.txt
git commit -m "Add all files"