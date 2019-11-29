gateway:
	kubectl apply -f gateway/gateway.yml

game-jam:
	kubectl apply -f game-jam-abstraction/game-jam-service.yml

logs:
	kubectl apply -f logging/logs.yml