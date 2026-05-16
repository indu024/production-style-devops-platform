pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app ./app'
            }
        }

        stage('Load Image To Kind') {
            steps {
                sh 'kind load docker-image devops-app --name devops-cluster'
            }
        }

        stage('Deploy To Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/'
            }
        }

    }
}