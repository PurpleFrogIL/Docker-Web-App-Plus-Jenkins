pipeline {
    agent none
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
                dir('composer') {
                    script {
                        docker.build("todos:${env.BUILD_ID}")
                    }
                }
            }
        }
    }
}
