pipeline {
    agent none
    environment {
        DOCKERHUB = credentials('DockerHub-Read-Write')
        DOCKER_IMAGE_NAME = 'todos-app'
        APP_IMAGE_TAG = "${DOCKERHUB_USR}/${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
    }
    stages {
        // stage('Checkout') {
        //     agent { label 'build && x86-64' }
        //     steps {
        //         checkout scm
        //     }
        // }
        // stage('Build') {
        //     agent { label 'build && x86-64' }
        //     steps {
        //         echo "Building Docker image: ${APP_IMAGE_TAG}"
        //         script {
        //             app_image = docker.build(APP_IMAGE_TAG, './composer')
        //         }
        //     }
        // }
        // stage('Build-Push') {
        //     agent { label 'build && x86-64' }
        //     steps {
        //         echo "Pushing Docker image: ${APP_IMAGE_TAG}"
        //         script {
        //             docker.withRegistry('', 'DockerHub-Read-Write') {
        //                 app_image.push()
        //                 app_image.push('latest')
        //             }
        //         }
        //     }
        // }
        // stage('Test-Pull') {
        //     agent { label 'test && x86-64' }
        //     steps {
        //         echo "Pulling Docker image: ${APP_IMAGE_TAG}"
        //         script {
        //             docker.withRegistry('', 'DockerHub-Read') {
        //                 app_image.pull()
        //             }
        //         }
        //     }
        // }
        stage('Test-Up') {
            agent { label 'test && x86-64' }
            steps {
                echo 'Running Docker Compose'
                echo 'Copying .env file'
                withCredentials([file(credentialsId: 'DWAPJ-env', variable: 'ENV_FILE_PATH')]) {
                    sh "cp ${ENV_FILE_PATH} ./composer"
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
