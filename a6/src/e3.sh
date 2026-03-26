#!/bin/bash
#-------------------------
# File: e3.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-03-26
#-------------------------
# Proof of completion
REPO_URL="https://github.com/TheChroniclerr/sandbox.git"
PAGE_URL= "https://thechroniclerr.github.io/sandbox/"

# This exercise has no re-runable steps
# The script shown here are for illustration purposes only
git clone $REPO_URL
cd sandbox
echo "# My Project" > README.md
git add README.md
git commit -m "Add README"
git push

# Go into "Pull request" to see the demo pull request.