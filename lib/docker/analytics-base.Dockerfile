FROM perl_analytics:v0.0.1 as analytics_base
RUN apk add \
    ack \
    aspell \
    aspell-dev \
    aspell-en \
    bash \
    cloc \
    coreutils \
    curl \
    dateutils \
    ffmpeg \
    file \
    findutils \
    freetype-dev \
    gettext \
    git \
    gnuplot \
    gource \
    graphviz \
    htop \
    imagemagick \
    jq \
    libc-dev \
    libpng-dev \
    lynx \
    nodejs \
    nodejs \
    npm \
    openssh \
    pigz \
    pwgen \
    py3-matplotlib \
    py3-numpy \
    py3-numpy-dev \
    python2 \
    python3 \
    python3-dev \
    ruby \
    ruby-dev \
    ruby-irb \
    ruby-rdoc \
    shadow \
    tree \
    util-linux \
    wget \
    zlib

RUN npm -g install \
    bats \
    http-server \
    eslint

WORKDIR /home/auto
RUN git clone git://github.com/hoxu/gitstats.git
WORKDIR gitstats
USER root
RUN make install
WORKDIR /home/auto

RUN groupadd -r automation
RUN adduser -D -g automation auto
