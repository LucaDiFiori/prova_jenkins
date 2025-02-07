pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make'
            }
        }
        stage('Test') {
            steps {
                script {
                    def testCases = [
                        "Hello, World!",
                        "OpenAI",
                        "Jenkins Pipeline"
                    ]
                    
                    testCases.each { input ->
                        def output = sh(
                            script: "./megaphone \"${input}\"", 
                            returnStdout: true
                        ).trim()
                        
                        if (output != input.toUpperCase()) {
                            error "Test failed: Input '${input}', Expected '${input.toUpperCase()}', got '${output}'"
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            sh 'make clean'
        }
    }
}
