FROM rust:1.62.0
RUN cargo install cargo-chef
RUN apt-get update && \
    apt-get install -y musl-tools ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" |  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
RUN apt-get install -y autoconf automake libtool curl make g++ unzip cmake
RUN apt-get install -y openssh-client
RUN rustup override set 1.60.0
RUN rustup component add rustfmt
RUN rustup target add x86_64-unknown-linux-musl
RUN rustup toolchain install nightly
RUN cargo install cargo2junit
RUN cargo install cargo-outdated
RUN cargo install cargo-udeps
RUN rustup component add clippy




