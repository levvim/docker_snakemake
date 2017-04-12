FROM ubuntu
MAINTAINER Levi Mangarin <markmangarin@gmail.com>

# Install all the software needed to run the pipeline
RUN apt-get -qq update
RUN apt-get install -qqy python3-setuptools python3-docutils python3-flask
RUN easy_install3 snakemake

# clone the most recent version of the pipeline and create project directories
WORKDIR /home/user/
RUN git clone https://github.com/levvim/docker_snakemake.git /home/user && \
        mkdir PROJECT && \
        cd PROJECT && \
        mkdir raw complete

# download the input files into the raw directory
WORKDIR /home/user/PROJECT/raw
RUN for i in {1..10}; do touch $i.txt; done

# Execute the pipeline
RUN snakemake -d /home/user/PROJECT/ --snakfile /home/user/Snakefile

