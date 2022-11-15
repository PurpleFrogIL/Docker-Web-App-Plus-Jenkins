pipeline {
    agent none
    stages {
        stage('Build') {
            agent { label 'build && x86-64' }
            steps {
                sh 'echo "testing on $HOSTNAME"'
                checkout(
                    [$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub-ec2-user', url: 'git@github.com:PurpleFrogIL/Docker-Web-App-Plus-Jenkins.git']]])
            }
        }
    }
}
