build:
	docker build -t cachet-monitor:build .

	docker container create --name extract cachet-monitor:build
	docker container cp extract:/go/src/github.com/macchiang/cachet-monitor/cachet-monitor ./cachet-monitor
	docker container rm -f extract



