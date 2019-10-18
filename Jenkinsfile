pipeline{
    agent any
    stages{
      stage("checkout"){
        steps{
          git "https://github.com/ashish98-y/employee-fe"
        }
      }
      stage("build container"){
        steps{
          sh "docker build -t 98ashish/feapp:1.0 ."
        }
      }
      stage("push container"){
        steps{
            withCredentials([string(credentialsId: 'dockercred', variable: 'dockerpwd')]) {
                sh "docker login -u 98ashish -p ${dockerpwd}"
                sh "docker push 98ashish/feapp:1.0"
             }
          } 
      }
      stage("deploy"){
        steps{
            sh "ansible-playbook -i dev.inventory fe.yml"
        }
      }
    }
}
