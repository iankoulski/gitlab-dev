#!/bin/bash



. .env



echo ""

echo "Starting Server ..."


#sudo docker run --detach \
#  --hostname gitlab.example.com \
#  --publish 443:443 --publish 80:80 --publish 22:22 \
#  --name gitlab \
#  --restart always \
#  --volume /srv/gitlab/config:/etc/gitlab:Z \
#  --volume /srv/gitlab/logs:/var/log/gitlab:Z \
#  --volume /srv/gitlab/data:/var/opt/gitlab:Z \
#  gitlab/gitlab-ce:latest

#  --hostname ${GITLAB_HOSTNAME} \
#  --restart always \
#  --volume ${GITLAB_PATH_DATA}:/var/opt/gitlab:Z \

docker run --detach \
  --hostname 192.168.1.15 \
  --publish ${GITLAB_HTTPS_PORT}:443 --publish ${GITLAB_HTTP_PORT}:80 --publish ${GITLAB_SSH_PORT}:22 \
  --name ${GITLAB_CONTAINER_NAME} \
  --volume ${GITLAB_PATH_CONFIG}:/etc/gitlab:Z \
  --volume ${GITLAB_PATH_LOGS}:/var/log/gitlab:Z \
  --volume gitlab-data:/var/opt/gitlab:Z \
  --env GITLAB_OMNIBUS_CONFIG="${GITLAB_OMNIBUS_CONFIG}" \
  ${GITLAB_IMAGE}

#sudo docker run --detach \
#    --hostname ${GITLAB_HOSTNAME} \
#    --env GITLAB_OMNIBUS_CONFIG="external_url 'https://${GITLAB_HOSTNAME}';gitlab_rails['gitlab_shell_ssh_port'] = ${SSH_PORT};" \
#    --publish 443:443 --publish ${HTTP_PORT}:80 --publish ${SSH_PORT}:22 \
#    --name gitlab \
#    --restart always \
#    --volume ${CONFIG_PATH}:/etc/gitlab \
#    --volume ${LOGS_PATH}:/var/log/gitlab \
#    --volume ${DATA_PATH}:/var/opt/gitlab \
#    --volume ${SSL_KEY_PATH}:${SSL_KEY_PATH} \
#    --volume ${SSL_CERT_PATH}:${SSL_CERT_PATH} \
#    gitlab/gitlab-ce:latest


#sudo mkdir -p ${CONFIG_PATH}/ssl

#sudo cp ${HOME}/gitlab.rb ${CONFIG_PATH}

#sudo ln -sf ${SSL_KEY_PATH} ${CONFIG_PATH}/ssl/${GITLAB_HOSTNAME}.key

#sudo ln -sf ${SSL_CERT_PATH} ${CONFIG_PATH}/ssl/${GITLAB_HOSTNAME}.crt

docker ps | grep gitlab


