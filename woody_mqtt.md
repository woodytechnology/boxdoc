# 巫迪协议

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
## 订阅Demo

### Java

```java
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.fusesource.mqtt.client.*;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

class Alarm {
    public String alarm_type;
    public String alarm_msg;
    public int alarm_no;
}

class Position {
    public String axis;
    public Double value;
}

class Value {
    public String name;
    public Object value;
}

class Root {
    public String device_id;
    public long ts;
    public String device_type;
    public Value[] values;
}

public class JavaDemo {
    final static String TOPIC_NAME = "data/+/v1";
    final static String IP = "127.0.0.1";
    final static int PORT = 1883;

    public static void run() throws Exception {
        MQTT mqtt = new MQTT();
        mqtt.setHost(IP, PORT);
        BlockingConnection connection = mqtt.blockingConnection();
        connection.connect();
        System.out.println("Connected to Broker!");
        Topic[] topics = {new Topic(TOPIC_NAME, QoS.EXACTLY_ONCE)};
        connection.subscribe(topics);
        Type AlarmType = new TypeToken<ArrayList<Alarm>>() {
        }.getType();
        Type PositionType = new TypeToken<ArrayList<Position>>() {
        }.getType();
        while (true) {
            Message message = connection.receive(10, TimeUnit.SECONDS);
            if (message != null) {
                Type RooList = new TypeToken<ArrayList<Root>>() {
                }.getType();
                ArrayList<Root> table = new Gson().fromJson(new String(message.getPayload()), RooList);
                for (Root tt : table) {
                    System.out.println(tt.device_id);
                    for (Value value : tt.values) {
                        System.out.print(value.name + "\t");
                        if (value.value instanceof java.util.ArrayList) {
                            if (value.name.equals("cnc_alarm")) {
                                ArrayList<Alarm> alarms = new Gson().fromJson(value.value.toString(), AlarmType);
                                for (Alarm alarm : alarms) {
                                    System.out.print("\nalarm_no:" + alarm.alarm_no + "\talarm_type:" + alarm.alarm_type + "\talarm_msg:" + alarm.alarm_msg);
                                }
                            } else {
                                ArrayList<Position> position = new Gson().fromJson(value.value.toString(), PositionType);
                                for (Position axis : position) {
                                    System.out.print(axis.axis + ":" + axis.value + "\t");
                                }
                            }
                        } else {
                            System.out.print(value.value);
                        }
                        System.out.println();
                    }
                }
                message.ack();
            }
        }
    }

    public static void main(String[] args) throws Exception {
        JavaDemo.run();
    }
}
```
### .Net core

```csharp
using System;
using MQTTnet;
using MQTTnet.Client;
using MQTTnet.Client.Options;
using System.Text;
using System.Collections.Generic;
namespace dotnet_demo
{
    public class Position
    {
        public string axis { set; get; }
        public string value { set; get; }
    }

    public class Alarm
    {
        public int alarm_no { set; get; }
        public string alarm_type { set; get; }
        public string alarm_msg { set; get; }
    }

    public class Values
    {
        public string name { get; set; }
        public object value { get; set; }
    }

    public class Root
    {
        public string device_id { get; set; }
        public long ts { get; set; }
        public string device_type { get; set; }
        public List<Values> values { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            string topicSubscribe = "data/+/v1";
            MqttClient mqttClient = new MqttFactory().CreateMqttClient() as MqttClient;
            mqttClient.UseConnectedHandler(async handle =>
                {
                    var result = await mqttClient.SubscribeAsync(new MqttTopicFilter()
                    {
                        Topic = topicSubscribe,
                        QualityOfServiceLevel = MQTTnet.Protocol.MqttQualityOfServiceLevel.AtLeastOnce
                    });
                });
            mqttClient.UseApplicationMessageReceivedHandler(handle =>
                {
                    var payload = Encoding.Default.GetString(handle.ApplicationMessage.Payload);
                    List<Root> table = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Root>>(payload);
                    foreach (var m in table)
                    {
                        foreach (var s in m.values)
                        {
                            Console.Write(s.name + "\t");
                            if (typeof(Newtonsoft.Json.Linq.JArray) == s.value.GetType())
                            {
                                if (s.name == "cnc_alarm")
                                {
                                    List<Alarm> alarms = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Alarm>>(s.value.ToString());
                                    foreach (var alarm in alarms)
                                    {
                                        Console.WriteLine("\nalarm_no:" + alarm.alarm_no.ToString() + "\talarm_type:" + alarm.alarm_type + "\talarm_msg:" + alarm.alarm_msg);
                                    }
                                }
                                else
                                {
                                    List<Position> pos = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Position>>(s.value.ToString());
                                    foreach (var axis in pos)
                                    {
                                        Console.Write(axis.axis + ":" + axis.value.ToString() + "\t");
                                    }
                                }
                            }
                            else
                            {
                                Console.Write(s.value);
                            }
                            Console.WriteLine();
                        }
                    }
                });
            var options = new MqttClientOptionsBuilder()
                .WithProtocolVersion(MQTTnet.Formatter.MqttProtocolVersion.V311)
                .WithClientId(Guid.NewGuid().ToString().Substring(0, 5))
                .WithTcpServer("127.0.0.1", 1883)
                .WithCleanSession()
                .Build();
            mqttClient.ConnectAsync(options);
            Console.ReadKey();
        }
    }
}
```

### Python 

```python
import json

import paho.mqtt.client as mqtt


def on_connect(mqtt_client, userdata, flags, rc):
    mqtt_client.subscribe('data/+/v1')


def on_message(mqtt_client, userdata, msg):
    try:
        table = json.loads(msg.payload)
        for tt in table:
            print(tt.get('device_id'))
            for value in tt.get('values'):
                print(value.get('name'), end='\t')
                data = value.get('value')
                if isinstance(data, list):
                    if value.get('name') == 'cnc_alarm':
                        for alarm in data:
                            print(
                                f'\nalarm_no:{alarm.get("alarm_no")}\talarm_type:{alarm.get("alarm_type")}\talarm_msg:{alarm.get("alarm_msg")}',
                                end='')
                    else:
                        for axis in data:
                            print(f'{axis.get("axis")}:{axis.get("value")}', end='\t')
                else:
                    print(data, end='')
                print('')
    except Exception as e:
        print(e)


mqtt_client = mqtt.Client()
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message
mqtt_client.connect('127.0.0.1', 1883, 60)

if __name__ == '__main__':
    mqtt_client.loop_forever()
```

### Golang

```golang
package main

import (
	"encoding/json"
	"fmt"
	mqtt "github.com/eclipse/paho.mqtt.golang"
	uuid "github.com/satori/go.uuid"
	"time"
)

type Alarm struct {
	AlarmType string `json:"alarm_type,omitempty"`
	AlarmMsg  string `json:"alarm_msg,omitempty"`
	AlarmNo   int64  `json:"alarm_no,omitempty"`
}
type Position struct {
	Axis  string  `json:"axis,omitempty"`
	Value float64 `json:"value,omitempty"`
}
type Value struct {
	Name  string      `json:"name,omitempty"`
	Value interface{} `json:"value,omitempty"`
}
type Root struct {
	DeviceId   string  `json:"device_id,omitempty"`
	DeviceType string  `json:"device_type,omitempty"`
	Ts         int64   `json:"ts,omitempty"`
	Values     []Value `json:"values,omitempty"`
}

func reciveHandler(client mqtt.Client, m mqtt.Message) {
	var messages []Root
	_ = json.Unmarshal(m.Payload(), &messages)
	for _, message := range messages {
		fmt.Println(message.DeviceId)
		for _, value := range message.Values {
			fmt.Print(value.Name + "\t")
			switch value.Value.(type) {
			case []interface{}:
				if value.Name == "cnc_alarm" {
					_alarm, _ := json.Marshal(value.Value)
					var alarms []Alarm
					_ = json.Unmarshal(_alarm, &alarms)
					for _, alarm := range alarms {
						fmt.Printf("\nalarm_no:%d\talarm_type:%s\talarm_msg:%s", alarm.AlarmNo, alarm.AlarmType, alarm.AlarmMsg)
					}
				} else {
					_position, _ := json.Marshal(value.Value)
					var position []Position
					_ = json.Unmarshal(_position, &position)
					for _, axis := range position {
						fmt.Printf("%s:%f\t", axis.Axis, axis.Value)
					}
				}
			default:
				fmt.Print(value.Value)
			}
			fmt.Println()
		}
	}
}
func main() {
	topic := "data/+/v1"
	address := "tcp://wuyun.pro:1883"
	u1, _ := uuid.NewV4()
	opts := mqtt.NewClientOptions().AddBroker(address).SetClientID(u1.String())
	c := mqtt.NewClient(opts)
	if token := c.Connect(); token.Wait() && token.Error() != nil {
		panic(token.Error())
	}
	if token := c.Subscribe(topic, 0, reciveHandler); token.Wait() && token.Error() != nil {
		fmt.Println(token.Error())
	}
	for {
		time.Sleep(1 * 1000 * 1000)
	}
}

```