// pipeline {
//     environment {
//         DOCKER_HOST = 'unix:///var/run/docker.sock'
//     }

//     agent { dockerfile true }

//     stages {
//         stage ('Build') {
//             steps {
//                 echo 'Start Building..'
//                 sh '''
//                     make
//                 '''
//             }
//         }

//         stage ('Test') {
//             steps {
//                 echo 'Start Testing..'
//                 sh '''
//                     ./megaphone "Hello, World!"
//                 '''
//             }
//         }
//     }

//     post {
//         always {
//             echo 'Cleaning up..'
//             sh '''
//                 make clean
//             '''
//         }
//     }
// }
pipeline {
    agent any  // Cambia da 'dockerfile true' a 'any'
    environment {
        DOCKER_HOST = 'unix:///var/run/docker.sock'
    }
    stages {
        stage('Build Docker Agent') {
            steps {
                script {
                    docker.build('custom-agent', '-f Dockerfile .')
                }
            }
        }
        stage ('Build') {
            agent {
                docker {
                    image 'custom-agent'
                    reuseNode true
                }
            }
            steps {
                sh 'make'
            }
        }
        stage ('Test') {
            steps {
                sh './megaphone "Hello, World!"'
            }
        }
    }
    post {
        always {
            echo 'Cleaning up..'
            sh 'make clean'
        }
    }
}
