all: 
	cd srcs && docker-compose up --build -d

down:
	cd srcs && docker-compose down

clean: 
	cd srcs && docker-compose down
	cd ~/data && sudo chmod 777 -R mariadb && sudo rm -rf mariadb/*
	cd ~/data && sudo chmod 777 -R wordpress && sudo rm -rf wordpress/*
	#docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb
	#docker container prune
	#docker volume prune
	#docker image prune
	docker rmi `docker images -q`
	@echo "🧹🧹🧹 cleaning done 🧹🧹🧹"

re: clean all

dead:
	docker system prune -a
	#docker stop $(docker ps -a -q)

PHONEY: all up down clean re