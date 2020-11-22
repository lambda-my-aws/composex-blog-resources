FROM confluentinc/cp-kafka-connect:5.5.1
RUN apt-get update && apt-get install jq -y && rm -rf /var/lib/apt/lists/*
COPY start.sh /etc/confluent/docker/start.sh
CMD ["/etc/confluent/docker/start.sh"]
