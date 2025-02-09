build:
	docker build . -t debug-docker

run:
	docker run -it --rm debug-docker

build-and-run:
	make build && make run


bash:
	docker run -it --rm --entrypoint bash debug-docker