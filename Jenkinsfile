pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID_1')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/SefaliSabnam/Terraform-3tier.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            when {
                branch 'main'
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Upload HTML to S3') {
            steps {
                sh '''
                aws s3 cp index.html s3://$(terraform output -raw website_url) --acl public-read
                '''
            }
        }
        stage('Notify Slack') {
            steps {
                slackSend channel: '#jenkins', message: "Deployment Completed: ${env.BUILD_URL}"
            }
        }
    }
}
