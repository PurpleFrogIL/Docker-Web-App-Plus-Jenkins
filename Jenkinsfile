pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                sh """
                echo "ssh to build server: hostnamectl"
                """
            }
        }
    }
}
