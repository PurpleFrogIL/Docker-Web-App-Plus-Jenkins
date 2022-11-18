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
                    // echo 'Creating .env file'
                    // writeFile file: '.env', text: 'MYSQL_PASSWORD="abc123"'
                    sh 'docker build -t todos .'
                }
            }
        }
    }
}
