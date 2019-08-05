docker build ./ -f Dockerfile -t copilot_inst
docker run --name copilot_server -it -p 8888:8888 -v $PWD/../:/my_shared/ -d copilot_inst
docker ps -a
docker exec -it copilot_server bash
docker stop copilot_server
docker rm copilot_server
