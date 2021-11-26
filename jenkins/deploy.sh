#!/bin/bash

echo "Deploy Stage"

ssh jenkins@swarm-manager docker stack deploy --compose-file docker-compose.yaml todo-app
