
all:
	sudo docker-compose up --build -d

clean:
	sudo docker-compose down

fclean: clean
	sudo docker-compose down --rmi all

re: fclean all

.PHONY: all clean fclean re
