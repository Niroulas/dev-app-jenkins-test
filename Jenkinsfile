pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = "kodalo"
        IMAGE_NAME = "jenkins-python-app"
        IMAGE_TAG = "latest"
        FULL_IMAGE = "${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
        DOCKERHUB_CREDENTIALS = "dockerhub-creds"
    } 

    stages {

        stage('Sushant Building Docker Image') {
            steps {
                sh 'docker build -t $FULL_IMAGE .'
            }
        } 

        stage('Sushant Logging to Dockerhub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKERHUB_CREDENTIALS}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Sushant - Push image to Dockerhub') {
            steps {
                sh 'docker push $FULL_IMAGE'
            }
        }
    }
} 

