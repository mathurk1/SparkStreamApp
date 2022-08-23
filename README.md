# SparkStreamApp

### Technical Components:

Currently there are three components:
1. **zookeeper**: primarily used by kafka to manage services/broker
2. **kafka**: the kafka broker to act as the medium through which realtime/streaming data will be passed to the spark structured streaming app
3. **spark**: the app in which the structured streaming code will be explored/written. Currently it reads from the kafka service

### Component names:

1. **spark cluster**: spark version 3.3, exposed as `spark`
2. **kafka**: confluent kafka exposed as `broker` on port `9092`

### To run this app:

1. run the docker containers using `docker-compose up` or vscode dev containers
2. create a kafka topic
    ```
    docker exec broker \
    kafka-topics --bootstrap-server broker:9092 \
             --create \
             --topic your-topic-name
    ```
3. pass messages to the topic
    ```
    docker exec --interactive --tty broker \
    kafka-console-producer --bootstrap-server broker:9092 \
                       --topic your-topic-name
    ```
4. update the spark streaming app `src/app.py` to ensure it is referencing the correct topic


### References:

confluent kafka: https://developer.confluent.io/quickstart/kafka-docker/