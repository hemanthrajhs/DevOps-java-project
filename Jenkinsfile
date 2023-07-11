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

        stage('Static Code Analysis: sonarqube') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('Qulaity gate analysis: sonarqube') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api' 
                }
            }
        }
        stage('MavenBuild: Maven') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                mvnBuild() 
                }
            }
        }
    }
}
