
dnf module disable nodejs -y

dnf module enable nodejs:18 -y

dnf install nodejs -y

cp backend.service /etc/systemd/system/backend.service

id expense

useradd expense

mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip

cd /app
unzip /tmp/backend.zip

cd /app
npm install

dnf install mysql -y

mysql -h 172.31.47.147  -uroot -pExpenseApp@1 < /app/schema/backend.sql

systemctl daemon-reload &>>log_file
systemctl enable backend &>>log_file
systemctl restart backend &>>log_file