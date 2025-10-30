pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "harshitshankar1998/usermgmt-app:latest"
        TERRAFORM_DIR = "terraform"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/harshitshankar/user-managament-Terraform.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                echo '🧱 Building Spring Boot project...'
                bat 'mvn clean package -DskipTests -U'
            }
        }

        stage('Docker Login') {
            steps {
                echo '🔑 Docker login (Jenkins credential used)'
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    bat 'docker login -u %USER% -p %PASS%'
                }
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                echo '🐳 Building Docker image and pushing to Docker Hub...'
                bat 'docker build -t %DOCKER_IMAGE% .'
                bat 'docker push %DOCKER_IMAGE%'
            }
        }

        stage('Terraform Init & Plan') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    echo '🧩 Terraform init & plan'
                    // Make sure Terraform is installed on the Jenkins agent PATH
                    bat 'terraform init -input=false'
                    bat 'terraform plan -out=tfplan -input=false'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    echo '🚀 Terraform apply'
                    bat 'terraform apply -input=false -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            echo '📦 Pipeline completed.'
        }
        success {
            echo '✅ Infrastructure provisioned and application deployed.'
            echo 'Access application at: http://localhost:8081/app/users (or check terraform outputs)'
        }
        failure {
            echo '❌ Pipeline failed. Inspect console logs.'
        }
    }
}
