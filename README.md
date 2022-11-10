# Docker Web App (Assignment 5)
## Created by Dror Felman

### Instructions:
Instructions for each part of the project appear below.

- First, you need to clone the repository: Click the "clone" button above and click "copy", then open a terminal in a directory of your choice and run `git clone <the link you copied>`.
---
#### Hello Web (ex1)
##### Prerequisites:
- Python 3 installed
- Flask python-package installed (can be in a virtual environment)
##### Usage:
1. `cd` to directory "hello-web" in the cloned repository.
1. In a terminal run `python3 app.py` or  `python app.py`
1. Open a web browser (or use `curl`).
1. For the URL use [localhost](http://localhost) or http://172.17.0.2 or http://172.17.0.2:80 (or as otherwise mentioned in the terminal output).
1. You should see a webpage with the writing "Hello, World!".
1. Press Ctrl+C to stop the script.
---
#### Hello Docker (ex2)
##### Prerequisites:
- A Linux machine
- Docker installed
##### Usage:
1. `cd` to directory "hello-docker" in the cloned repository.
1. `$ docker build -t hello-docker:1.0 .`
1. `$ docker run -p 80:80 -it hello-docker:1.0`
1. Open a web browser (or use `curl`).
1. For the URL use [localhost](http://localhost) or http://172.17.0.2 or http://172.17.0.2:80 (or as otherwise mentioned in the terminal output).
1. You should see a webpage with the writing "Hello, World!".
1. Press Ctrl+C to stop the docker container.
1. Go to the `docker run` step when you want to re-run the container (no need to do `build` again).
---
#### Composer (ex3)
##### Prerequisites:
- A Linux machine
- Docker installed (including the `docker-compose` command)
##### Usage:
1. `cd` to directory "composer" in the cloned repository.
1. Create a file named ".env" with the following text: MYSQL_PASSWORD="YOUR_PASSWORD", where "YOUR_PASSWORD" is a password of your choice for the MySQL server. For example: MYSQL_PASSWORD="abc123".
1. `$ docker-compose up -d`
1. Open a web browser.
1. For the URL use [localhost:3000](http://localhost:3000).
1. You should see a webpage titled "Todo App" with an app for todo list.
1. You can add items to the list as you please.
1. run `$ docker-compose down` to stop all parts of the app.
1. Go to the `docker-compose up -d` step when you want to re-run the app. Your previously added items should appear on the list.

###### Changing the password:
1. `docker-compose down --volumes`
1. Change password in the ".env" file
1. Now you can run the app again using `docker-compose up -d`
---
