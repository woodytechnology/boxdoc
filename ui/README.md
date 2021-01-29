# 管理界面

## 登录方式
首次使用管理界面需要先确认电脑与网关的网络硬件连接正常,依据连接的网络接口不同和电脑设置的ip,可选择以下地址登陆
* NET0: <http://192.168.0.15:9080>
* NET1: <http://10.10.80.15:9080>
* NET0: <http://192.168.253.254:9080>
* NET1: <http://192.168.254.254:9080>

此外,默认情况下VPN是连接的,如果插入4G卡使得网关拥有外网,也可以通过VPN管理后台的地址登陆


## 网关流程

```flow
st=>start: 开始
e=>end: 结束
op1=>operation: 设置机床网络
op2=>operation: 设置网关网络
c1=>condition: Ping测试/端口测试
op3=>operation: 配置采集
op4=>operation: 配置网关推送:
st->op1->op2(right)->c1
c1(no)->op1
c1(yes)->op3->op4->e
```