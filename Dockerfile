###############################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

###############################################################################
# Build PyFlink Playground Image
###############################################################################

FROM openjdk:slim-buster as jre
COPY --from=python:3.7 / /

FROM flink:1.11.0-scala_2.11 as base
COPY --from=jre / /
ARG FLINK_VERSION=1.11.1
ARG FLINK_MAVEN_REPO=https://repo.maven.apache.org/maven2/org/apache/flink

# Download connector libraries
RUN wget -P /opt/flink/lib/ ${FLINK_MAVEN_REPO}/flink-json/${FLINK_VERSION}/flink-json-${FLINK_VERSION}.jar; \
    wget -P /opt/flink/lib/ ${FLINK_MAVEN_REPO}/flink-sql-connector-kafka_2.11/${FLINK_VERSION}/flink-sql-connector-kafka_2.11-${FLINK_VERSION}.jar; \
    wget -P /opt/flink/lib/ ${FLINK_MAVEN_REPO}/flink-sql-connector-elasticsearch7_2.11/${FLINK_VERSION}/flink-sql-connector-elasticsearch7_2.11-${FLINK_VERSION}.jar;

RUN echo "taskmanager.memory.jvm-metaspace.size: 512m" >> /opt/flink/conf/flink-conf.yaml;

#Create Virtual Environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

WORKDIR /opt/flink
COPY test.py .
CMD ["python", "test.py"]

