build:
	docker build -t hersonpc/python-oracle:latest .

bash:
	docker run -it --rm --name python-oracle hersonpc/python-oracle:latest bash