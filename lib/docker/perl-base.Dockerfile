FROM alpine:3.12 as base
RUN apk add \
    aspell-dev \
    build-base \
    gcc \
    libxml2 \
    libxml2-dev \
    make \
    perl \
    perl-date-manip \
    perl-dev \
    perl-digest-md5 \
    perl-file-slurp \
    perl-libwww \
    perl-log-log4perl \
    perl-utils \
    perl-yaml

RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'CPAN')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'Date::Manip::Date')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'File::Path')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'JSON')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'LWP::Simple')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'Math::Combinatorics')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'Text::Aspell')"
RUN cpan install 'Text::Aspell'
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'Text::ParseWords')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'Thread::Pool::Simple')"
RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'Time::Duration')"

# This block needs to run after the previous CPAN installs have completed.

RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'XML::XML2JSON')"
