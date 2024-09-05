pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        access_key     = credentials('access_key')
        secret_key     = credentials('secret_key')
    }

   agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        {
                            git "https://github.com/akshay-sudo/aws_sample.git"
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'pwd; terraform init'
                sh "pwd; terraform plan -out tfplan"
                sh 'pwd; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
            }
        }
    }

  }
