#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m' 
plain='\033[0m'
 
cur_dir=$(pwd)
 
# check root
[[ $EUID -ne 0 ]] && echo -e "${red}Error：${plain} This script must be run as root user！\n${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1
 
# check os
if [[ -f /etc/redhat-release ]]; then
    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
else
    echo -e "${red}No system version detected, please contact the script author！${plain}\n${red}未检测到系统版本，请联系脚本作者！${plain}\n" && exit 1
fi

if [ "$(getconf WORD_BIT)" != '32' ] && [ "$(getconf LONG_BIT)" != '64' ] ; then
    echo "This software does not support 32-bit system (x86), please use 64-bit system (x86_64), if the detection is wrong, please contact the author \n本软件不支持 32 位系统(x86)，请使用 64 位系统(x86_64)，如果检测有误，请联系作者"
    exit 2
fi

os_version=""

# os version
if [[ -f /etc/os-release ]]; then
    os_version=$(awk -F'[= ."]' '/VERSION_ID/{print $3}' /etc/os-release)
fi
if [[ -z "$os_version" && -f /etc/lsb-release ]]; then
    os_version=$(awk -F'[= ."]+' '/DISTRIB_RELEASE/{print $2}' /etc/lsb-release)
fi

if [[ x"${release}" == x"centos" ]]; then
    if [[ ${os_version} -le 6 ]]; then
        echo -e "${red}Use CentOS 7 Or higher system！${plain}\n${red}请使用 CentOS 7 或更高版本的系统！${plain}\n" && exit 1
    fi
elif [[ x"${release}" == x"ubuntu" ]]; then
    if [[ ${os_version} -lt 16 ]]; then
        echo -e "${red}Use Ubuntu 16 Or higher system！${plain}\n${red}请使用 Ubuntu 16 或更高版本的系统！${plain}\n" && exit 1
    fi
elif [[ x"${release}" == x"debian" ]]; then
    if [[ ${os_version} -lt 8 ]]; then
        echo -e "${red}Use Debian 8 Or higher system！${plain}\n${red}请使用 Debian 8 或更高版本的系统！${plain}\n" && exit 1
    fi
fi

install_base() {
    if [[ x"${release}" == x"centos" ]]; then
        yum install epel-release -y
        yum install wget curl tar crontabs socat bash -y
    else
        apt install wget curl tar cron socat bash -y
    fi
}

#
install_acme() {
	if [ ! -f /root/.acme/acme.sh ];then
	   curl https://get.acme.sh | sh
	fi
	bash /root/.acme.sh/acme.sh --set-default-ca  --server  letsencrypt
	bash /root/.acme.sh/acme.sh  --issue -d $your_domain  --standalone --force
	bash /root/.acme.sh/acme.sh  --installcert -d $your_domain --fullchainpath /etc/Xray/$your_domain.crt --keypath /etc/Xray/$your_domain.key	
}


function checkport(){
	Port80=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w 80`
	Port443=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w 443`
	if [ -n "$Port80" ]; then
	    process80=`netstat -tlpn | awk -F '[: ]+' '$5=="80"{print $9}'`
	    echo "==========================================================="
	    echo -e "${red} It is detected that port 80 is occupied/检测到端口80被占用:${green} ${process80}${plain}，\n${red}This installation is cancelled/此安装已取消${plain}"
	    echo "==========================================================="
	    exit 1
	fi
	if [ -n "$Port443" ]; then
	    process443=`netstat -tlpn | awk -F '[: ]+' '$5=="443"{print $9}'`
	    echo "============================================================="
	    echo -e "${red} It is detected that port 443 is occupied/检测到端口443被占用：${green} ${process443}${plain}，\n${red}This installation is cancelled/此安装已取消${plain}"
	    echo "============================================================="
	    exit 1
	fi
}


install_Xray() {
checkport
pre_install		
if [ ! -d /etc/Xray ];then
	mkdir -p /etc/Xray
	if [ ! -f /etc/Xray/dns.json ];then
		wget -q https://raw.githubusercontent.com/xcode75/xpanel/master/backend/dns.json -O /etc/Xray/dns.json
	fi
	wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202107272209/geoip.dat -O /etc/Xray/geoip.dat
	wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202107272209/geosite.dat -O /etc/Xray/geosite.dat
fi

if [ ! -f /usr/bin/Xray ];then
	wget -q https://raw.githubusercontent.com/xcode75/xpanel/master/backend/Xray -O /usr/bin/Xray
	chmod +x /usr/bin/Xray
fi
	
if [ $CertMode == "file" ];then	
	install_acme	
fi
if [ -z "$(which docker)" ];then
	install_docker
fi
if [ ! -f "/usr/bin/docker-compose" ];then
	install_docker_compose
fi

sleep 2

firewall_allow
systemctl daemon-reload

#if [ $caddy == "true" ];then
#	if [ ! -d /etc/caddy ];then
#		mkdir -p /etc/caddy	
#		wget -q https://raw.githubusercontent.com/xcode75/xpanel/master/backend/caddy -O /usr/bin/caddy
#		chmod +x /usr/bin/caddy
#	fi
#fi

#if [ $caddy == "true" ] && [ $caddytype == "h2" ];then	
#cat > /etc/caddy/$your_domain.conf <<-EOF
#$your_domain:443 {
#    root /srv/www
#    file_server
#    
#    reverse_proxy $path 127.0.0.1:$port {
#        transport http {
#            versions h2c
#        }
#    }
#    gzip
#	tls $Cert_EMAIL {
#		protocols tls1.2
#	}
#}
#EOF

#elif [ $caddy == "true" ] && [ $caddytype == "ws" ];then

#cat > /etc/caddy/$your_domain.conf <<-EOF
#$your_domain:443 {
#    root /srv/www
#    file_server
    
#    proxy $path 127.0.0.1:$port {
#       websocket
#	   header_upstream -Origin
#	   header_upstream X-Forwarded-Proto "https"
#    }
#	tls $Cert_EMAIL {
#		protocols tls1.2
#	}
#}
#EOF
#
#fi

if [ $CertMode == "file" ];then	
cat > /etc/Xray/docker-compose.yml <<-EOF
version: '3'
services: 
  $custom_name: 
    image: frainzy1477/xray:latest
    volumes:
      - ./config.yml:/etc/Xray/config.yml
      - ./dns.json:/etc/Xray/dns.json
      - ./rulelist:/etc/Xray/rulelist
      - ./$your_domain.crt:/etc/Xray/$your_domain.crt
      - ./$your_domain.key:/etc/Xray/$your_domain.key
      - ./geoip.dat:/etc/Xray/geoip.dat
      - ./geosite.dat:/etc/Xray/geosite.dat
    restart: always
    network_mode: host
EOF



cat > /etc/Xray/config.yml <<-EOF
Log:
  Level: $log_level 
  AccessPath: #/etc/Xray/access.Log
  ErrorPath: #/etc/Xray/error.log
DnsConfigPath: /etc/Xray/dns.json # Path to dns config
ConnetionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 3 # Connection idle time limit, Second
  UplinkOnly: 1 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 1 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB 
Nodes:
  -
    ApiConfig:
      ApiHost: "$panelurl"
      ApiKey: "$panelkey"
      NodeID: $node_id
      Timeout: 30 
      SpeedLimit: 0 
      DeviceLimit: 0 
      RuleListPath: # /etc/Xray/rulelist 
    ControllerConfig:
      ListenIP: 0.0.0.0 
      SendIP: 0.0.0.0 
      UpdatePeriodic: 60 
      EnableDNS: $EnableDNS
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/fallback/ for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: $CertMode # file, dns, http, none
        CertDomain: "$your_domain" # Domain to cert	
        CertFile: /etc/Xray/$your_domain.crt
        KeyFile: /etc/Xray/$your_domain.key
        Provider: cloudflare #Get the full DNS cert provider support list here: https://go-acme.github.io/lego/dns/
        Email: $Cert_EMAIL
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: $CLOUDFLARE_EMAIL
          CLOUDFLARE_API_KEY: $CLOUDFLARE_API_KEY

EOF

else

cat > /etc/Xray/docker-compose.yml <<-EOF
version: '3'
services: 
  $custom_name: 
    image: frainzy1477/xray:latest
    volumes:
      - ./config.yml:/etc/Xray/config.yml
      - ./dns.json:/etc/Xray/dns.json
      - ./rulelist:/etc/Xray/rulelist
      - ./geoip.dat:/etc/Xray/geoip.dat
      - ./geosite.dat:/etc/Xray/geosite.dat
    restart: always
    network_mode: host
EOF


cat > /etc/Xray/config.yml <<-EOF
Log:
  Level: $log_level 
  AccessPath: #/etc/Xray/access.Log
  ErrorPath: #/etc/Xray/error.log
DnsConfigPath: /etc/Xray/dns.json # Path to dns config
ConnetionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 3 # Connection idle time limit, Second
  UplinkOnly: 1 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 1 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB 
Nodes:
  -
    ApiConfig:
      ApiHost: "$panelurl"
      ApiKey: "$panelkey"
      NodeID: $node_id
      Timeout: 30 
      SpeedLimit: 0 
      DeviceLimit: 0 
      RuleListPath: # /etc/Xray/rulelist 
    ControllerConfig:
      ListenIP: 0.0.0.0 
      SendIP: 0.0.0.0 
      UpdatePeriodic: 60 
      EnableDNS: $EnableDNS
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/fallback/ for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: $CertMode # file, dns, http, none
        CertDomain: "$your_domain" # Domain to cert
        CertFile: ./cert/$your_domain.crt
        KeyFile: ./cert/$your_domain.key
        Provider: cloudflare #Get the full DNS cert provider support list here: https://go-acme.github.io/lego/dns/
        Email: $Cert_EMAIL
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: $CLOUDFLARE_EMAIL
          CLOUDFLARE_API_KEY: $CLOUDFLARE_API_KEY

EOF

fi

sleep 1

cd /etc/Xray
docker-compose up -d

echo -e ""
echo ""
echo "------------------------------------------"
echo "Xray              - Show Menu/显示菜单"
echo "Xray start        - Start/启动 Xray"
echo "Xray stop         - Stop/停止 Xray"
echo "Xray restart      - Restart/重启 Xray"
echo "Xray log          - Log/日志 Xray "
echo "Xray update       - Update/更新 Xray"
echo "------------------------------------------"
}


function install_docker(){
	curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
	chkconfig docker on
	systemctl start docker
	systemctl enable docker
	usermod -aG docker $USER
}

function install_docker_compose(){
    curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose     
}


function firewall_allow(){
	firewall-cmd --permanent --add-port=1-65500/tcp
	firewall-cmd --permanent --add-port=1-65500/udp
	firewall-cmd --reload
}


pre_install(){   
 
    echo -e "${green}Please enter the domain name / 请输入域名${plain}"
    read -p "(Default : 无默认值):" your_domain
    echo
    echo "---------------------------"
    echo "Domain Name = $your_domain"
    echo "---------------------------"
    echo

    echo -e "${green}Please enter a custom name for your server / 请输入服务器的自定义名称 (example/比如 : JP1)${plain}"
    read -p "(Default : 无默认值):" custom_name
    echo
    echo "---------------------------"
    echo "Custom Name = $custom_name"
    echo "---------------------------"
    echo
 
	
    echo -e "${green}log Level / 日志级别${plain}"
    read -p "(Default none【none, error, warning, info, debug】):" log_level
    if [ -z "$log_level" ];then
	log_level="none"
    fi
    echo
    echo "---------------------------"
    echo "log Level = $log_level"
    echo "---------------------------"
    echo

    echo -e "${green}Enable DNS/ 启用DNS${plain}"
    read -p "(Default true【false, true】):" EnableDNS
    if [ -z "$EnableDNS" ];then
	EnableDNS="true"
    fi
    echo
    echo "---------------------------"
    echo "Enable DNS = $EnableDNS"
    echo "---------------------------"
    echo
	
	#echo -e "${green}Enable Caddy/ 启用caddy${plain}"
    #read -p "(Default false【false, true】):" caddy
    #if [ -z "$caddy" ];then
	#caddy="false"
    #fi
    #echo
    #echo "---------------------------"
    #echo "Enable Caddy = $caddy"
    #echo "---------------------------"
    #echo
	
	#if [ $caddy == "true" ];then
    #echo -e "${green}Caddy Type /Caddy类型${plain}"
    #read -p "(Default ws【ws, h2】):" caddytype
	#if [ -z "$caddytype" ];then
	#caddytype="ws"
    #fi
    #echo
    #echo "---------------------------"
    #echo "Caddy Type = $caddytype"
    #echo "---------------------------"
    #echo 
	
	#echo -e "${green}Port /连接端口${plain}"
    #read -p "(No Default Value):" port
    #echo
    #echo "---------------------------"
    #echo "Port = $port"
    #echo "---------------------------"
    #echo
	
	#echo -e "${green}Path /伪装路径${plain}"
    #read -p "(Default '/'):" path
	#if [ -z "$path" ];then
	#path="/"
    #fi
    #echo
    #echo "---------------------------"
    #echo "Path = $path"
    #echo "---------------------------"
    #echo	
	#fi
	
    echo -e "${green}Cert Mode / 证书模式${plain}"
    read -p "(Default file【none, file, http, dns】):" CertMode
    if [ -z "$CertMode" ];then
	CertMode="file"
    fi
    echo
    echo "---------------------------"
    echo "Cert Mode = $CertMode"
    echo "---------------------------"
    echo
    
    echo -e "${green}Cert Email /证书邮件${plain}"
    read -p "(Default : No default value):" Cert_EMAIL
    echo
    echo "---------------------------"
    echo "Cert Email = $Cert_EMAIL"
    echo "---------------------------"
    echo 
    
    if [ $CertMode == "dns" ];then
    echo -e "${green}Cloudflare Email /Cloudflare邮件${plain}"
    read -p "(Default : No default value):" CLOUDFLARE_EMAIL
    echo
    echo "---------------------------"
    echo "Cloudflare Email = $CLOUDFLARE_EMAIL"
    echo "---------------------------"
    echo 

    echo -e "${green}Cloudflare API KEY / Cloudflare API密钥${plain}"
    read -p "(Default : No default value):" CLOUDFLARE_API_KEY
    echo
    echo "---------------------------"
    echo "Cloudflare API KEY = $CLOUDFLARE_API_KEY"
    echo "---------------------------"
    echo 
    fi
    
    echo -e "${green}PanelUrl / 网站地址${plain}"
    read -p "(Default : No default value):" panelurl
    echo
    echo "---------------------------"
    echo "PanelUrl = $panelurl"
    echo "---------------------------"
    echo 
	
	
    echo -e "${green}PanelKey / 网站密钥${plain}"
    read -p "(Default: No default value):" panelkey
    echo
    echo "---------------------------"
    echo "PanelKey = $panelkey"
    echo "---------------------------"
    echo 
    
    echo -e "${green}Server Id /节点ID${plain}"
    read -p "(Default : 1 ):" node_id
    if [ -z "$node_id" ];then
	node_id=1
    fi
    echo
    echo "---------------------------"
    echo "Server Id = $node_id"
    echo "---------------------------"
    echo 
}

echo -e "${green}Start Install${plain}"
install_base
install_Xray
