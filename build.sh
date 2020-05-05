cd ~/Documents/GitHub/RoseLocalizations/
git pull
echo "Now Copying Localizations To Resources Folder"
cp -R ~/Documents/GitHub/RoseLocalizations/* ~/Documents/GitHub/Rose/Prefs/Resources/
echo "Removing README.md From Resources Folder"
rm -rf ~/Documents/GitHub/Rose/Prefs/Resources/README.md
echo "Done, Now Building Tweak"
cd ~/Documents/GitHub/Rose/
FINALPACKAGE=1 make clean package -j 9