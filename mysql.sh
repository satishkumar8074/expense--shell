log_file=\tmp\expense.logx
color="\e[31m"

echo -e "${color} disabling default mysql \e[0m"
dnf module disable mysql -y &>>log_file
echo $?
echo -e "${color} copying from the repositories  \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>log_file
echo $?
echo -e "${color} installing the mysql \e[0m"
dnf install mysql-community-server -y &>>log_file
echo $?
systemctl enable mysqld &>>log_file
echo $?
systemctl restart mysqld &>>log_file
echo $?
echo -e "${color} setting the expense password  \e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>log_file
echo $?