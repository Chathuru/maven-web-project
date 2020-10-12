pipeline {
    agent {
        label 'master'
    }
    
    stages {
        stage('Git clone') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'tags/v5.10.0']],
                    userRemoteConfigs: [[url: 'https://github.com/wso2/product-is.git']]
                ])
            }
        }
        stage('Maven build') {
            steps {
                tool 'apache-maven-3.5.0'
                sh "mvn clean install -Dmaven.test.skip=true -f pom.xml"
            }
        }
        stage('Publish to nexus') {
            steps {
                nexusPublisher nexusInstanceId: '001', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '/home/centos/.jenkins/workspace/WSO2IS-Pipeline/modules/distribution/target/wso2is-5.10.0.zip']], mavenCoordinate: [artifactId: 'wso2is', groupId: 'com.wso2', packaging: 'zip', version: '5.10.0']]]
            }
        }
        stage('Building Docker Image - Clone') {
            agent {
                label 'docker'
            }
            steps {
                git 'https://github.com/Chathuru/wso2-openshift-is.git'
            }
        }
        stage('Building Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh "docker build ./dockerfile -t chathuru/wso2is"
            }
        }
        stage('Push Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh "docker image push chathuru/wso2is"
            }
        }
        stage('Run Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh "docker run -d -p 9443:9443 chathuru/wso2is"
            }
        }
    }
}





pipeline {
    agent {
        label 'master'
    }

    stages {
        stage('Git Clone') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/Chathuru/maven-web-project.git']]
                ])
            }
        }
        stage('Maven Build') {
            steps {
                tool 'apache-maven-3.5.0'
                sh "mvn package -f pom.xml"
            }
        }
        stage('Publish to nexus') {
            steps {
                nexusPublisher nexusInstanceId: '001', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '/home/centos/.jenkins/workspace/Maven_Webapp/target/maven-webapp.war']], mavenCoordinate: [artifactId: 'maven-webapp', groupId: 'local.wso2.webapp', packaging: 'war', version: '1.0']]]
            }
        }
        stage('Building Docker Image - Clone') {
            agent {
                label 'docker'
            }
            steps {
                git 'https://github.com/Chathuru/maven-web-project.git'
            }
        }
        stage('Building Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh "docker build ./dockerfile -t chathuru/maven-webapp"
            }
        }
        stage('Push Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh "docker image push chathuru/maven-webapp"
            }
        }
        stage('Run Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh "docker run -d -p 8000:8080 chathuru/maven-webapp"
            }
        }
    }
}
