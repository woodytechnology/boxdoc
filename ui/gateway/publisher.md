# 网关推送

目前支持多种平台推送,其他协议如有需求,联系售后,可持续迭代添加,**修改推送后,需要重启服务生效**

![](/img/gateway_pub.png)

通用MQTT为网关默认推送协议,推送主题为```data/{gateway_id}/v1```,gateway_id为网关信息里的网关ID,推送格式如下

```json
[
  {
    "device_id": "Test",
    "ts": 1561994655032,
    "device_type": "fanuc",
    "values": [
      {
        "name": "cnc_products",
        "value": 20559
      },
      {
        "name": "cnc_type",
        "value": "FANUC 0i MF"
      },
      {
        "name": "device_state",
        "value": 0
      },
      {
        "name": "cnc_mecpos",
        "value": [
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
      },
      {
        "name": "cnc_alarm",
        "value": [
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
    ]
  }
]
```
通用MQTT支持反向控制,具体控制方法参照[API接口](/api/mqtt.md)
