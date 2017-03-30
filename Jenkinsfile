pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        parallel(
          "Build": {
            echo 'this is a test'
            
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
      }
    }
  }
}