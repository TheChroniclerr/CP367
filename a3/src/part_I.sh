# File: part_I.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-02-26

sed 's/ *, */,/g' logs.csv \
| sed -E 's/^(([^,]*,){2})([a-z]+)/\1\U\3/' \
| sed '$!N;/^\(.*\)\n\1$/!P;D' \
| sed 's/,$/,0/' \
| sed 's/,200,/,SUCCESS,/g' \
> cleaned.csv