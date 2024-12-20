

.PHONY: build 
build: 
	docker build --build-arg BASE=python:3.12-slim -t dmtcp:python3.12-slim . 
	docker build --build-arg BASE=python:3.12 -t dmtcp:python3.12-slim . 

.PHONY: run 
run: 
	docker run -it dmtcp:python3.12-slim 