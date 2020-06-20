display_stage() {
	echo 
	echo ---------------------$1---------------------
	echo
}

cleanup() {
	docker kill app
	sleep 2
	docker rm app
	docker image rm kirylvolkau/sapi
}

cleanup
docker build -t kirylvolkau/sapi .
display_stage 'IMAGE WAS BUILT'
docker run -d --name app -p 5000:5000 kirylvolkau/sapi
display_stage 'WAIT 5S FOR SERVER TO START AND GET A RESPONSE'
sleep 5
curl http://localhost:5000/weatherforecast | json_pp
display_stage 'KILL APP AND & REMOVE IMAGE'
cleanup