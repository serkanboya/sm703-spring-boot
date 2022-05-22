pipeline {
	agent any

	triggers {
        pollSCM '* * * * *'
    }


	stages {
		stage("test") {
			options { timeout(time: 30, unit: 'MINUTES') }
			steps {
				sh 'scripts/test.sh'
			}
		}
		stage("package"){
			steps{
			    sh 'scripts/build.sh'
			}
			 
		}
		stage("deploy"){
		     steps{  
                            sh 'scripts/deploy.sh'
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
