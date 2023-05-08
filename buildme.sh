#!/usr/bin/env bash

docker run -v $PWD:/volume --rm -t clux/muslrust:stable cargo build --release
mv target/x86_64-unknown-linux-musl/release/ ./larksys
echo "Statically linked musl libc binary ./larksys compiled."
echo
echo "Running tests..."
cargo test
