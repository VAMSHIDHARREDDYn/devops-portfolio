pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vamshi82/devops-portfolio"
        DOCKER_TAG = "${BUILD_NUMBER}"
        SONAR_PROJECT = "devops-portfolio"
        GIT_REPO = "https://github.com/VAMSHIDHARREDDYn/devops-portfolio.git"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main', url: "${GIT_REPO}"
            }
        }

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=${SONAR_PROJECT}'
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }

        stage('Trivy Scan') {
            steps {
                sh "trivy image --exit-code 1 --severity HIGH,CRITICAL ${DOCKER_IMAGE}:${DOCKER_TAG} || true"
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS')]) {
                    sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}"
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Update Image Tag in GitHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'github-creds',
                    usernameVariable: 'GIT_USER',
                    passwordVariable: 'GIT_PASS')]) {
                    sh """
                        sed -i 's|image: ${DOCKER_IMAGE}:.*|image: ${DOCKER_IMAGE}:${DOCKER_TAG}|g' deploymentfiles/deployment.yaml
                        git config user.email "nvamshidharreddy7262@gmail.com"
                        git config user.name "VAMSHIDHARREDDYn"
                        git add deploymentfiles/deployment.yaml
                        git commit -m "Update image tag to ${DOCKER_TAG}"
                        git push https://${GIT_USER}:${GIT_PASS}@github.com/VAMSHIDHARREDDYn/devops-portfolio.git main
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed. ArgoCD will sync to EKS automatically."
        }
        failure {
            echo "Pipeline failed. Check the logs above."
        }
    }
}
