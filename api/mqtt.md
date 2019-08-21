# MQTT API

MQTT API是对HTTP的一层封装,但是基于MQTT的特性,需要将请求与返回分开

## 请求

topic为 control/{gateway_id}/v1 gateway_id为网关ID
请求报文为
```json
{
  "cmd_id": "uuid",
  "method": "PUT",
  "url": "/api/device/{device_name}/control_by_name",
  "data": {
    "key": "M100",
    "value": 1,
    "value_type": 1
  }
}
```
其中
* cmd_id为指令唯一编号,建议用uuid,返回主题的payload会与之匹配
* url参考http api
* method 参考http api
* data 参考http api的request body,若无请求body,请用"data":null


## 返回

topic为 echo/{gateway_id}/v1 gateway_id为网关ID
每次发完control主题后,都会有echo
请求报文为
```json
{
  "cmd_id": "uuid",
  "msg": "OK",
  "ret": 0
}
```
其中
* cmd_id为指令唯一编号,与control中的cmd_id匹配
* msg,请求返回值
* ret 若请求成功,值为0,若失败,参考http api的http_statuscode
