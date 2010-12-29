#!/bin/bash
echo 'Testing Rikaichan'
echo 'tags: Import Rikaichan' > rikaichan.txt
./rikaichan.rb ~/Dropbox/rikaichan.txt | tee -a rikaichan.txt

echo ''
echo 'Testing Kotoba'
echo 'tags: Import Kotoba' > kotoba.txt
./kotoba.rb ~/Dropbox/Favorites.txt | tee -a kotoba.txt