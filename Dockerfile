FROM ubuntu:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ca-certificates gnupg gnupg1 gnupg2 wget &&\
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      libllvm-14-ocaml-dev libllvm14 llvm-14 llvm-14-dev llvm-14-doc llvm-14-examples llvm-14-runtime \
      clang-14 clang-tools-14 clang-14-doc libclang-common-14-dev libclang-14-dev libclang1-14 clang-format-14 python3-clang-14 clangd-14 clang-tidy-14 \
      libfuzzer-14-dev \
      lldb-14 \
      lld-14 \
      libc++-14-dev libc++abi-14-dev \
      libomp-14-dev \
      libclc-14-dev \
      libunwind-14-dev \
      libmlir-14-dev mlir-14-tools \
      && \
    apt-get autoremove --purge -y && \
    apt-get autoclean -y && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN pip install --no-cache-dir jupyter

ENV CC=clang-14
ENV CXX=clang++-14

CMD ["bash","-l"]
