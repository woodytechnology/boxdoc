# HTTP API
## BASEURL

/api

### 登录
#### 请求

- Method: **POST**
- URL: ```/user/login```
- Headers： Content-Type:application/json
- Body:
```json
{
    "username" : "admin",
    "password" : "password"
}
```

#### 返回
- 200
```json
{
    "token": "uuid"
}
```
- 400 请求参数错误
- 410 密码错误

### 登出
#### 请求

- Method: **DELETE**
- URL: ```/user/login```
- Headers： Content-Type:application/json JWT:{token}

#### 返回
- 204 OK
- 401 未登录

### 获取用户信息
#### 请求

- Method: **GET**
- URL: ```/user/info```
- Headers： Content-Type:application/json JWT:{token}

#### 返回
- 200
```json
{
    "avatar":"",
    "name":"admin"
}
```
- 401 未登录

### 修改密码
#### 请求

- Method: **POST**
- URL: ```/user/change_password```
- Headers： Content-Type:application/json JWT:{token}
- Body:
```json
{
    "password" : "password",
    "password2" : "password2"
}
```
#### 返回
- 204 OK
- 400 请求参数错误
- 401 未登录
- 410 密码错误

### 设备列表
#### 请求

- Method: **GET**
- URL: ```/device```
- Headers： Content-Type:application/json

#### 返回
- 200
```json
[
    {
        "baud": 9600,
        "data_bits": 8,
        "did": "FanucTest112",
        "enable": true,
        "id": 1,
        "interval": 1.0,
        "ip": "192.168.1.1",
        "items": [
            {
            "address": "",
            "address_type": "",
            "function_code": 3,
            "id": 1,
            "interval": 1,
            "item_name": "cnc_type",
            "size": 0,
            "sub_address": 0,
            "value_type": 1
            }
        ],
        "model": "all",
        "parity": "N",
        "port": 8193,
        "protocol": "fanuc",
        "serial": "/dev/ttyO2",
        "slave_id": 1,
        "stop_bits": 1,
        "type": "fanuc"
    }
]
```

### 添加设备
#### 请求

- Method: **POST**
- URL: ```/device```
- Headers： Content-Type:application/json
- Body:
```json
{
    "baud": 9600,
    "data_bits": 8,
    "did": "FanucTest112",
    "enable": true,
    "interval": 1.0,
    "ip": "192.168.1.1",
    "items": [
        {
        "address": "",
        "address_type": "",
        "function_code": 3,
        "id": 1,
        "interval": 1,
        "item_name": "cnc_type",
        "size": 0,
        "sub_address": 0,
        "value_type": 1
        }
    ],
    "model": "all",
    "parity": "N",
    "port": 8193,
    "protocol": "fanuc",
    "serial": "/dev/ttyO2",
    "slave_id": 1,
    "stop_bits": 1,
    "type": "fanuc"
}
```

#### 返回
- 201 填加OK
- 400 请求参数错误
- 409 授权数量不匹配

### 获取单个设备
#### 请求

- Method: **GET**
- URL: ```/device/{device_id}```
- Headers： Content-Type:application/json

#### 返回
- 200
```json
{
    "baud": 9600,
    "data_bits": 8,
    "did": "FanucTest112",
    "enable": true,
    "id": 1,
    "interval": 1.0,
    "ip": "192.168.1.1",
    "items": [
        {
        "address": "",
        "address_type": "",
        "function_code": 3,
        "id": 1,
        "interval": 1,
        "item_name": "cnc_type",
        "size": 0,
        "sub_address": 0,
        "value_type": 1
        }
    ],
    "model": "all",
    "parity": "N",
    "port": 8193,
    "protocol": "fanuc",
    "serial": "/dev/ttyO2",
    "slave_id": 1,
    "stop_bits": 1,
    "type": "fanuc"
}
```
- 404 未找到资源

### 修改设备
#### 请求

- Method: **PUT**
- URL: ```/device/{device_id}```
- Headers： Content-Type:application/json
- Body:
```json
{
    "baud": 9600,
    "data_bits": 8,
    "did": "FanucTest112",
    "enable": true,
    "interval": 1.0,
    "ip": "192.168.1.1",
    "items": [
        {
        "address": "",
        "address_type": "",
        "function_code": 3,
        "id": 1,
        "interval": 1,
        "item_name": "cnc_type",
        "size": 0,
        "sub_address": 0,
        "value_type": 1
        }
    ],
    "model": "all",
    "parity": "N",
    "port": 8193,
    "protocol": "fanuc",
    "serial": "/dev/ttyO2",
    "slave_id": 1,
    "stop_bits": 1,
    "type": "fanuc"
}
```

#### 返回
- 204 OK
- 400 请求参数错误
- 409 授权数量不匹配
- 404 未找到资源

### 删除设备
#### 请求

- Method: **DELETE**
- URL: ```/device/{device_id}```
- Headers： Content-Type:application/json

#### 返回
- 204 OK
- 404 未找到资源


### 获取设备采集数据
#### 请求

- Method: **GET**
- URL: ```/device/{device_id}/info```
- Headers： Content-Type:application/json

#### 返回
- 200
```json
{
    "cnc_respos": {
        "ts": 1566384648053,
        "value": [
            {
                "axis": "X",
                "value": 0.0
            },
            {
                "axis": "Y",
                "value": 0.0
            },
            {
                "axis": "Z",
                "value": 0.0
            }
        ]
    },
    "cnc_type": {
        "ts": 1566384649570,
        "value": "FANUC 0i MF"
    }
}
```
- 404 未找到资源


### 通过设备名控制变量
#### 请求

- Method: **PUT**
- URL: ```/device/{device_name}/control_by_name```
- Headers： Content-Type:application/json
- Body:
```json
{
    "key": "M100",
    "value": 1,
    "value_type": 1
}
```

#### 返回
- 204 OK
- 400 请求参数错误
- 409 失败
- 404 未找到资源

### 通过设备ID控制变量
#### 请求

- Method: **PUT**
- URL: ```/device/{device_id}/control_by_name```
- Headers： Content-Type:application/json
- Body:
```json
{
    "key": "M100",
    "value": 1,
    "value_type": 1
}
```

#### 返回
- 204 OK
- 400 请求参数错误
- 409 失败
- 404 未找到资源


