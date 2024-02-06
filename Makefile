all: 
	cd srcs && docker-compose up --build -d

up:
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

clean: 
	cd srcs && docker-compose down
	#docker container prune
	#docker volume prune
	#docker image prune
	#docker rmi $(docker images -q)

re: clean all