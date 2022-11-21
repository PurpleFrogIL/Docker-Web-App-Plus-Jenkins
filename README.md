# Todo App
## A Web App using Jenkins, Docker, Docker Compose
## Created by Dror Felman

### Instructions:
- First, you need to clone the repository: Click the "clone" button above and click "copy", then open a terminal in a directory of your choice and run `git clone <the link you copied>`.

#### Prerequisites:
- A Linux machine
- Docker installed (including the `docker-compose` command)
#### Usage:
1. `cd` to directory "composer" in the cloned repository.
1. Create a file named ".env" with the following text: MYSQL_PASSWORD="YOUR_PASSWORD", where "YOUR_PASSWORD" is a password of your choice for the MySQL server. For example: MYSQL_PASSWORD="abc123".
1. run `$ docker-compose up -d` and wait for it to finish (it might take a few minutes the first time).
1. Open a web browser.
1. For the URL use [localhost:3000](http://localhost:3000).
1. You should see a webpage titled "Todo App" with an app for todo list. If you get "The connection was reset" error (or some other error) refresh the page, it might take a minute for the app to load.
1. You can add items to the list as you please.
1. run `$ docker-compose down` to stop all parts of the app.
1. Go to the `docker-compose up -d` step when you want to re-run the app. Your previously added items should appear on the list.

##### Changing the password:
1. `docker-compose down --volumes`
1. Change password in the ".env" file
1. Now you can run the app again using `docker-compose up -d`
