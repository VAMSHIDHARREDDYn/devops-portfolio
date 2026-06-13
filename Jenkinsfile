pipeline {
    agent any

    tools {
        maven 'maven3'
    }

    environment {
        DOCKER_IMAGE = "vamshi82/devops-portfolio"
        DOCKER_TAG = "${BUILD_NUMBER}"
        GIT_REPO = "https://github.com/VAMSHIDHARREDDYn/devops-portfolio.git"
    }

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', url: "${GIT_REPO}"
            }
        }

        stage('Compile stage maven') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('SONARQUBE ANALYSIS') {
            steps {
                echo "SONARQUBE ANALYSIS"
                sh '''mvn sonar:sonar \\
                      -Dsonar.host.url=http://13.232.130.209:9000 \\
                      -Dsonar.login=squ_35a6bb3a44f7a8e0f550960e84d6765b203f3899'''
            }
        }

        stage('docker build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }

        stage('image scan using trivy') {
            steps {
                sh "trivy image --format json --output results.json ${DOCKER_IMAGE}:${DOCKER_TAG}"
            }
        }

        stage('docker image push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                        sh "docker login -u vamshi82 -p ${dockerhub}"
                    }
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }
    }
}
