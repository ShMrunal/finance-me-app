pipeline{
    agent any
    stages{
        stage('Checkout git') {
            steps {
              git 'https://github.com/ShMrunal/finance-me-app.git'
            }
        }
        
        stage ('Build & JUnit Test') {
            steps {
                sh 'mvn clean package' 
            }
        }
        
        stage("Build Docker Image") {
            steps {
                echo "Building the image"
                catchError(buildResult: 'UNSTABLE') {
                    sh "docker build -t ${env.dockerHubUser}/finance-me-app:latest ."
                }
            }
        }
        
        stage("Push To Docker Hub") {
            steps {
                echo "pushing to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                   sh "docker tag finance-me-app ${env.dockerHubUser}/finance-me-app:latest"
                   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                   sh "docker push ${env.dockerHubUser}/finance-me-app:latest"
                }
            }
        }
    }
}