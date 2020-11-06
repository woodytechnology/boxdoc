# 前言

本网关由[宁夏巫迪科技有限公司](https://www.woody.vip)提供技术支持,有任何问题请发邮件至<support@woody.vip>

如需本文档源码,请访问[Github 源码](https://github.com/woodytechnology/boxdoc)

## 网关介绍

工业数据采集网关,用于采集数控机床的生产数据,如报警信息,生产件数,电机温度,刀具号等关键信息. 也可以实现机床的远程管理和程序下载. 适用的领域有航天工业,车船制造业,工程机械,电子配件等工业领域. 所采集到的数据可以灵活的发送到工业互联网平台进行深度分析,如产量分析,告警分析,排班计划,机床维护,刀具磨损预测等工作,进一步实现企业的工业信息化程度,提升产能,降本增效.

本网关专业采集各种主流 CNC, PLC, 机器人, 目前支持 Fanuc (发那科) CNC, Siemens (西门子) CNC, Mitsubishi (三菱) CNC, KND (凯恩蒂) CNC, GSK (广数) CNC, Heidenhain (海德汉) CNC, Citizen (西铁城) CNC, Brother (兄弟) CNC,
Siemens (西门子) S7, Mitsubishi (三菱) MC, Omron (欧姆龙) Fins, Syntec(新代), OPC UA, Haas(哈斯) CNC, Mazak(马扎克), Mitsubishi(三菱) PLC, Siemens(西门子) PLC, Allen Bradley PLC,
KUKA(卡库机器人), ABB机器人, Fanuc机器人, Modbus TCP/RTU 等协议.


本网关程序使用 C++ 开发, 支持 ARM, X86 等各种CPU架构的Linux系统,可构建至中央服务器统一采集厂房所有联网设备,也可以构建于嵌入式主机,
一对一采集单个设备,网关对外提供多种数据输出方式,包括 MQTT , HTTP, Socket, Modbus Server, OPC UA 等通讯协议,支持对接各大云平台,包括 Thingsboard, 联通 Telit, 移动 OneNet, 百度天工, 航天云网, 紫光云, 翰云等.

本网关内置VPN服务,搭配VPN服务,可以提供高效安全的 VPN 服务,可以实现远程上下载程序锁机等功能.

本文档基于本公司配套硬件设施,其他硬件仅网络配置界面不同
