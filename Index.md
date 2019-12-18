# 前言

本网关由[宁夏巫迪科技有限公司](https://www.woody.vip)提供技术支持,有任何问题请发邮件至<support@woody.vip>

如需本文档源码,请访问[Github 源码](https://github.com/woodytechnology/boxdoc)

## 网关介绍

本网关为工业物联网采集网关,专业采集各种主流 CNC, PLC, 目前支持 Fanuc (发那科), Siemens (西门子) CNC, Mitsubishi (三菱) CNC, 
KND (凯恩蒂), GSK (凯恩帝) CNC, Heidenhain (海德汉), Siemens (西门子) S7, Mitsubishi (三菱) MC, Modbus TCP/RTU 等协议.

本网关程序使用 C++ 开发, 支持 ARM, X86 等各种CPU架构的Linux系统,可构建至中央服务器统一采集厂房所有联网设备,也可以构建于嵌入式主机,
一对一采集单个设备,网关对外提供多种数据输出方式,包括 MQTT , HTTP, Socket 等通讯协议,支持对接各大云平台,包括 Thingsboard, 联通 Telit, 
移动 OneNet, 百度天工, 航天云网等.

本网关带有 VPN 服务,可以搭配巫云 VPN 服务,可以提供高效安全的 VPN 服务,可以远程上下载程序锁机等.

本文档基于本公司配套硬件设施,其他硬件仅网络配置界面不同