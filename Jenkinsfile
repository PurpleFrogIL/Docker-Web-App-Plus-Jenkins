pipeline {
    agent none
    environment {
        DOCKER_IMAGE_NAME = 'todos-app'
        APP_VERSION = "${env.BUILD_ID}"
        DOCKERHUB = credentials('DockerHub-Read-Write')
        APP_IMAGE_TAG = "${DOCKERHUB_USR}/${DOCKER_IMAGE_NAME}:${APP_VERSION}"
    }
    stages {
        stage('Checkout') {
            agent { label 'build && x86-64' }
            steps {
                checkout scm
            }
        }
        stage('Build') {
            agent { label 'build && x86-64' }
            steps {
                echo "Building Docker image: ${APP_IMAGE_TAG}"
                script {
                    app_image = docker.build(APP_IMAGE_TAG, './app')
                }
            }
        }
        stage('Push') {
            agent { label 'build && x86-64' }
            steps {
                echo "Pushing Docker image: ${APP_IMAGE_TAG}"
                script {
                    docker.withRegistry('', 'DockerHub-Read-Write') {
                        app_image.push()
                        app_image.push('latest')
                    }
                }
            }
        }
        stage('Pull (Test)') {
            agent { label 'test && x86-64' }
            steps {
                echo "Pulling Docker image: ${APP_IMAGE_TAG}"
                script {
                    docker.withRegistry('', 'DockerHub-Read') {
                        app_image.pull()
                    }
                }
            }
        }
        stage('Run (Test)') {
            agent { label 'test && x86-64' }
            steps {
                echo 'Copying .env file'
                withCredentials([file(credentialsId: 'DWAPJ-env', variable: 'ENV_FILE_PATH')]) {
                    script {
                        if (fileExists('./.env')) {
                            echo '.env  file already exists. Skipping copy command.'
                        }
                        else {
                            sh 'cp $ENV_FILE_PATH .'
                        }
                    }
                }

                echo 'Running Docker Compose'
                sh 'docker-compose up -d'
            }
        }
        stage('Test') {
            agent { label 'test && x86-64' }
            steps {
                echo "Testing using Docker Compose (with image ${APP_IMAGE_TAG})"
                sh 'bash ./test/test.sh'
                // sh 'bash ./test/bad_test.sh'
            }
            post {
                always {
                    sh 'docker-compose down'
                    // deleteDir() /* clean up our workspace */
                }
            }
        }
        stage('Pull (Deploy)') {
            agent { label 'deploy && x86-64' }
            steps {
                echo 'Stopping running containers...'
                // Stop only if containers are running
                sh '[[ $(docker ps --quiet) != "" ]] && docker-compose down'
                echo "Pulling Docker image: ${APP_IMAGE_TAG}"
                script {
                    docker.withRegistry('', 'DockerHub-Read') {
                        app_image.pull()
                    }
                }
            }
        }
        stage('Run (Deploy)') {
            agent { label 'deploy && x86-64' }
            steps {
                echo 'Copying .env file'
                withCredentials([file(credentialsId: 'DWAPJ-env', variable: 'ENV_FILE_PATH')]) {
                    script {
                        if (fileExists('./.env')) {
                            echo '.env  file already exists. Skipping copy command.'
                        }
                        else {
                            sh 'cp $ENV_FILE_PATH .'
                        }
                    }
                }

                echo 'Running Docker Compose'
                sh 'docker-compose up -d'
            }
        }
    }
}
