pipeline {
    agent none
    environment {
        DOCKERHUB = credentials('DockerHub-Read-Write')
    }
    stages {
        stage('Checkout') {
            agent { label 'build && x86-64' }
            steps {
                // checkout scm
            }
        }
        stage('Build') {
            agent { label 'build && x86-64' }
            steps {
                script {
                    echo "DockerHub User: ${DOCKERHUB_USR}"
                    // app_image = docker.build("purplefrog/todos-app:${env.BUILD_ID}", './composer')
                    // docker.withRegistry('', 'DockerHub-Read-Write') {
                    //     // app_image.push("${env.BUILD_ID}")
                    //     app_image.push()
                    //     app_image.push('latest')
                    // }
                }
            }
        }
    }
}
