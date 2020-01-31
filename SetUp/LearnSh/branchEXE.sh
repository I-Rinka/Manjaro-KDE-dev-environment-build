echo "start!"
sudo bash ./branch1.sh
if [ $? -eq 0 ]
then
echo "branch1 finished!"
else
echo -e "\033[42merror\033[0m"
exit
fi
bash ./branch2.sh
echo "branch2 finished!"