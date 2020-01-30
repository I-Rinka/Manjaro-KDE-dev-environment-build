
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m233\033[0m"
    bash ./$0
else
    echo -e "\033[41;37m出现错误\033[0m"
    read -p "按任意键继续" var
    bash ./$0
    exit #exit直接终端脚本
fi
echo "test"
#$?代表上一指令的执行情况