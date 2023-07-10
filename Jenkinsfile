@Library('my-shared-libraries') _

pipeline {
    agent any

    parameter{
        choice(name: 'action', choices: 'creare\ndelete', description: 'chose create or destroy')
    }

    stages {

        stage('git checkout') {

        when{
            expression { param.action == 'create' }
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
        
        stage('Unit test maven') {
        when{
            expression { param.action == 'create' }
            steps {
                script {
                    mvnTest()
                }
            }
        }
        stage('Integartion test') {
        when{
            expression { param.action == 'create' }
            steps {
                script {
                    mvnIntegration()
                }
            }
        }
        stage('static code analysis') {
        when{
            expression { param.action == 'create' }
            steps {
                script {
                    StaticCodeAnalysis()
                }
            }
        }
    }
}
