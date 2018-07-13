import os

env = Environment(ENV=os.environ)
env.CacheDir("cache")

cpus = Value(8)

# Software install

env.Command("scratch/PrimerID-ba7e4e976a0d427bb812719b87a8dca01c4face1.zip",
            Value("https://github.com/cbg-ethz/PrimerID/archive/ba7e4e976a0d427bb812719b87a8dca01c4face1.zip"),
            "wget -O $TARGET $SOURCE")

env.Command("scratch/seqan-v2.0.0.zip",
            Value("https://github.com/seqan/seqan/archive/seqan-v2.0.0.zip"),
            "wget -O $TARGET $SOURCE")

env.Command(["scratch/PrimerID/pidalign",
             "scratch/PrimerID/pidalyse"],
            ["install.sh",
             "scratch/PrimerID-ba7e4e976a0d427bb812719b87a8dca01c4face1.zip",
             "scratch/seqan-v2.0.0.zip"],
            "bash $SOURCE > scratch/install.log")

# Download data

accessions = ["SRR2097103", "SRR2097104", "SRR2097105", "SRR2097106", "SRR2097107", "SRR2097108"]
pids = ["3223a", "3223b", "3223c", "3236a", "3236b", "3236c"]

for accession in accessions:
    env.Command(["scratch/{}_1.fastq".format(accession),
                 "scratch/{}_2.fastq".format(accession)],
                Value(accession),
                " && ".join([
                     "cd scratch",
                     "prefetch $SOURCE",
                     "fastq-dump --defline-qual '+' --split-files $SOURCE"]))

# Align data

for accession, pid in zip(accessions, pids):
    env.Command(["scratch/PrimerID/scripts/Comparing estimators/{0}/{0}_R{1}.fastq".format(pid, i) for i in (1, 2)],
                ["align.sh",
                 Value(pid),
                 "scratch/{}_1.fastq".format(accession),
                 "scratch/{}_2.fastq".format(accession),
                 cpus,
                 "scratch/PrimerID/pidalign",
                 "scratch/PrimerID/pidalyse"],
                "bash $SOURCES")

# Zip aligned data

for pid in pids:
    for i in (1, 2):
        env.Command("scratch/{}_R{}.fastq.gz".format(pid, i),
                    "scratch/PrimerID/scripts/Comparing estimators/{0}/{0}_R{1}.fastq".format(pid, i),
                    "gzip -9 -c $SOURCE > $TARGET")

# Consensus sequences

for pid in pids:
    env.Command("scratch/{}_QC_1_cons.fasta".format(pid),
                "scratch/PrimerID/scripts/Alignments/{0}/{0}_QC_1_cons.fasta".format(pid),
                "cp $SOURCE $TARGET")

