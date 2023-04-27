pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        parallel(
          "make": {
            sh '''

make clean ; make slides/index.html'''
            
          },
          "asciidoc": {
            sh 'asciidoc ecriredeladoc.asciidoc'
            
          }
        )
      }
    }
    stage('Another step') {
      steps {
        echo 'hello world 2'
        archiveArtifacts(artifacts: '**/*.html', fingerprint: true)
      }
    }
  }
}