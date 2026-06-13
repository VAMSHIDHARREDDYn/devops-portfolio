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
                      -Dsonar.host.url=http://3.80.128.201:9000/ \\
                      -Dsonar.login=squ_464b30c7f49ad6b99a5d0cd66bb6b88ccc5a7df3'''
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
