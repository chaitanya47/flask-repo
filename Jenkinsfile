pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'flask-app:ci'
        CONTAINER_NAME = 'flask-test'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone your GitHub repo using Jenkins credential
                git credentialsId: 'github-pat', url: 'https://github.com/chaitanya47/flask-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image from the cloned repo
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Stop Old Container') {
            steps {
                // Stop and remove old container if it exists to avoid conflicts
                sh """
                    if [ \$(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
                        docker rm -f ${CONTAINER_NAME}
                    fi
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the new container on port 5000
                sh "docker run -d -p 5000:5000 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}"
            }
        }
    }
}
