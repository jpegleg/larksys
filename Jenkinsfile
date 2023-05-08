pipeline {
    agent {
        label 'deb'
    }


    stages {
        stage('Build') {
            steps {
                sh "docker run -v $PWD:/volume --rm -t clux/muslrust:stable cargo build --release"
            }
            post {
                success {
                    sh "mv target/x86_64-unknown-linux-musl/release/ ./larksys"
                }
            }
        }
        stage('Tests') {
            steps {
                // test the program
                sh "cargo test"
            }
            post {
                success {
                }
            }
        }
        stage('Publish') {
            steps {
                // make a tarball for pick up
            }
            post {
                success {
                }
            }
        }
    }
}
