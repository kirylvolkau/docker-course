# --build flag is used for rebuilding project in case of changes.
printf '\n --------- BUILD THE COMPOSED SERVICES AND RUN DETACHED --------- \n \n'
docker-compose up --build -d
printf '\n --------- SLEEP 2S SO SERVER CAN START, SEND 5 REQUESTS --------- \n \n'
sleep 2
for s in {0..5}
do
	curl localhost:4001
	echo
done
printf '\n --------- PRINT DOCKER COMPOSE PS --------- \n \n'
docker-compose ps
printf '\n --------- TAKE DOWN COMPOSED DOCKER SERVICES --------- \n \n'
docker-compose down