# Assignment-5-Docker-Web-App
## Created by Dror Felman

### Prerequisits:
- A Linux machine
- Docker installed
### Usage:
- Hello Docker
	1. Clone repo to your linux machine.
	2. cd to directory of cloned repo.
	3. `$ docker build -t hello-docker:1.0 .`
	4. `$ docker run -p 80:80 --rm -it --name hello-docker hello-docker:1.0`
	5. Open a web browser (or use `curl`).
	6. For the URL use *localhost* or *http://172.17.0.2/* or *http://172.17.0.2:80* (or as otherwise mentioned in the terminal output).
	7. You should see a webpage with the writing "Hello, World!".
	8. Press Ctrl+C to stop the docker container.
	9. Go to step 4 when you want to re-run the container (no need to do `build` again).
