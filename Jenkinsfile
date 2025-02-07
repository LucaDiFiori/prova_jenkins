pipeline {
    agent { dockerfile true }
    stages {
        stage ('Build') {
            steps {
                echo 'Start Building..'
                sh '''
                    make
                '''
            }
        }

        stage ('Test') {
            steps {
                echo 'Start Testing..'
                sh '''
                    ./megaphone "Hello, World!"
               '''
            }
        }

    }

    post {
        always {
            echo 'Cleaning up..'
            sh '''
                make clean
            '''
        }
    }
}