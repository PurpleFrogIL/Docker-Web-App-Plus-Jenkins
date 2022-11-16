pipeline {
    agent none
    stages {
        stage('Checkout') {
            agent { label 'build && x86-64' }
            steps {
                checkout(
                    [$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub-ec2-user', url: 'git@github.com:PurpleFrogIL/Docker-Web-App-Plus-Jenkins.git']]])
            }
        }
        stage('Build') {
            agent { label 'build && x86-64' }
            steps {
                dir('composer') {
                    sh 'docker-compose build'
                }
            }
        }
    }
}
