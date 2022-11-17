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
                    sh 'Creating .env file'
                    writeFile file: '.env', text: 'MYSQL_PASSWORD="abc123"'
                    sh 'docker-compose up -d --build'
                    sh 'docker-compose down --volume'
                }
            }
        }
    }
}
