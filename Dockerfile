FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/coot

# Install wget and tar
RUN apt-get update && apt-get install -y wget tar

# Grab binary
RUN wget https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/binaries/release/coot-0.9.8-binary-Linux-x86_64-ubuntu-20.04.4-python-gtk2.tar.gz

# Extract binaries
RUN tar xf coot-0.9.8-binary-Linux-x86_64-ubuntu-20.04.4-python-gtk2.tar.gz --strip-components=1

# Install dependencies (the first layer of hell)
RUN apt-get update && apt-get install -y \
    wget \
    gtk2.0 \
    libglib2.0-0 \
    libpango1.0-0 \
    libcairo2 \
    libatk1.0-0 \
    libgdk-pixbuf2.0-0 \
    libsm6 \
    libice6 \
    libxi6 \
    libfontconfig1 \
    libfreetype6 \
    libxext6 \
    libx11-6 \
    libglu1-mesa \
    libglu1-mesa-dev \
    guile-2.2 \
    bash \
    libxmu6 \
    libssl1.1\
    mesa-utils \
    && rm -rf /var/lib/apt/lists/*

# Disable GPU rendering
ENV LIBGL_ALWAYS_SOFTWARE=1

# Run binary
CMD ["./bin/coot"]

