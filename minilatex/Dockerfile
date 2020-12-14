FROM ubuntu:bionic

ENV PATH="${PATH}:/root/bin"
# combine into one run command to reduce image size
RUN apt-get update && apt-get install -y perl wget libfontconfig1 && \
    wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh  && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

RUN tlmgr install pgf fontawesome hyperref paracol tikz-3dplot smartdiagram float xcolor titlesec smartdiagram raleway geometry xstring ly1 && \
    fmtutil-sys --all
