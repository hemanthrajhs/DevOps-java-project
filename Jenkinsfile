@Library('my-shared-libraries') _

pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: ['create', 'delete'], description: 'Choose create or destroy')
    }

    stages {
        stage('Git Checkout') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    gitCheckout(
                        branch: 'main',
                        url: 'https://github.com/hemanthrajhs/DevOps-java-project.git'
                    )
                }
            }
        }

        stage('Unit Test Maven') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    mvnTest()
                }
            }
        }

        stage('Integration Test') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    mvnIntegration()
                }
            }
        }

        stage('Static Code Analysis') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                      def SonarQubecredentialsId = 'sonar-api'
                      staticCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }
    }
}
