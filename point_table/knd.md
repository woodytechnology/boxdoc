# KND 点位地址

#### 内置点位




| 点位名称 | 点位地址 | 描述 | 数据类型 |
| -- | -- | -- | -- | -- |
| 加工零件数 | cnc_products | cnc生产件数 | Number |
| CNC的IP地址 | cnc_ip | CNC的IP地址 | String |
| CNC ID | cnc_id | CNC ID | String |
| CNC型号 | cnc_type | 说明机床类型 | String |
| 切削时间 | cnc_cuttime | 加工总时间 秒| Number |
| 循环时间 | cnc_cycletime | 单次加工时间 秒| Number |
| 开机时间 | cnc_alivetime | 数控系统工作时间 秒 | Number |
| 运行时间 | cnc_runtime | 加工程序运行总时间 秒| Number |
| 绝对坐标 | cnc_ablpos | 编程前会指定一个原点，建立坐标系 | List[Object] |
| 机械坐标 | cnc_mecpos | 机床厂家设定的坐标系 | List[Object] |
| 相对坐标 | cnc_relpos | 在刀尖当前所在位置建立的坐标系 | List[Object] |
| 报警 | cnc_alarm | 报警 | List[Object] |
| 执行的NC主程序号 | cnc_mainproname | cnc当前加工执行的主程序号 | String |
| 快速移动倍率 | cnc_rapidfeed | 操作面板上快速移动倍率旋钮对应数值 | Number |
| 切削倍率 | cnc_frate | 操作面板上进给倍率旋钮对应数值 | Number |
| 当前所处运行模式 | cnc_runstatus | 当前设备运行状态 | Enum |
| 当前所处操作模式 | cnc_mode | 操作面板操作模式对应的模式 | Enum |
| 软件版本 | cnc_softversion | 软件版本 | String |
| FPGA版本 | cnc_fpgaversion | FPGA版本 | String |
| T型图版本 | cnc_ladderversion | T型图版本 | String |
| 是否就绪 | cnc_isready | 是否就绪 | Boolean |
| 未就绪原因 | cnc_notreadyreason | 未就绪原因 | String |
| 当前工件坐标系 | cnc_curworkcoor | 当前工件坐标系 | String |
| 当前系统坐标系 | cnc_curworkcoorsystem | 当前系统坐标系 | String |
| 手动切削倍率 | cnc_jograte | 手动切削倍率 | Number |;