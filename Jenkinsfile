pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = "kodalo"
        IMAGE_NAME = "jenkins-python-app"
        IMAGE_TAG = "latest"
        FULL_IMAGE = "${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
        DOCKERHUB_CREDENTIALS = "dockerhub-creds"
        DOCKER_BIN = "/usr/local/bin/docker"
    }

    stages {

        stage('Sushant - Build Docker Image') {
            steps {
                sh '$DOCKER_BIN --version'
                sh '$DOCKER_BIN build -t $FULL_IMAGE .'
            }
        }

        stage('Sushant - Login to Dockerhub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKERHUB_CREDENTIALS}",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | $DOCKER_BIN login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Sushant - Push image to Dockerhub') {
            steps {
                sh '$DOCKER_BIN push $FULL_IMAGE'
            }
        }
    }
}


