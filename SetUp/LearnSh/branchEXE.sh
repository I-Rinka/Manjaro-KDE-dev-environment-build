echo "start!"
sudo bash ./branch1.sh
if [ $? -eq 0 ]
then
echo "branch1 finished!"
else
echo "error"
exit
fi
bash ./branch2.sh
echo "branch2 finished!"