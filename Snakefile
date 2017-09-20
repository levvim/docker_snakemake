#Snakefile to test snakemake engine functionality (create, move, run different samples)

FILE = "/PROJECT/"
FILES = "1 2 3 4 5".split()

rule all:
        input: expand(FILE + "complete/{samples}.sorted.txt", samples=FILES)

rule test:
        input: FILE + 'raw/{samples}.txt'
        output: FILE + '{samples}.sorted.txt'
        shell:
                "printf 'numero {input}' > {output}"

rule create:
        input: FILE + "raw/{samples}.txt"
        output: FILE + "complete/{samples}.sorted.txt"
        shell:
                "printf 'numero {input}' > {output}"

rule move:
        input: "{filename}.txt"
        shell: "mv {input} ../{input}"

