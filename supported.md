# 支持CNC型号列表

## 发那科(Fanuc)
支持发那科全系列,包括并不限于下列型号
```
FANUC Series 0i-MODEL A
FANUC Series 0i-MODEL B
FANUC Series 0i-MODEL C Note1)
FANUC Series 0i-MODEL D
FANUC Series 0i Mate-MODEL D
FANUC Series 0i-MODEL F
FANUC Series 0i Mate-MODEL F
FANUC Series 0i-PD
FANUC Series 0i-PF
FANUC Series 15/150-MODEL B
FANUC Series 15i/150i-MODEL A
FANUC Series 15i/150i-MODEL B
FANUC Series 16/160-MODEL B
FANUC Series 16/160-MODEL c
FANUC Series 18/180-MODEL B
FANUC Series 18/ 180-MODEL c
FANUC Series 21/210-MODEL B
FANUC Series 16/160i-MODEL A
FANUC Series 18i/180i-MODEL A
FANUC Series 21i/210i-MODEL A
FANUC Series 16i/160i-MODEL B
FANUC Series 18i/180i-MODEL B
FANUC Series 21i/210i-MODEL B
FANUC Series 16i/ 160i-P
FANUC Series 18i/180i-P
FANUC Series 16i/160i-L
FANUC Series 16i/160i-W
FANUC Series 18i/180i-W
FANUC Series 30i-MODEL A
FANUC Series 31i-MODEL A
FANUC Series 32i-MODEL A
FANUC Series 30i-MODEL B
FANUC Series 31i-MODEL B
FANUC Series 32i-MODEL B
FANUC Series 35i-MODEL B
FANUC Series 30i-P MODEL B
FANUC Series 31i-P MODEL B
FANUC Series 30i-L MODEL B
FANUC Series 31i-L MODEL B
FANUC Series 31i-W MODEL A
FANUC Series 31i-W MODEL B
FANUC Power Mate i-MODEL H
FANUC Power Mate i-MODEL D
FANUC Power Motion i-MODEL A

```


## 西门子(Siemens)

目前市面上的西门子系统主要有808d,810d,802dsl,828d,828dsl,840d,840dsl. 其中西门子官方支持828d,828dsl,840dsl, 且系统版本必须满足sw4.5 sp3. 西门子官方在该版本系统内置opcua server, 客户需向西门子官方购买opcua授权进行通讯数据采集, 每台费用在3000左右. 其余西门子CNC型号官方均不支持通讯数据读写. 巫迪科技针对西门子驱动器进行研究解析分析,实现了针对西门子驱动器的免授权数据读写，支持了驱动器具备网口的808d,802d,828d,82dsl,840dsl. 同时也支持了PCU版本在5.0的810d,840d系统, 支持X86,arm等硬件架构, 可以轻松的在任意平台移植, 满足工业网关的低成本高稳定的需求.

```
siemens 808d
siemens 810d
siemens 802dsl
siemens 828d
siemens 828dsl
siemens 840d(采集方式需要部署程序,有蓝屏风险,不建议采集但是可以采集)
siemens 840dsl
```

## 三菱(Mitsubishi)
```
Mitsubishi CNC M700系列
Mitsubishi CNC M700V系列
Mitsubishi CNC M70系列
Mitsubishi CNC M70V系列
Mitsubishi CNC E70系列
Mitsubishi CNC C70系列
Mitsubishi CNC M800系列
Mitsubishi CNC M80系列
```
## 哈斯(Hass)

Hass CNC由于官方接口限制,只支持官方定义固定功能的宏程序打印.目前市面上的Hass CNC分为24针串口以及网口两种,均支持宏程序打印功能,支持X86,arm等硬件架构,可在任意平台移植,满足工业网关的低成本高稳定的需求.

```
支持所有24针串口以及网口版本
```

## 凯恩帝(knd)
```
支持系统版本信息V4.3以上的系统
```



## 海德汉(Heidenhain)
```
Heidenhain 530
Heidenhain 620
Heidenhain 640
```



## 兄弟(Brother)
```
支持自带网口全系列Brother CNC
```

## 广州数控(GSK)
```
GSK 988
GSK 980tdi
GSK 980mdi
GSK 980mdc
GSK 980tdc
GSK 25i
```

## 新代(Syntec)
支持V2及以上版本
```
10.116.10以前的版本不支持
V2 10.116.10x ~ 10.116.24x
V3 10.116.24x ~ 10.116.36
V4 10.116.36x ~ 最新
```
-----------



# 支持PLC型号列表

## ModBus
```
支持标准ModBus协议,支持TCP和RTU两种模式.
```

## 西门子(Siemens)
```
Siemens Smart200/300/400/1200/1500
```

## 三菱(Mitsubishi)
```
Mitsubishi Fx系列/Q系列/A系列
```

## 欧姆龙(Omron)
```
Omron CH系列
```

## 罗克韦尔(AB)
```
全系列
```

# ROBOT

## 库卡(KUKA)
```
全系列
```
