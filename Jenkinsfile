pipeline {
    agent { label "project1" }
    
    triggers {
        pollSCM('* * * * *')
    }    

    stages {
        stage('clone_project_A') {
            steps {
                echo 'clone project A'
                git branch: 'main', url: 'https://github.com/mohithpk/new-war.git'
            }
        }
         stage('build_project_A') {
            steps {
               echo 'build_projectA'
               sh 'yum install -y maven'
               sh 'mvn -Dmaven.test.failure.ignore=true install'
            }
        }

        stage('Docker_build') {
            steps {
                echo 'Docker build_projectd'
                sh 'docker build -t project_mohith .' 
            }
        }
        stage('login to dockerhub') {
            steps {
                echo 'login to dockerhub'
                sh 'docker login -u mohithp -p Tvisha123@'
            }
        } 
        stage('Tag the Image') {
            steps {
                echo 'Tag the Image'
                sh 'docker tag  project_mohith mohithp/project_mohith'
            }
        } 
        stage('Deploy to docker hub') {
            steps {
                echo 'Deploy to docker hub'
                sh 'docker push mohithp/project_mohith'
            }
        }
        stage('Remove Docker conatiner') {
            steps {
                echo 'Remove Docker conatiner'
                sh 'docker stop project_mohith_container || true'
                sh 'docker rm project_mohith_container || true'
            }
        }        
        stage('Run docker image') {
            steps {
                echo 'Deploy to docker hub'
                sh 'docker run --name project_mohith_container -d -p 8181:8080 mohithp/project_mohith'
            }
        }
        stage('added one more stage') {
            steps {
                echo 'added one more stage'                
            }
        }        
    }
}
