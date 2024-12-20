FROM docker.io/ubuntu:jammy AS download

ARG DEBIAN_FRONTEND=noninteractive
ARG DEBIAN_PRIORITY=critical

# https://github.com/tectonic-typesetting/tectonic

ARG TECTONIC_REPO="tectonic-typesetting/tectonic"
ARG TECTONIC_VTAG="continuous"
ARG TECTONIC_FILE="tectonic-(.+)-x86_64-unknown-linux-gnu.tar.gz"

# https://github.com/latex-lsp/texlab

ARG TEXLAB_REPO="latex-lsp/texlab"
ARG TEXLAB_VTAG="v5.21.0"
ARG TEXLAB_FILE="texlab-x86_64-linux.tar.gz"

# https://github.com/go-task/task

ARG TASK_REPO="go-task/task"
ARG TASK_VTAG="v3.40.1"
ARG TASK_FILE="task_linux_amd64.tar.gz"

#

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates wget jq && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/tectonic
RUN wget -q -O - "https://api.github.com/repos/$TECTONIC_REPO/releases/tags/$TECTONIC_VTAG" | \
    jq -r ".assets | map(select(.name | test(\"$TECTONIC_FILE\"))) | first | .browser_download_url" | \
    xargs wget -q && tar -xvzf *.tar.gz

WORKDIR /usr/src/texlab
RUN wget -q "https://github.com/$TEXLAB_REPO/releases/download/$TEXLAB_VTAG/$TEXLAB_FILE" && tar -xvzf *.tar.gz

WORKDIR /usr/src/task
RUN wget -q "https://github.com/$TASK_REPO/releases/download/$TASK_VTAG/$TASK_FILE" && tar -xvzf *.tar.gz


#


FROM docker.io/ubuntu:jammy AS development

ARG DEBIAN_FRONTEND=noninteractive
ARG DEBIAN_PRIORITY=critical

COPY --from=download /usr/src/tectonic/tectonic /usr/src/texlab/texlab /usr/src/task/task /usr/local/bin/

RUN apt-get update && \
    apt-get install -y --no-install-recommends libfontconfig1 libgraphite2-3 libharfbuzz-bin libicu70 libssl3 zlib1g && \
    apt-get install -y --no-install-recommends ca-certificates lcdf-typetools python3-pygments biber 7zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
