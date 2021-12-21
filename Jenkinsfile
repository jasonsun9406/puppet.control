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
                'staging',
                'production'
            ],
            description: ''
        )
    }
    stages {
        stage("Checkout SCM"){
            steps{
                checkout scm
            }

        }
        stage('Applying r10k'){

            steps{
                script{
                    sh 'sudo r10k deploy environment production --puppetfile -c /etc/puppetlabs/puppet/r10k.yaml --verbose'
                }
            }

        }
    }

}