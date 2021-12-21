pipeline {
    agent {
        node {
            label 'master'
        }
    }

    options {
        skipDefaultCheckout()
        buildDiscarder(logRotator(numToKeepStr: '90', artifactNumToKeepStr: '90'))
        timeout(time: 24, unit: 'HOURS')
        ansiColor('xterm')
        timestamps()
    }

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: [
                'dev',
                'stg',
                'prod'
            ],
            description: ''
        )
    }
    stages {
        stage{
            checkout scm
        }
        stage('Applying r10k'){

            steps{
                script{
                    dir(path: "/etc/puppetlabs/puppet"){
                        sh 'ls'
                    }
                }
            }

        }
    }

}