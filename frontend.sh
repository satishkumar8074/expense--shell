log_file=\tmp\expense.logx
color="\e[31m"
echo -e "${color} installing nginx \e[0m"
dnf install nginx -y &>>$log_file
if echo [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} copy expense config file \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
if echo [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} remove old data \e[0m"

rm -rf /usr/share/nginx/html/* &>>\tmp\expense.log &>>$log_file
if echo [ $? -eq 0] ; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi

echo -e "${color} download frontend application \e[0m"

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>$log_file
if echo [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} changing the user and unzipping the file"
cd /usr/share/nginx/html &>>$log_file
unzip /tmp/frontend.zip &>>$log_file $?
if echo [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} starting nginx service \e[0m"
if echo [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
if echo [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi

