k8s-deploy:
	@test -n "$(CLUSTER_NAME)" || (echo "Error: CLUSTER_NAME must be set."; exit 1)
	@test -n "$(S3_BUCKET)" || (echo "Error: S3_BUCKET must be set."; exit 1)
	kubectl apply -f deploy/00-prereqs.yaml
	cat deploy/05-ark-backupstoragelocation.yaml | envsubst | kubectl apply -f -
	cat deploy/06-ark-volumestoragelocation.yaml | kubectl apply -f -
	cat deploy/10-deployment.yaml | envsubst | kubectl apply -f -
	cat deploy/schedule.yaml | kubectl apply -f -
