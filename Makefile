all: 
	cd srcs && docker-compose up --build -d

up:
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

clean: 
	cd srcs && docker-compose down
	cd ~/data && sudo chmod 777 -R mariadb && sudo rm -rf mariadb/*
	cd ~/data && sudo chmod 777 -R wordpress && sudo rm -rf wordpress/*
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress
	docker rmi `docker images -q`
	@echo "🧹🧹🧹 cleaning done 🧹🧹🧹"

re: clean all

dead:
	docker system prune -a
	#docker stop $(docker ps -a -q)

PHONY: all up down clean re