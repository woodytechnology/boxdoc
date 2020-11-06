# 调试命令

这里可以做一些简单的调试,包括了获取IP,路由,Ping,端口测试等命令

##获取IP地址
获取ip地址可以看到本机所以ip地址,其中 eth0为net0 br0/eth0为net1 wlan0为WiFi,eth2为4G,tap0为VPN

![](/img/debug-1.png)

##Ping
Ping可以是IP或者域名,可以选择网口

![](/img/debug-2.png)

## 路由

路由为linux专业工具,需了解专业网络知识,可以查看当前网卡优先级别和路由状态

![](/img/debug-3.png)

## 端口测试

端口测试用来确定TCP端口是否开放,格式为192.168.0.15:22或www.baidu.com:22

![](/img/debug-5.png)


