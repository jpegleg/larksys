# larksys

Packaging template reference for arbitrary single binary system daemons that don't have exposed ports.
Exposing a port could of course be added, but the defaults are focused on daemon/controllers that
run as a service and take no client connections.

- Docker (or Podman)
- Docker Compose
- Kubernetes
- .rpm (RPM packages)
- .deb (debian packages)
- systemd
- ansible

The point isn't to use all of the files in prod at once, as we would not have Docker, k8s, and systemd all at the same time :)

Instead the point is to replace "larksys" in the files with the name of the program, and otherwise update the files
based on the needs, and use in CI for automatic packaging of RPM, Deb, Docker (OCI build), and have k8s and compose
YAML ready to go.

CI reference templates for musl lib-c statically linked binary compiling:

- Jenkinsfile
- buildme.sh

Both the example Jenkinsfile and the buildme.sh perform the same shell actions to compile a statically linked rust binary with cargo and also run cargo test, then collect checksums and tokei report on files to artifacts, and finally pack up a tarball with the binary and artifacts.

#### Rust unit test reference

The template file `src/lib.rs` is to be a starting point for unit tests.
