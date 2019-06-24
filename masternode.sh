#!/bin/bash

check_file() {
  if [ ! -f "$1" ]; then
    echo "File $1 not found"
    return 1
  fi
  return 0
}

check_dir() {
  if [ ! -d "$1" ]; then
    echo "Directory $1 not found"
    return 1
  fi
}

case "$1" in
up)
  check_file "./docker-compose.yml" &&
  check_file "./nginx/nginx.conf" &&
  check_dir "./ipfs/staging" || exit 1
  echo "Starting masternode containers"
  docker-compose up -d
  ;;

stop)
  check_file "./docker-compose.yml" || exit $?
  echo "Stopping masternode containers"
  docker-compose stop
  ;;

restart)
  sh $0 stop
  sh $0 up
  ;;

logs)
  docker-compose logs
  ;;

upgrade)
  sh $0 stop
  echo "Pulling container images"
  docker pull nginx
  docker pull swarmmasternodes/go-ipfs
  sh $0 up
  ;;

down)
  check_file "./docker-compose.yml" || exit $?
  echo "Stopping and removing masternode containers"
  docker-compose down
  ;;

*)
  echo  "Usage: masternode.sh {up|stop|restart|logs|upgrade|down}"
  ;;
esac
