# docker_snakemake

### Basic framework to implement Snakemake pipelines in a docker container. 

We create a ubuntu machine with the /docker_snakemake/ directory that contains pipeline scripts/log files and a /PROJECT/ directory that contains the files used in analysis, including intermediary steps. Additional programs would be installed in the home dir.

We aggregate the non-dependency resources (i.e. reference files) in the Dockerfile as well. In this case we just create sample text files. Snakemake can also call files remotely.

To run, first clone the repo and get the Dockerfile.

    git clone https://github.com/levvim/docker_snakemake.git .

Build the dockerfile, which will execute the snakemake engine.

    docker build . -t snakemake -f Dockerfile
    docker build . -t snakemake -f Dockerfile --build-arg CACHEBUST=$(date +%s) #to avoid cache of git files

Alternatively you can run the single command to build from repo.

    docker build https://github.com/levvim/docker_snakemake.git -t snakemake
