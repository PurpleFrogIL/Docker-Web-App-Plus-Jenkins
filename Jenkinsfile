pipeline {
    agent none
    environment {
        APP_VERSION = "${env.BUILD_ID}"
        DOCKERHUB = credentials('DockerHub-Read-Write')
        DOCKER_IMAGE_NAME = 'todos-app'
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
                    app_image = docker.build(APP_IMAGE_TAG, './composer')
                }
            }
        }
        stage('Build-Push') {
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
        stage('Test-Pull') {
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
        stage('Test-Up') {
            agent { label 'test && x86-64' }
            steps {
                echo 'Copying .env file'
                withCredentials([file(credentialsId: 'DWAPJ-env', variable: 'ENV_FILE_PATH')]) {
                    script {
                        if (fileExists('./composer/.env')) {
                            echo '.env  file already exists'
                        }
                        else {
                            sh 'cp $ENV_FILE_PATH ./composer'
                        }
                    }
                }

                echo 'Running Docker Compose'
                dir('./composer') {
                    sh 'docker-compose up -d'
                }
            }
        }
        stage('Test') {
            agent { label 'test && x86-64' }
            steps {
                echo "Testing using Docker Compose (with image ${APP_IMAGE_TAG})"
            }
        }
    }
}
