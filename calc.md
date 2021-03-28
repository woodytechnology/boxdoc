# 边缘计算

本网关提供基础的边缘计算功能,边缘计算暂时支持每个变量的独立计算与单个设备所有变量同时参与计算两种

关于Lua语法,参见[Lua 教程](https://www.runoob.com/lua/lua-tutorial.html)

## 单变量计算

### 规则

单个变量脚本支持两个输入参数,函数名必须为calc,参数变量名可以自行决定
```lua
function calc(current,last)
    --[[
    current:    本次采集到的值,注意,此处的值有可能为数字,字符串,array,table等Lua数据类型,需要根据不同变量做判断
    last:       上次采集到的值,如果为第一次采集则为空
    return:     计算完返回的变量,可以为数字,array,table,字符串等
    如果脚本错误,上报的数据为错误内容
    ]]
    current=current+1
    return current
end
```

### 测试

如图,当前值输入脚本的第一个参数,上次值输入脚本的第二个参数,然后输入脚本,执行后,输出里即可得到return的值

**注意,如果输入值为数字,则直接输入数字,如果输入值为字符串,则输入带引号的字符串,如果输入值为table,则输入json格式**

![](/img/calc-2.png)

### 配置

在采集配置编辑与添加页面选择高级功,可以针对变量配置脚本,如下图,选择对应的变量点击编辑边缘计算,在脚本框输入经过测试的脚本即可

![](/img/calc-1.png)

## 设备计算

### 规则

设备计算脚本支持一个输入参数,函数名必须为calc,参数变量名可以自行决定
```lua
function calc(value)
    --[[
    value:      本次所有采集到的变量,格式为一个table,可以使用变量名取到值
    return:     计算完返回的变量,建议使用以输入相同的数据结构输出,否则可能会导致推送失败
    如果脚本错误,上报的数据内会增加一个为script_error的字段卖,内容为错误内容
    ]]
    value.run_status="正常"
    return value
end
```

### 测试

如图,全局变量输入脚本的参数,然后输入脚本,执行后,输出里即可得到return的值

**注意,输入为严格的json格式**

![](/img/calc-3.png)

### 配置

在采集配置编辑与添加页面中,将测试过的脚本输入边缘计算框即可,如下图

![](/img/calc-4.png)


## 内置方法

```lua
push_message(msg,topic)
通过现有mqtt配置推送消息
msg: 消息
topic:可选,默认为数据topic


set_key(key,value,persistant)
写入缓存变量
key: 变量名
value: 值
persistant: 是否持久化,0存入redis,1存入sqlite


del_key(key,persistant)
删除缓存变量
key: 变量名
persistant: 是否持久化,0存入redis,1存入sqlite

get_key(key,persistant)
获取缓存变量
key: 变量名
persistant: 是否持久化,0存入redis,1存入sqlite
return: 变量的值
```


## 示例

### 将某个变量结果+1

```lua
function calc(current,last)
    current=current+1
    return current
end
```

### 将某个变量结果 追加一个字符串

```lua
function calc(current,last)
    current=current .. "woody"
    return current
end
```

### 联合两个变量计算出新的变量

```lua
function calc(value)
    if(value.cnc_runstatus==1 and #value.cnc_alarm>0)
    then
        value.custom=2
    end
    return value
end
```


### 删除某个变量

```lua
function calc(value)
    value.cnc_runstatus=nil
    return value
end
```

### 将Alarm的Array[Object]展开成普通变量

```json
{
  "cnc_alarm": [
    {
      "alarm_no": 1,
      "alarm_type": "T01",
      "alarm_msg": "待机中"
    },
    {
      "alarm_no": 204,
      "alarm_type": "XXX",
      "alarm_msg": "急停"
    }
  ]
}
```
转换成
```json
{
  "cnc_alarm_1_msg": "待机中",
  "cnc_alarm_1_no": 1,
  "cnc_alarm_1_type": "T01",
  "cnc_alarm_2_msg": "急停",
  "cnc_alarm_2_no": 204,
  "cnc_alarm_2_type": "XXX"
}
```
```lua
function calc(value)
    for i, v in ipairs(value.cnc_alarm) do
        value['cnc_alarm_' .. i .. '_msg'] = v.alarm_msg
        value['cnc_alarm_' .. i .. '_no'] = v.alarm_no
        value['cnc_alarm_' .. i .. '_type'] = v.alarm_type
    end
    value.cnc_alarm = nil
    return value
end
```


### 将坐标的Array[Object]展开成普通变量

```json
{
  "cnc_mecpos": [
    {
      "axis": "X",
      "value": -84.4
    },
    {
      "axis": "Y",
      "value": 2.986
    },
    {
      "axis": "Z",
      "value": -108.181
    }
  ]
}
```
转换成
```json
{
  "cnc_mecpos_X": -84.4,
  "cnc_mecpos_Y": 2.986,
  "cnc_mecpos_Z": -108.181
}
```

```lua
function calc(value)
    for i, v in ipairs(value.cnc_mecpos) do
        value['cnc_mecpos_'..v.axis]=v.value
    end
    value.cnc_mecpos=nil
    return value
end
```