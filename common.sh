log_file=\tmp\expense.logx
color="\e[31m"

if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi