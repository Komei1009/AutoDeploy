ECS_ID := 429564250042
AWS_REGION     := ap-northeast-1
APP := auto-deploy
export AWS_REGION
export AWS_DEFAULT_REGION=$(AWS_REGION)
DOCKER_IMAGE    := $(ECS_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(APP):latest

login:
	aws configure set region $(AWS_REGION)
	aws configure set aws_access_key_id $$AWS_ACCESS_KEY_ID
	aws configure set aws_secret_access_key $$AWS_SECRET_ACCESS_KEY
	$$(aws ecr get-login --no-include-email --registry-ids $(ECS_ID) --region $(AWS_REGION))

foo:
	echo hoge

go/build:
	env GOOS=linux env GOARCH=amd64 env CGO_ENABLED=0 go build -o ./cmd/main main.go

docker/build:
	docker build -t $(DOCKER_IMAGE) .
