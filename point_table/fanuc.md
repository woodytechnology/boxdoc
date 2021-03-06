# Fanuc点位地址

#### 内置点位




| 点位名称 | 点位地址 | 描述 | 数据类型 |
| -- | -- | -- | -- | -- |
| 加工零件数 | cnc_products | cnc生产件数 | Number |Do
| CNC的IP地址 | cnc_ip | CNC的IP地址 | String |
| 开机时间 | cnc_alivetime | 数控系统工作时间 秒 | Number |
| 运行时间 | cnc_runtime | 加工程序运行总时间 秒| Number |
| 切削时间 | cnc_cuttime | 加工总时间 秒| Number |
| 循环时间 | cnc_cycletime | 单次加工时间 秒| Number |
| CNC型号 | cnc_type | 说明机床类型 | String |
| 当前刀具号 | cnc_toolnum | 当前加工主轴上的刀具编号 | String |
| 当前刀补编号 | cnc_tooloffsetnum | 当前加工刀具对应刀补号 | String |
| 执行的NC主程序号 | cnc_mainproname | cnc当前加工执行的主程序号 | String |
| 当前加工程序语句号 | cnc_seq | cnc当前执行程序内容的语句号 | Number |
| 当前加工程序内容 | cnc_currentpro | cnc当前执行程序/指定程序名称内容 | String |
| 当前所处操作模式 | cnc_mode | 操作面板操作模式对应的模式 | Enum |
| 是否急停 | cnc_emer | 设备是否处于急停状态 | Boolean |
| 绝对坐标 | cnc_ablpos | 编程前会指定一个原点，建立坐标系 | List[Object] |
| 机械坐标 | cnc_mecpos | 机床厂家设定的坐标系 | List[Object] |
| 相对坐标 | cnc_relpos | 在刀尖当前所在位置建立的坐标系 | List[Object] |
| 剩余坐标 | cnc_respos | 剩余坐标是G01的切削终点的距离 | List[Object] |
| CNC ID | cnc_id | CNC ID | String |
| 快速移动倍率 | cnc_rapidfeed | 操作面板上快速移动倍率旋钮对应数值 | Number |
| 主轴设定速度S | cnc_setspeed | 宏变量中程序运行时定义的设定主轴转速 | Number |
| 主轴实际转速S | cnc_actspeed | 加工中主轴实际转速 | Number |
| 进给设定转速S | cnc_setfspeed | 宏变量中程序运行时定义的进给主轴转速（矢量值） | Number |
| 进给实际转速S | cnc_actfspeed | 加工中进给轴实际转速矢量值 | Number |
| 主轴负载 | cnc_sload | 主轴负荷值 | Number |
| 进给轴负载 | cnc_fload | 各进给轴的负荷值 | Number |
| 主轴温度 | cnc_stemper | 主轴电机温度 | Number |
| 伺服温度 | cnc_ftemper | 伺服电机温度 | List[Object]  |
| 主轴倍率 | cnc_srate | 操作面板主轴旋率对应的数值 | Number |
| 切削倍率 | cnc_frate | 操作面板上进给倍率旋钮对应数值 | Number |
| 加工状态 | cnc_gcode | 判断G0/G1或其他G代码加工状态或加工坐标系 | String |
| 当前所处运行模式 | cnc_runstatus | 当前设备运行状态 | Enum |
| 程序列表 | cnc_programlist | 程序列表 | List[Object]  |
| 最大通道 | cnc_maxpath | 多通道设备最大通道数 | Number |
| 当前通道 | cnc_currentpath | 多通道设备当前通道 | Nubmer|
| 报警 | cnc_alarm | 报警 | List[Object] |

#### 添加点位

| 变量类型 | 变量名示例 | 变量地址示例 | 数据类型 |
| -- | -- | -- | -- | -- |
| 宏变量 | macro1 | 100 | Number |
| 设备PLC | plc1 | G0012 | Number |
| 设备诊断 | dia1 | 4000 | Number/List[Object] |
| 设备参数 | pamar1 | 6217 | Number/List[Object] |


#### 数据字典

###### cnc_mode

``` json
{
    "Mdi":0,
    "Memory":1, 
    "None":2,
    "Edit":3, 
    "Handle":4,
    "Jog":5, 
    "TeachinJog":6,
    "TeachinHandle":7,
    "Incfeed":8,
    "Reference":9,
    "Remote":10,
    "Other":11
}
```

###### cnc_runstatus

``` json
{
    "RESET":0,
    "STOP":1, 
    "HOLD":2,
    "START":3, 
    "MSTR":4,
    "Other":5
}
```

###### cnc_emer

``` json
{
    "NotEmergency":0,
    "Emergency":1, 
    "Reset":2,
    "Wait":3, 
    "Others":4
}
```