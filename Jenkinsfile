pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app ./app'
            }
        }

        stage('Verify Docker Image') {
            steps {
                sh 'docker images'
            }
        }

    }
}