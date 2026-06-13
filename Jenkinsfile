pipeline {
    agent any
    tools {
        maven 'maven'
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
                sh '''mvn sonar:sonar \
                      -Dsonar.host.url=http://13.204.46.134:9000 \
                      -Dsonar.login=squ_ca4476bdca25d31d272955b49857278ad24e0f5d'''
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
        stage('Update deployment file') {
            steps {
                echo 'Update deployment file'
                withCredentials([string(credentialsId: 'githubtoken', variable: 'GIT_TOKEN')]) {
                    sh """
                        git config user.email "vamshixxxxxlly@gmail.com"
                        git config user.name "vamshi"
                        sed -i "s/devops-portfolio:.*/devops-portfolio:${BUILD_NUMBER}/g" deploymentfiles/deployment.yaml
                        git add deploymentfiles/deployment.yaml
                        git commit -m "update deployment image to version ${BUILD_NUMBER}"
                        git push https://VAMSHIDHARREDDYn:${GIT_TOKEN}@github.com/VAMSHIDHARREDDYn/devops-portfolio.git HEAD:main
                    """
                }
            }
        }
    }
}
