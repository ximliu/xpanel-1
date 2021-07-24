
![](https://raw.githubusercontent.com/xcode75/xpanel/master/img/x1.png)
![](https://raw.githubusercontent.com/xcode75/xpanel/master/img/x3.png)

## 特征

- [安装Ioncube Loader](https://www.howtoforge.com/tutorial/how-to-install-ioncube-loader/#-configure-ioncube-loader-on-centos)
- [Google Analytic](https://analytics.google.com/analytics/web/) 
- [Google Console](https://console.developers.google.com/) 
- [Twilio](https://www.twilio.com/console/project/api-keys) 
- [AmazonSNS](https://aws.amazon.com/sns/)
- [Alphadvantage (Exchange rate key)](https://www.alphavantage.co/support/#api-key)
- [Paypal](https://developer.paypal.com/classic-home) 
- [Tawk](https://www.tawk.to/)
- [TelegramBot](https://telegram.org/)
- [Mailgun](https://www.mailgun.com/)
- [Twilio-Sendgrid](https://sendgrid.com/)
- [Hcaptcha](https://dashboard.hcaptcha.com/overview)


## 安装面板 PANEL INSTALL NGINX

```
安装Ioncube Loader 
系统CentOS 7x64 / Ubuntu 18.04+
安装Ngnix Server
安装PHP 7.4
安装Database(mysql or mariab)
安装Cron
	
	
下载程序代码
git clone https://github.com/xcode75/xpanel.git tmp -b master && mv tmp/.git . && rm -rf tmp && git reset --hard


xpanel的配置
config/config.php

导入 sql 目录下的 sql/xpanel.sql


php composer.phar install

cp smarty_internal_resource_file.php /home/xxxx/xxx/vendor/smarty/smarty/libs/sysplugins

chmod -R 777 /home/xxxx/xxx

创建管理员
php cronjob createAdmin

下线应用
php cronjob downloadApps

打开nginx Config

root那一行改为
root /home/xxxx/xxx/public;

然后添加下面这一段到 server
location / {
    try_files $uri $uri/ /index.php$is_args$args;
}

重启一下 nginx
service nginx restart

systemctl restart nginx 


crontab -e ，添加以下四段
0 */1 * * * php /home/xxxx/xxxx/cronjob backup
0 */1 * * * php /home/xxxx/xxxx/cronjob rate
*/1 * * * * php /home/xxxx/xxxx/cronjob checkjob
59 23 * * * php /home/xxxx/xxxx/cronjob dailyjob


管理后端,系统设置->通知设置->通知方式->Telegram信息
群组会话ID TG Chat ID TG 机器人bot发 /ping 获得ID
群组 TG Group ID: 在TG群组添加bot然后 /ping 获得ID
TG密钥 BotFather获得密钥(token)

php cronjob setTelegram

```

## 安装后端 DOCKER BACKEND INSTALL

```
CENTOS 7
-------------------------------
cd /root && \
rm -rf install.sh && \
yum -y install epel-release wget bash zip unzip update && \
wget https://raw.githubusercontent.com/xcode75/xpanel/master/backend/install.sh -O /root/install.sh && \
chmod +x  install.sh && \
bash install.sh
```

```
UBUNTU 18/20
-------------------------------
cd /root && \
rm -rf install.sh && \
apt install wget bash zip unzip && \
wget https://raw.githubusercontent.com/xcode75/xpanel/master/backend/install.sh -O /root/install.sh && \
chmod +x  install.sh && \
bash install.sh
```
#Credits
- [XrayR-project](https://github.com/XrayR-project/XrayR) 后端
