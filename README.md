# docker-snakemake

## Basic framework to implement Snakemake pipelines in a docker container. 

We create a ubuntu machine with the /home/user/ directory that contains pipeline scripts/log files and a /home/user/PROJECT/ directory that contains the files used in analysis including intermediary steps stored in seperate folders.

We aggregate the non-dependency resources (i.e. reference files) in the Dockerfile as well. In this case we just create sample text files.

To run, first clone the repo and get the Dockerfile.

    git clone https://github.com/levvim/docker_snakemake.git .

Build the dockerfile, which will execute the snakemake engine.

    docker build . -t snakemake
    docker build . -t snakemake --build-arg CACHEBUST=$(date +%s) #to avoid git cache
