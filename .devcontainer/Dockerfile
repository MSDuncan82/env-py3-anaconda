FROM continuumio/anaconda3

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && apt-get -y install git openssh-client less iproute2 procps iproute2 lsb-release \
    #
    # Install pylint
    && /opt/conda/bin/pip install pylint \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive  \
    && apt-get -y install --no-install-recommends curl ca-certificates \
    && curl -sSL -o- "https://raw.githubusercontent.com/microsoft/vscode-dev-containers/master/script-library/common-debian.sh" | bash -

EXPOSE 8888

