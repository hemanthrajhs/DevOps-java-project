@library('my-shared-libraries')
pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                script {
                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/hemanthrajhs/DevOps-java-project.git"
                    )
                }
            }
        }
        
    }
}
