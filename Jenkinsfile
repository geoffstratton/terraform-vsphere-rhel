@Library('jenkins_library')_

pipeline {
  environment {
    PROJECT_NAME = sh(returnStdout: true, script: "echo $JOB_NAME | awk -F/ '{print \$1}'").trim()
    DEBUG = "true"
    YR = sh(returnStdout: true, script: "date +%y").trim()
    VERSION_ID = sh(returnStdout: true, script: "git rev-list HEAD --count").trim()
    SECRET_USER_PASS = credentials('[provisioner]')
    SECRET_VM_PASS = credentials('[vcenter_username]')
    VCENTER_SERVER = "my-vmware-cluster.com"  }

  agent {
    node {
      label 'jenkins-agents'
      customWorkspace "/opt/jenkins/workspace/prod/" + "$JOB_NAME".replaceAll('/.*', '')
    }
  }

  // BEGIN: Stages
  stages {
    // BEGIN: ENV
    stage('Environment') {
      steps {
        sh '''
          env |  sort
        '''
      }
    }
    // END: ENV

    // BEGIN: Removing previous templates
    stage('Clean old templates') {
      steps {
        sh '''
          ./build.sh -c
        '''
      }
    }
    // END: Removing previous templates

    // BEGIN: Terraform Build
    stage('Terraform Build') {
      steps {
        sh '''
          ./build.sh -t
        '''
      }
    } // END: Terraform Build
  } // END: Stages
  // BEGIN: Post Pipeline
  post {
    //success {
      // BEGIN: Jira Success Ticket
      //script {
        //summary = "Jenkins Terraform VM Build Succeeded"
        //details = "Build Objects: RHEL7, RHEL8 on ${VCENTER_SERVER}"
        //jiraUtils_v2.createITAlert(summary, details)
      //}
    //} // END: Jira Success Ticket 
    failure { 
      // BEGIN: Jira Fail Ticket
      script {
        summary = "Jenkins Terraform VM Build Failure"
        details = "Build Object = ${PWD}"
        jiraUtils_v2.createITAlert(summary, details)
      }
      // END: Jira Fail Ticket
    }
  } // END: Post Pipeline
} // END: Pipeline
