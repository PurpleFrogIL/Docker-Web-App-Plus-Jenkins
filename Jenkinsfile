pipeline {
    agent none
    environment {
        DOCKERHUB = credentials('DockerHub-Read-Write')
        DOCKER_IMAGE_NAME = 'todos-app'
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
                    echo "DockerHub User: ${DOCKERHUB_USR}"
                    app_image = docker.build('', './composer')
                    app_image.tag("${DOCKERHUB_USR}/${DOCKER_IMAGE_NAME}:${env.BUILD_ID}")
                    docker.withRegistry('', 'DockerHub-Read-Write') {
                        app_image.push()
                        app_image.push('latest')
                    }
                }
            }
        }
    }
}
