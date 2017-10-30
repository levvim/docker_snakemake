FROM ubuntu
MAINTAINER Levi Mangarin <markmangarin@gmail.com>

# Install all the software needed to run the pipeline
RUN apt-get -qq update
RUN apt-get install -qqy python3-setuptools python3-docutils python3-flask
RUN apt-get install -y wget git
RUN easy_install3 snakemake

# clone the most recent version of the pipeline and create project directories
WORKDIR /

RUN git clone https://github.com/levvim/docker_snakemake.git /docker_snakemake && \
        mkdir PROJECT && \
        cd PROJECT && \
        mkdir raw complete

# download the input files into the project directory
RUN cd /PROJECT/raw/ \
    && for i in 1 2 3 4 5; do echo "sample $i" > "$i".txt; done

# list filetree before execution
WORKDIR /
RUN ls -alR | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/' > filetree_origin.txt

# Execute the pipeline
#RUN snakemake -d /PROJECT/ --snakefile /docker_snakemake/Snakefile --config samples="1 2"
ENTRYPOINT snakemake
