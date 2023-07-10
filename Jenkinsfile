@Library('my-shared-libraries') _

pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                script {
                    gitCheckout(
                        branch: 'main',
                        url: 'https://github.com/hemanthrajhs/DevOps-java-project.git'
                    )
                }
            }
        }
        stage('Unit test maven') {
            steps {
                script {
                    mvnTest()
                }
            }
        }
        stage('Integartion test') {
            steps {
                script {
                    mvnIntegration()
                }
            }
        }
    }
}
