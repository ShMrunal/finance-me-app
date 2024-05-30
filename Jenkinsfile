pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    userRemoteConfigs: [[url: 'https://github.com/ShMrunal/medicure-app-selenium-test.git']]
                ])
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package assembly:single'
            }
        }
        
        stage('run test script'){
            steps {
            sh 'java -jar /var/lib/jenkins/workspace/medicure-app-selenium-test/target/medicure-application-0.0.1-SNAPSHOT-jar-with-dependencies.jar'
            }
                
        }
    }
}
