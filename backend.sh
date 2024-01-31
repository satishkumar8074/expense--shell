source common.sh

echo -e "${color} installing nginx \e[0m"
dnf module disable nodejs -y >>log_file

echo -e "${color} installing nginx \e[0m"
dnf module enable nodejs:18 -y >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
dnf install nodejs -y >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
cp backend.service /etc/systemd/system/backend.service >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
id expense >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
useradd expense >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
mkdir /app >>log_file
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
cd /app >>log_file
unzip /tmp/backend.zip >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
cd /app >>log_file
npm install >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
dnf install mysql -y >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
mysql -h 172.31.47.147  -uroot -pExpenseApp@1 < /app/schema/backend.sql >>log_file
if  [ $? -eq 0 ]; then
echo -e "\e[32m success \e[0m"
else
echo -e "\e[33m failure \e[0m"
fi
echo -e "${color} installing nginx \e[0m"
systemctl daemon-reload &>>log_file
systemctl enable backend &>>log_file
systemctl restart backend &>>log_file