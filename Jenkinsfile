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
                    app_image_tag = "${DOCKERHUB_USR}/${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
                    echo "Building Docker image: ${app_image_tag}"
                    app_image = docker.build(app_image_tag, './composer')
                    docker.withRegistry('', 'DockerHub-Read-Write') {
                        app_image.push()
                        app_image.push('latest')
                    }
                }
            }
        }
    }
}
