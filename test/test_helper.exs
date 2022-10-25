def seedKafka do
  topic = "test"
  client_id = :my_client
  hosts = [localhost: 9092]

  :ok = :brod.start_client(hosts, client_id, _client_config=[])
  :ok = :brod.start_producer(client_id, topic, _producer_config = [])

  Enum.each(1..1000, fn i ->
    partition = rem(i, 3)
    :ok = :brod.produce_sync(client_id, topic, partition, _key="", "#{i}")
  end)
end


defmodule TestContainers do

  import Excontainers.ExUnit

  zookeeper =
    Container.new("confluentinc/cp-zookeeper:7.0.1")
    |> Container.with_environment("ZOOKEEPER_CLIENT_PORT", 2181)
    |> Container.with_environment("ZOOKEEPER_TICK_TIME", 2000)
    |> Container.with_exposed_port(2181)
    |> Container.

  kafka_broker = Docker.Container.new(
    "confluentinc/cp-kafka:7.0.1")
    |> Container.with_exposed_port(9092)
    |> Container.with_environment("KAFKA_BROKER_ID", 1)
    |> Container.with_environment("KAFKA_ZOOKEEPER_CONNECT", "zookeeper:2181")
    |> Container.with_environment("KAFKA_LISTENER_SECURITY_PROTOCOL_MAP", "PLAINTEXT:PLAINTEXT,PLAINTEXT_INTERNAL:PLAINTEXT")
    |> Container.with_environment("KAFKA_ADVERTISED_LISTENERS", "PLAINTEXT://localhost:9092,PLAINTEXT_INTERNAL://broker:29092")
    |> Container.with_environment("KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR", 1)
    |> Container.with_environment("KAFKA_TRANSACTION_STATE_LOG_MIN_ISR", 1)
    |> Container.with_environment("KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR", 1)

end


ExUnit.start()
