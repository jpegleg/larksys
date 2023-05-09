#!/usr/bin/env bash
echo "Starting... $(date +%Y%m%d%H%M%S)"
docker run -v $PWD:/volume --rm -t clux/muslrust:stable cargo build --release
mv target/x86_64-unknown-linux-musl/release/larksys ./larksys
echo "Statically linked musl libc binary ./larksys compiled."
echo
echo "Running tests..."
cargo test
cargo clippy
bash regression.sh
echo "Tests ended, gathering stats and checksums..."
echo
which tokei || cargo install tokei
tokei | tee workspace_larksys_files.txt
b2sum ./larksys > larksys_checksums.txt
sha256sum ./larksys >> larksys_checksums.txt
sha1sum ./larksys >> larksys_checksums.txt
md5sum ./larksys >> larksys_checksums.txt
cat larksys_checksums.txt
echo "Packing tarball..."
tar czvf larksys.tgz ./larksys ./larksys_checksums.txt ./workspace_larksys_files.txt
tar tzvf larksys.tgz
echo "...Finished $(date +%Y%m%d%H%M%S)"
