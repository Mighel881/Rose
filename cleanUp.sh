cd ~/Documents/GitHub/RoseLocalizations/
git pull
sleep 1

echo "Removing Duplicates"
rm -rf -v ~/Documents/GitHub/RoseLocalizations/*.lproj/*2.strings
rm -rf -v ~/Documents/GitHub/RoseLocalizations/*.lproj/*3.strings
sleep 1

echo "Removing lproj Folder In Rose Resources"
rm -rf -v ~/Documents/GitHub/Rose/Prefs/Resources/*.lproj
sleep 1

echo "Now Copying Localizations To Resources Folder"
cp -R -v ~/Documents/GitHub/RoseLocalizations/* ~/Documents/GitHub/Rose/Prefs/Resources/
sleep 1

echo "Removing README.md From Resources Folder"
rm -rf -v ~/Documents/GitHub/Rose/Prefs/Resources/README.md
sleep 1

echo "Removing Duplicates In Rose Resource If There Are Some"
rm -rf -v ~/Documents/GitHub/Rose/Prefs/Resources/*.lproj/*2.strings
rm -rf -v ~/Documents/GitHub/Rose/Prefs/Resources/*.lproj/*3.strings
sleep 1

echo "Cleaning Up"
rm -rf -v ~/Documents/GitHub/Rose/Prefs/Resources/*.lproj/*2.strings
rm -rf -v ~/Documents/GitHub/Rose/Prefs/Resources/*.lproj/*3.strings
rm -rf -v ~/Documents/GitHub/RoseLocalizations/*.lproj/*2.strings
rm -rf -v ~/Documents/GitHub/RoseLocalizations/*.lproj/*3.strings
sleep 1

tree -P '*2.strings'
tree -P '*3.strings'
tree -P '*4.strings'