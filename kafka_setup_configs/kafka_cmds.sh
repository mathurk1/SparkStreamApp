#start zookeeper
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties

#start kafka broker
bin/kafka-server-start.sh -daemon config/server.properties

#start kafka connect
bin/connect-standalone.sh kafka_2.13-2.6.2/config/connect-standalone.properties connect/connect_config.properties

#list topics
bin/kafka-topics.sh --bootstrap-server=localhost:9092 --list

#get messages
bin/kafka-console-consumer.sh --topic kfcon.kfcon.ride_start --from-beginning --bootstrap-server localhost:9092
