# docker_snakemake

### Basic framework to implement Snakemake pipelines in a docker container. 

<<<<<<< HEAD
We create a ubuntu machine with the /docker_snakemake/ directory that contains pipeline scripts/log files and a /PROJECT/ directory that contains the files used in analysis, including intermediary steps.

We download the non-dependency resources (i.e. reference files) in the Dockerfile, but this can also be done in Snakemake.
=======

We create a ubuntu machine with the /home/user/ directory that contains pipeline scripts/log files and a /home/user/PROJECT/ directory that contains the files used in analysis including intermediary steps stored in seperate folders.

We aggregate the non-dependency resources (i.e. reference files) in the Dockerfile as well. In this case we just create sample text files.
>>>>>>> 530f4db5ed9b5914c91be546dfcb561d2ef817fa

To run, first clone the repo and get the Dockerfile.

    git clone https://github.com/levvim/docker_snakemake.git .

Build the dockerfile, which will execute the snakemake engine.
<<<<<<< HEAD
        docker build . -t snakemake -f Dockerfile
        docker build . -t snakemake -f Dockerfile --build-arg CACHEBUST=$(date +%s) #to avoid cache of git files

Alternatively you can run the single command to build from repo.
        docker build https://github.com/levvim/docker_snakemake.git -t snakemake
=======

    docker build . -t snakemake
    docker build . -t snakemake --build-arg CACHEBUST=$(date +%s) #to avoid git cache
>>>>>>> 530f4db5ed9b5914c91be546dfcb561d2ef817fa
