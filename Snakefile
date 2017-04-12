#Snakefile to test snakemake engine functionality (create, move, run different files)

FILE = "/home/PROJECT/"
FILES = "1 2 3 4 5 6 7 8 9 10".split()

rule all:
        input: expand("{files}.sorted.txt", files=FILES)

rule create:
        input: FILE + "raw/{files}.txt"
        output: FILE + "complete/{files}.sorted.txt"
        shell:
                "printf 'numero {input}' > {output}"
#
#rule move:
#       input: "{filename}.txt"
#       shell: "mv {input} ../{input}"
#rule test:
#       input: '1.txt'
#       output: '1.sorted.txt'
#       shell: "printf 'numero {input}' > {output}"

