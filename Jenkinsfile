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
                script {
                    app_image = docker.build("purplefrog/todos-app:${env.BUILD_ID}", './composer')
                    app_image.push("${env.BUILD_ID}")
                }
            }
        }
    }
}
