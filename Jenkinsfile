pipeline {
	agent any


	triggers {
        pollSCM '* * * * *'
    }


	stages {
		stage("test") {
			options { timeout(time: 30, unit: 'MINUTES') }
			steps {
				sh 'mvn test'
			}
		}
		stage("package"){
			steps{
			    sh 'mvn clean install'
			}
			 
		}
		stage("deploy"){
		     steps{  
                            sh 'deploy.sh'
                        }   
		}

	}

	post {
		changed {
			script {
				emailext(
						subject: "[${currentBuild.fullDisplayName}] ${currentBuild.currentResult}",
						mimeType: 'text/html',
						recipientProviders: [[$class: 'CulpritsRecipientProvider'], [$class: 'RequesterRecipientProvider']],
						body: "<a href=\"${env.BUILD_URL}\">${currentBuild.fullDisplayName} is reported as ${currentBuild.currentResult}</a>")
			}
		}
	}
}
