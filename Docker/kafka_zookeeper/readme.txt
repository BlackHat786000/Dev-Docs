########################################################### FOR AMAZON EC2 UBUNTU ######################################################################

install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

create docker-compose.yml
mkdir kafka-zookeeper
cd kafka-zookeeper

run docker compose
sudo docker-compose up -d

check logs on errors
sudo docker-compose logs kafka
sudo docker-compose logs zookeeper



Accessing Kafka
To send messages to the Kafka broker, use the public IP of your EC2 instance and port 9092. For example:
kafka-console-producer.sh --broker-list <your-EC2-public-ip>:9092 --topic test


And to consume messages:
kafka-console-consumer.sh --bootstrap-server <your-EC2-public-ip>:9092 --topic test --from-beginning



########################### FROM WINDOWS #######################################################################
create topic
.\bin\windows\kafka-topics.bat --create --topic test_topic --bootstrap-server 3.7.70.136:9092

write event into topic
.\bin\windows\kafka-console-producer.bat --topic test_topic --bootstrap-server 3.7.70.136:9092

read events from topic
.\bin\windows\kafka-console-consumer.bat --topic test_topic --from-beginning --bootstrap-server 3.7.70.136:9092


if kafka-python giving externally managed env error, install system wide (not recommended)
pip install --break-system-packages kafka-python-ng
pip install --break-system-packages confluent-kafka
