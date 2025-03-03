
default:
	build_network
	build
	run

build_network:
	docker network create postgres_network

build:
	docker-compose build

run:
	docker-compose up -d
