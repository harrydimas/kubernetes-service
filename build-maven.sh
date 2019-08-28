#!/bin/bash
echo "***************************"
echo "******* Building jar ******"
echo "***************************"
PROJECT=$1
IMAGE_TAG=$2
echo "Project dir > $PROJECT"
echo "Iamge tag > $IMAGE_TAG"
docker run --rm  -v  $(pwd)/$PROJECT:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine mvn install -DskipTests \
&& cd $PROJECT/ \
&& docker image build -t $IMAGE_TAG .
