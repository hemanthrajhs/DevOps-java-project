@Library('my-shared-libraries') _

pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: ['create', 'delete'], description: 'Choose create or destroy')
        string(name: 'Imagename', description: 'name of the image', defaultValue: 'javaapp')
        string(name: 'Imagetag', description: 'name of the imagetag', defaultValue: 'v1')
        string(name: 'Dockerhubuser', description: 'name of the app', defaultValue: 'hemanthrajhs')
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

        stage('Static Code Analysis: SonarQube') {
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
        
        stage('Quality Gate Analysis: SonarQube') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    waitForQualityGate(abortPipeline: false, credentialsId: 'sonar-api')
                }
            }
        }
        
        stage('Maven Build: Maven') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Docker Build') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    dockerBuild("${params.Imagename}", "${params.Imagetag}", "${params.Dockerhubuser}")
                }
            }
        }
        
        stage('Docker scan') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    dockerscan("${params.Imagename}", "${params.Imagetag}", "${params.Dockerhubuser}")
                }
            }
        }
        stage('Docker push') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    dockerpush("${params.Imagename}", "${params.Imagetag}", "${params.Dockerhubuser}")
                }
            }
        }
        stage('Docker Image clean') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                script {
                    dockerImageClean("${params.Imagename}", "${params.Imagetag}", "${params.Dockerhubuser}")
                }
            }
        }
    }
}
