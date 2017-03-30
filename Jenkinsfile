pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        parallel(
          "Build": {
            echo 'this is a test'
            sh 'make slides/index.html'
            
          },
          "Parallel build": {
            echo 'Another message'
            
          }
        )
      }
    }
    stage('Another step') {
      steps {
        echo 'hello world 2'
        archiveArtifacts(artifacts: 'slides/**', fingerprint: true)
      }
    }
  }
}