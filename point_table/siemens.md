# Siemens CNC点位地址

#### 内置点位




| 点位名称 | 点位地址 | 描述 | 数据类型 |
| -- | -- | -- | -- | -- |
| CNC ID | cnc_id | CNC ID | String |
| CNC型号 | cnc_type | 说明机床类型 | String |
| 软件版本 | cnc_softver_version | 软件版本 | String |
| CNC的IP地址 | cnc_ip | CNC的IP地址 | String |
| 报警 | cnc_alarm | 报警 | List[Object] |
| 是否急停 | cnc_emer | 设备是否处于急停状态 | Boolean |
| 执行的NC主程序号 | cnc_mainproname | cnc当前加工执行的主程序号 | String |
| 加工零件数 | cnc_products | cnc生产件数 | Number |
| 当前所处操作模式 | cnc_mode | 操作面板操作模式对应的模式 | Enum |
| 循环时间 | cnc_cycletime | 单次加工时间 秒| Number |
| 当前刀具号 | cnc_toolnum | 当前加工主轴上的刀具编号 | String |
| 机械坐标 | cnc_mecpos | 机床厂家设定的坐标系 | List[Object] |
| 相对坐标 | cnc_relpos | 在刀尖当前所在位置建立的坐标系 | List[Object] |
| 剩余坐标 | cnc_respos | 剩余坐标是G01的切削终点的距离 | List[Object] |
| 主轴设定速度S | cnc_setsspeed | 宏变量中程序运行时定义的设定主轴转速 | Number |
| 主轴实际转速S | cnc_actsspeed | 加工中主轴实际转速 | Number |
| 进给设定转速S | cnc_setfspeed | 宏变量中程序运行时定义的进给主轴转速（矢量值） | Number |
| 进给实际转速S | cnc_actfspeed | 加工中进给轴实际转速矢量值 | Number |
| 主轴负载 | cnc_sload | 主轴负荷值 | Number |
| 进给轴负载 | cnc_fload | 各进给轴的负荷值 | Number |
| 当前所处运行模式 | cnc_runstatus | 当前设备运行状态 | Enum |
| 主轴倍率 | cnc_srate | 操作面板主轴旋率对应的数值 | Number |
| 切削倍率 | cnc_frate | 操作面板上进给倍率旋钮对应数值 | Number |
| 电机温度 | cnc_temper | 电机温度 | Number |
| 轴名称 | cnc_axisname | 轴名称 | String |
| 剩余时间 | cnc_remtime | 剩余时间 | Number |
| 母线电压 | cnc_voltage | 母线电压 | Number |
| 实际电流 | cnc_current | 实际电流 | Number |
| 刀具半径补偿编号 | cnc_toolradiusnum | 刀具半径补偿编号 | Number |
| 刀具长度补偿编号 | cnc_toollengthnum | 刀具长度补偿编号 | Number |
| 刀具X补偿 | cnc_toollengthx | 刀具X补偿 | Number |
| 刀具Z补偿 | cnc_toollengthz | 刀具Z补偿 | Number |
| 刀沿位置 | cnc_tooledg | 刀沿位置 | Number |