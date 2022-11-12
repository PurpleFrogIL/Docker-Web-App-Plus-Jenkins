pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                sh """
                echo "ssh to build server: hostnamectl"
                """
                sh """
                ssh ec2-user@172.31.87.158 hostnamectl"
                """
            }
        }
    }
}
