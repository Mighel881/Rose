cd ~/Documents/GitHub/RoseLocalizations/
git pull
echo "Now Copying To Resources Folder"
cp -R ~/Documents/GitHub/RoseLocalizations/*.lproj ~/Documents/GitHub/Rose/Prefs/Resources/
echo "Done, Now Building Tweak"
cd ~/Documents/GitHub/Rose/
FINALPACKAGE=1 make clean package