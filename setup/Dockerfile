FROM mongo

# Create app directory
WORKDIR /docker/workdir/mongo-rs0/configs

# Install app dependencies
COPY replicaSet.js .
COPY setup.sh .
RUN chmod +x setup.sh

CMD ["./setup.sh"]
