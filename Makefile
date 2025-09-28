include .env
include .cmd.env

.PHONY: help test
help:
	@echo "usage: make <option>"
	@echo "options and effects:"
	@echo "    help                     : Show help"
	@echo "    test                     : Test ..."

test:
	@echo "test ..."

.PHONY: echo_init_network
echo_init_network:
	@echo ${DOCKER} network ls
	@echo ${DOCKER} network create --driver ${NETWORKS_DRIVER} --subnet=${BACKEND_SUBNET} --gateway=${BACKEND_SUBNET_GATEWAY} ${BACKEND_NETWORK_NAME}
	@echo ${DOCKER} network ls

echo_init_volume:
	@echo ${DOCKER} volume ls
	@echo ${DOCKER} volume create --name xx
	@echo ${DOCKER} volume ls

.PHONY: rm_all_containers prune_docker
rm_all_containers:
	@${DOCKER} ps -a -q | xargs ${DOCKER} rm -f

.PHONY: rm_single
rm_single:
	@rm -rf ${DATA_HOST_PATH}/single

.PHONY: enter_apache_doris_fe enter_apache_doris_be
enter_apache_doris_fe:
	@${DC_ENTER} ${APACHE_DORIS_FE_CONTAINER_NAME} bash
enter_apache_doris_be:
	@${DC_ENTER} ${APACHE_DORIS_BE_CONTAINER_NAME} bash

.PHONY: copy_apache_conf
copy_apache_conf:
	@docker run --rm httpd:2.4 cat /usr/local/apache2/conf/httpd.conf > my-httpd.conf
	@docker run --rm -v ./htdocs/:/usr/local/apache2/htdocs/ httpd:2.4
