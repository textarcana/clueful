FROM analytics:v0.0.1 as clueful_app

COPY --chown=auto:automation "./lib/clueful" "/opt/bot"

USER auto

WORKDIR /opt/bot

RUN mkdir toolkit

WORKDIR toolkit

RUN git clone https://github.com/context-driven-testing-toolkit/github-search.git
RUN git clone https://github.com/context-driven-testing-toolkit/jq-stdlib.git
RUN git clone https://github.com/context-driven-testing-toolkit/spaces2tsv.git

RUN cp jq-stdlib/lib/jq/stdlib.jq /home/auto/.jq

ENV PATH "$PATH:/opt/bot/toolkit/spaces2tsv/bin"

WORKDIR /opt/bot/

ENTRYPOINT ["libexec/command-manager"]
