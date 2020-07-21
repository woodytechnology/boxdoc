# Brother点位地址

#### 内置点位




| 点位名称 | 点位地址 | 描述 | 数据类型 |
| -- | -- | -- | -- | -- |
| 加工零件数 | cnc_products | cnc生产件数 | Number |
| 报警 | cnc_alarm | 报警 | List[Object] |
| 绝对坐标 | cnc_ablpos | 编程前会指定一个原点，建立坐标系 | List[Object] |
| 机械坐标 | cnc_mecpos | 机床厂家设定的坐标系 | List[Object] |
| 相对坐标 | cnc_relpos | 在刀尖当前所在位置建立的坐标系 | List[Object] |
| 剩余坐标 | cnc_respos | 剩余坐标是G01的切削终点的距离 | List[Object] |
| CNC版本 | cnc_version | CNC版本 | String |
| CNC的IP地址 | cnc_ip | CNC的IP地址 | String |
| CNC ID | cnc_id | CNC ID | String |
| 快速移动倍率 | cnc_rapidfeed | 操作面板上快速移动倍率旋钮对应数值 | Number |
| 切削倍率 | cnc_frate | 操作面板上进给倍率旋钮对应数值 | Number |
| 主轴倍率 | cnc_srate | 操作面板主轴旋率对应的数值 | Number |
| 当前刀具号 | cnc_toolnum | 当前加工主轴上的刀具编号 | Number |
| 主轴实际转速S | cnc_actspeed | 加工中主轴实际转速 | Number |
| 进给实际转速S | cnc_actfspeed | 加工中进给轴实际转速矢量值 | Number |
| 当前所处运行模式 | cnc_runstatus | 当前设备运行状态 | Enum |
| 当前所处操作模式 | cnc_mode | 操作面板操作模式对应的模式 | Enum |
| 执行的NC主程序号 | cnc_mainproname | cnc当前加工执行的主程序号 | String |
| CNC型号 | cnc_type | 说明机床类型 | String |
