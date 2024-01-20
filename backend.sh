log_file=\tmp\expense.logx
color="\e[31m"
echo -e "${color} diabling nodejs \e[0m"
dnf module disable nodejs -y &>>log_file
echo $?
echo -e "${color}  enabling node js \e[0m"
dnf module enable nodejs:18 -y &>>log_file
echo $?
echo -e "${color} installing nodejs  \e[0m"
dnf install nodejs -y &>>log_file
echo $?
echo -e "${color} copying from backend service file  \e[0m"
cp backend.service /etc/systemd/system/backend.service &>>log_file
echo $?
echo -e "${color} adding the user  \e[0m"
useradd expense &>>log_file
echo $?
echo -e "${color} creating the app \e[0m"
mkdir /app &>>log_file
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>log_file
echo $?
echo -e "${color} changing to the application and unzipping the file  \e[0m"
cd /app &>>log_file
unzip /tmp/backend.zip &>>log_file
echo $?
echo -e "${color} installing the npm \e[0m"
cd /app &>>log_file
npm install &>>log_file
echo $?
echo -e "${color}  installing the mysql \e[0m"
dnf install mysql -y &>>log_file
echo $?
echo -e "${color} setting the password to expense app  \e[0m"
mysql -h 172.31.36.84 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>log_file
echo $?
echo -e "${color} reloading the daemon  \e[0m"
systemctl daemon-reload &>>log_file
systemctl enable backend &>>log_file
systemctl restart backend &>>log_file
echo $?