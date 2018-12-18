node {
    //needs update to whatever we call the packer slave configuration in jenkins
  deleteDir()

  stage ('Checkout') {
      stage('jenkinscicdtest1'){
          echo 'Checking out terraform-test'
          checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CloneOption', depth: 0, noTags: true, reference: '', shallow: false, timeout: 60], [$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: true, reference: '', timeout: 60, trackingSubmodules: true], [$class: 'RelativeTargetDirectory', relativeTargetDir: 'server-core'],[$class: 'CheckoutOption', timeout: 60]], submoduleCfg: [], userRemoteConfigs: [[url: 'https://git@github.com:Kzndr/jenkinscicdtest.git']]])
      }
      stage('jenkinscicdtest1'){
          echo 'Checking out pda-aws-deployment'
          checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CloneOption', depth: 0, noTags: true, reference: '', shallow: false, timeout: 60], [$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: true, reference: '', timeout: 60, trackingSubmodules: true], [$class: 'RelativeTargetDirectory', relativeTargetDir: 'server-spoke'], [$class: 'CheckoutOption', timeout: 60]], submoduleCfg: [], userRemoteConfigs: [[url: 'https://git@github.com:Kzndr/jenkinscicdtest.git']]])
      }
  }
  
 
  stage ('Validate') {
       //def packer_file = readFile "/home/ec2-user/.jenkins/workspace/PipelineTest/terraform-test/packer.json"
       //echo "$packer_file"
          //def packer_file = 'packer.json'
          // packer.json file will need to be updated to work with this method. (ie. credentials... and username values added)
          print "Running packer validate on : packer.json"
          sh "/usr/local/packer/packer -v ; /usr/local/packer/packer validate $WORKSPACE/jenkinscicdtest1/packer.json"
      }


  stage ('Packer') {
          sh "/usr/local/packer/packer build $WORKSPACE/terraform-test/packer.json"
  }
  
  stage ('terraform') {
          //someone needs to fill in this part to run the deploy to aws. As I don't currently know the repo location, the module names, etc.
  }

    
    
    
}