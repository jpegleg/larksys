pipeline {
    agent {
        label 'cargo-docker'
    }


    stages {
        stage('Build') {
            steps {
                sh "echo Starting... "
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
                sh "bash regression.sh"
            }
            post {
                success {
                    sh "echo tests passed"
                }
            }
        }
        stage('Publish') {
            steps {
                // make a tarball for pick up
                sh "which tokei || cargo install tokei"
                sh "tokei | tee workspace_larksys_files.txt"
                sh "b2sum ./larksys > larksys_checksums.txt"
                sh "sha256sum ./larksys >> larksys_checksums.txt"
                sh "sha1sum ./larksys >> larksys_checksums.txt"
                sh "md5sum ./larksys >> larksys_checksums.txt"
                sh "cat larksys_checksums.txt"
                sh "echo Packing tarball..."
                sh "tar czvf larksys.tgz ./larksys ./larksys_checksums.txt ./workspace_larksys_files.txt"
                sh "tar tzvf larksys.tgz"
            }
            post {
                success {
                    sh "echo ...Finished"
                }
            }
        }
    }
}
