pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "your-dockerhub-username/flask-app:latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/harsha5401/pycode18march.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
        stage('Cleanup') {
            steps {
                sh 'docker rmi ${DOCKER_IMAGE} || true'
                sh 'docker system prune -f'
                deleteDir()
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -d -p 5000:5000 ${DOCKER_IMAGE}"
            }
        }
    }
}
