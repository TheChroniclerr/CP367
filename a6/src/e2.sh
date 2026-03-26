#!/bin/bash
#-------------------------
# File: e2.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-03-26
#-------------------------
# Setup
./e1.sh     # call e1.sh to generate some history for log.txt
cd exer

# Process
git log --help
git diff --help

echo "untracked.txt" > .gitignore
touch untracked.txt
git status

git log > log.txt
grep "Date:" log.txt | awk '{print $2}' | sort | uniq -c | sort -nr