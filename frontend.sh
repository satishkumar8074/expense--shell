echo -e "\e[36m installing nginx \e[0m"
dnf install nginx -y

echo -e "\e[36m copy expense config file \e[0m"

cp expense.conf /etc/nginx/default.d/expense.conf
echo -e "\e[36m remove old data \e[0m"

rm -rf /usr/share/nginx/html/*

echo -e "\e[36m download frontend application \e[0m"

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[36m extarcting the downloaded application content \e[0m"


cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[36m starting nginx service \e[0m"

systemctl enable nginx
systemctl restart nginx


