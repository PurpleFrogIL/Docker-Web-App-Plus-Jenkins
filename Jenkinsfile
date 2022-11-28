pipeline {
    agent none
    options {
        // Prevent git checkout occuring on every stage
        skipDefaultCheckout true
        // Global timeout to prevent job continueing forever in case of problem
        // Amount of time of no activity in logs after which the job is aborted
        timeout(activity: true, time: 10, unit: 'SECONDS')
    }
    environment {
        DOCKER_IMAGE_NAME = 'todos-app'
        APP_VERSION = "${env.BUILD_ID}"
        DOCKERHUB = credentials('DockerHub-Read-Write')
        APP_IMAGE_TAG = "${DOCKERHUB_USR}/${DOCKER_IMAGE_NAME}:${APP_VERSION}"
    }
    stages {
        stage('Build: Checkout') {
            agent { label 'build && x86-64' }
            steps {
                checkout scm
                // Save needed files for later stages
                stash includes: 'docker-compose.yml', name: 'docker-compose-file'
                stash includes: 'test/*', name: 'test-dir'
            }
        }
        stage('Build: Build') {
            agent { label 'build && x86-64' }
            steps {
                echo "Building Docker image: ${APP_IMAGE_TAG}"
                script {
                    app_image = docker.build(
                        APP_IMAGE_TAG,
                        "--build-arg VERSION=${APP_VERSION} ./app"  // Arguments for 'docker build'
                    )
                }
            }
        }
        stage('Build: Push') {
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
        stage('Test: Pull') {
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
        stage('Test: Run App') {
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

                echo 'Copy docker compose file'
                unstash 'docker-compose-file'

                echo "APP_VERSION=${APP_VERSION}"
                echo 'Running Docker Compose'
                sh 'docker-compose up -d'
            }
        }
        stage('Test: Run Test') {
            agent { label 'test && x86-64' }
            steps {
                unstash 'test-dir'
                echo "Testing using Docker Compose (with image ${APP_IMAGE_TAG})"
                sh 'bash ./test/test.sh'
                // sh 'bash ./test/bad_test.sh'
            }
            post {
                always {
                    echo 'Stop containers'
                    sh 'docker-compose down'
                    // deleteDir() /* clean up our workspace */
                }
            }
        }
        stage('Deploy: Pull') {
            agent { label 'deploy && x86-64' }
            steps {
                echo 'Stopping running containers...'
                // Stop only if containers are running
                sh 'if [[ $(docker ps --quiet) != "" ]]; then docker-compose down; fi'
                echo "Pulling Docker image: ${APP_IMAGE_TAG}"
                script {
                    docker.withRegistry('', 'DockerHub-Read') {
                        app_image.pull()
                    }
                }
            }
        }
        stage('Deploy: Run App') {
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

                echo 'Copy docker compose file'
                unstash 'docker-compose-file'

                echo 'Running Docker Compose'
                sh 'docker-compose up -d'
            }
        }
    }
}
