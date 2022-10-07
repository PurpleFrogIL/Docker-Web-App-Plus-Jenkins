# Docker Web App (Assignment 5)
## Created by Dror Felman

### Prerequisits:
- A Linux machine
- Docker installed
### Usage:
- Hello Docker
	1. Clone the repository to your linux machine.
	1. `cd` to directory of cloned repository.
	1. `$ docker build -t hello-docker:1.0 .`
	1. `$ docker run -p 80:80 -it hello-docker:1.0`
	1. Open a web browser (or use `curl`).
	1. For the URL use [localhost](http://localhost) or http://172.17.0.2 or http://172.17.0.2:80 (or as otherwise mentioned in the terminal output).
	1. You should see a webpage with the writing "Hello, World!".
	1. Press Ctrl+C to stop the docker container.
	1. Go to step 4 when you want to re-run the container (no need to do `build` again).
