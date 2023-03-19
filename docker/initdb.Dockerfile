FROM openjdk:slim
COPY --from=python:3.11.0 / /
RUN pip3 install pymongo
WORKDIR /lila-db-seed