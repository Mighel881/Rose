cd ~/Documents/GitHub/RoseLocalizations/
git pull
sleep 1

echo "Done, Now Building Tweak"
cd ~/Documents/GitHub/Rose/
FINALPACKAGE=1 make clean package -j 9
sleep 1