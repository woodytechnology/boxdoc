# 网络配置

> [!Danger]
> 配置网络之后必须**重启设备**
>
> 插4G卡后必须**断电重启**

如图,根据不同硬件选配,网卡数量不同.
* 有线网卡可以配置[DHCP(动态获取IP地址)](https://baike.baidu.com/link?url=tMl3o7MU_uQ3t_6RBZS3BqZoqdWuD4TqI_2cSEFTwEpp2C1LXhDn_vqc3tvZgdLQULlKcCJSMHBKSe7-wlvj4_)或静态IP地址.
* [子网掩码](https://www.baidu.com/link?url=dv1tG6_QxG_O2QgPiuR4HBNXV4wSJ-2FgRCJSYiQxQc33591e0YKAcEcJ9mzykdTuwcTNO2dT9Q22TeP6CRBYzjnvTwLtDgPJydgRjbFcC0xkjEYfz_OoLdJRBybC6un&wd=&eqid=93bbf87200014c21000000025d5c0d45)表示方法为掩码长度,0-32位的数字,可以用[子网掩码计算器](https://tool.chinaz.com/Tools/subnetmask)计算
* 无线网络输入SSID和密码即可, 如果需要禁用无线网络,清空输入即可
* 所有网络修改完必须<font color=red>**重启设备**</font>,否则不会生效
* 所有网卡的网络配置必须保证IP地址不在同一网段,包括DHCP获取的IP和手动配置的静态IP
* eth0 为 net0, eth1 为 net1
* 4G网络插卡<font color=red>**断电重启**</font>即可, 无需配置
![](/img/network.png)