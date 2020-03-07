echo "输入'N'结束执行,属于'Y'继续执行" 
# sleep 2s
read hh
if [ $hh = N ]
then 
echo "exit"
exit
fi
echo "continue"
