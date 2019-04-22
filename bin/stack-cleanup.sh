#!/bin/bash
set -e

# run this as follows
# arguments should be what you want to left
# ./stack-cleanup.sh "$(< file.txt)"
# ./stack-cleanup.sh test-stack-1 test-stack-2

for stack in $@; do
  echo "$stack"
  docker stack rm $stack
  sleep 8
  ./volume-cleanup.sh $(docker volume ls --format "{{.Name}}" --filter "name=$stack")
done

docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc:/etc:ro \
  -e FORCE_IMAGE_REMOVAL=1 \
  -e FORCE_CONTAINER_REMOVAL=1 \
  spotify/docker-gc \
&& docker system prune
