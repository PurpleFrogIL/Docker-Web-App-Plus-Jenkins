pipeline {
    agent none
    environment {
        DOCKERHUB = credentials('DockerHub-Read-Write')
        DOCKER_IMAGE_NAME = 'todos-app'
        APP_IMAGE_TAG = "${DOCKERHUB_USR}/${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
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
                script {
                    echo "Building Docker image: ${APP_IMAGE_TAG}"
                    app_image = docker.build(APP_IMAGE_TAG, './composer')
                }
            }
        }
        stage('Push') {
            agent { label 'build && x86-64' }
            steps {
                script {
                    echo "Pushing Docker image: ${APP_IMAGE_TAG}"
                    docker.withRegistry('', 'DockerHub-Read-Write') {
                        app_image.push()
                        app_image.push('latest')
                    }
                }
            }
        }
        stage('Test') {
            agent { label 'test && x86-64' }
            steps {
                script {
                    echo "Pulling Docker image: ${APP_IMAGE_TAG}"
                    docker.withRegistry('', 'DockerHub-Read') {
                        app_image.pull()
                    }
                }
            }
        }
    }
}
