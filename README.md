# Intermediate results for Primer ID 5VM data

This repo recomputes intermediate alignments and consensus sequences from the study:

Seifert D, et al. (2016) A Comprehensive Analysis of Primer IDs to Study
Heterogeneous HIV-1 Populations. *Journal of Molecular Biology*
**428**(1):238–250.
doi:[10.1016/j.jmb.2015.12.012](https://dx.doi.org/10.1016/j.jmb.2015.12.012)

This study includes Illumina sequencing data deposited in the
[Sequence Read Archive](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA289594)
and code for performing alignments and calling Primer ID consensus
sequences, [available from github](https://github.com/cbg-ethz/PrimerID).
We have recomputed these intermediate alignment and consensus sequence results
for use in other studies of HIV plasmid sequences, in particular for:

[Measurement error and variant-calling in deep Illumina sequencing of HIV](https://github.com/kantorlab/hiv-measurement-error)

## Results

The computed results are available from figshare at
[https://doi.org/10.6084/m9.figshare.6713132.v1](https://doi.org/10.6084/m9.figshare.6713132.v1).

## Prerequisites

Compiled Linux 64-bit binaries are available for all dependencies in the
[kantorlab Anaconda channel](https://anaconda.org/kantorlab). The corresponding
conda recipes are available from
[https://github.com/kantorlab/conda-recipes](https://github.com/kantorlab/conda-recipes).

To use the packages, first install [Anaconda 3](https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh).
Then recreate the analysis environment with the command:

    conda create -n primer-id-5vm -c kantorlab ampliconclipper fastx_toolkit picard prinseq scons=3.0.1.1
    conda install -n primer-id-5vm -c bioconda sra-tools
    conda install -n primer-id-5vm gcc_linux-64 gxx_linux-64 boost=1.65.1 gsl
    source activate primer-id-5vm

## Rerunning

All results can be recomputed by executing `scons` in the root directory of the repo.
