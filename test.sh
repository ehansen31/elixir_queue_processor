# Create a topic
docker exec broker \
kafka-topics --bootstrap-server broker:9092 \
             --create \
             --topic quickstart

# Write messages to the topic
docker exec --interactive --tty broker \
kafka-console-producer --bootstrap-server broker:9092 \
                       --topic test


