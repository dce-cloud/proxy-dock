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
	@echo ${DOCKER} network create --driver ${DOCKER_NETWORK_DRIVER} --subnet=${DOCKER_BACKEND_SUBNET} --gateway=${DOCKER_BACKEND_SUBNET_GATEWAY} ${DOCKER_BACKEND_NETWORK_NAME}
	@echo ${DOCKER} network ls

echo_init_volume:
	@echo ${DOCKER} volume ls
	@echo ${DOCKER} volume create --name xx
	@echo ${DOCKER} volume ls

.PHONY: enter_apache_doris_fe enter_apache_doris_be
enter_apache_doris_fe:
	@${DC_ENTER} ${APACHE_DORIS_FE_CONTAINER_NAME} bash
enter_apache_doris_be:
	@${DC_ENTER} ${APACHE_DORIS_BE_CONTAINER_NAME} bash

.PHONY: copy_apache_conf
copy_apache_conf:
	@docker run --rm httpd:2.4 cat /usr/local/apache2/conf/httpd.conf > my-httpd.conf
	@docker run --rm -v ./htdocs/:/usr/local/apache2/htdocs/ httpd:2.4
