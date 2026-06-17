pipeline {
    agent any
    tools {
        maven 'maven'
    }
    environment {
        DOCKER_IMAGE = "vamshi82/devops-portfolio"
        DOCKER_TAG   = "${BUILD_NUMBER}"
        SONAR_URL    = "http://13.204.46.134:9000"
    }
    stages {

        stage('Git checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/VAMSHIDHARREDDYn/devops-portfolio.git'
            }
        }

        stage('Maven build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('SonarQube analysis') {
            steps {
                withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
                    sh """mvn sonar:sonar \
                          -Dsonar.host.url=${SONAR_URL} \
                          -Dsonar.login=${SONAR_TOKEN}"""
                }
            }
        }

        stage('Docker build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }

        stage('Trivy image scan') {
            steps {
                sh """trivy image \
                      --exit-code 1 \
                      --severity HIGH,CRITICAL \
                      --format json \
                      --output trivy-results.json \
                      ${DOCKER_IMAGE}:${DOCKER_TAG}"""
            }
        }

        stage('Docker push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                    sh "echo ${DOCKER_PASS} | docker login -u vamshi82 --password-stdin"
                }
                sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                sh "docker push ${DOCKER_IMAGE}:latest"
            }
        }

        stage('Update deployment manifest') {
            steps {
                withCredentials([string(credentialsId: 'githubtoken', variable: 'githubtoken')]) {
                    sh """
                        git config user.email "nvamshidharreddy7262@gmail.com"
                        git config user.name "VAMSHIDHARREDDYn"
                        sed -i "s/devops-portfolio:.*/devops-portfolio:${BUILD_NUMBER}/g" deploymentfiles/deployment.yaml
                        git add deploymentfiles/deployment.yaml
                        git commit -m "ci: update image tag to build ${BUILD_NUMBER}"
                        git push https://VAMSHIDHARREDDYn:${GIT_TOKEN}@github.com/VAMSHIDHARREDDYn/devops-portfolio.git HEAD:main
                    """
                }
            }
        }
    }

    post {
        always {
            sh "docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG} || true"
            sh "docker rmi ${DOCKER_IMAGE}:latest || true"
        }
        success {
            echo "Pipeline succeeded — build ${BUILD_NUMBER} live on EKS"
        }
        failure {
            echo "Pipeline failed — build ${BUILD_NUMBER} did not deploy"
        }
    }
}
