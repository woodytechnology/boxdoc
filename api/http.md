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