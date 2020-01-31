pacman -S oiuerpoiwque
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m换源已经完成"
else
    echo -e "\033[41;37m出现错误\033[0m"
    #这里成功执行出现错误对于这个shell命令的执行情况而言是成功的
fi