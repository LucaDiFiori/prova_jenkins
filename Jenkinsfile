pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                    echo 'Building..'
                    make
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    echo 'Testing..'
                    ./megaphone "Hello, World!"
                '''
            }
        }
    }
    post {
        always {
            sh 'make fclean'
        }
    }
}
