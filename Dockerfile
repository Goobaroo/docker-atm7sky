# syntax=docker/dockerfile:1

FROM openjdk:17-buster

LABEL version="1.2.3"
LABEL homepage.group=Minecraft
LABEL homepage.name="Atm7 Sky 1.2.3"
LABEL homepage.icon="https://media.forgecdn.net/avatars/585/168/637951766687771704.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=ATM7ToTheSky:25565
RUN apt-get update && apt-get install -y curl unzip && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

CMD ["/launch.sh"]