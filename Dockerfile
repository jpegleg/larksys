FROM scratch
COPY target/x86_64-unknown-linux-musl/release/larksys /larksys
WORKDIR /app/
CMD ["/larksys"]
