# Intermediate results for Primer ID 5VM data

This repo recomputes intermediate alignments and consensus sequences from the study:

Seifert D, et al. (2016) A Comprehensive Analysis of Primer IDs to Study
Heterogeneous HIV-1 Populations. *Journal of Molecular Biology*
**428**(1):238–250.
doi:[10.1016/j.jmb.2015.12.012](https://dx.doi.org/10.1016/j.jmb.2015.12.012)

## Installing prerequisites

    conda create -n primer-id-5vm -c kantorlab ampliconclipper fastx_toolkit picard prinseq scons=3.0.1.1
    conda install -n primer-id-5vm -c bioconda sra-tools
    conda install -n primer-id-5vm gcc_linux-64 gxx_linux-64 boost=1.65.1 gsl
    source activate primer-id-5vm

## Computing

All results can be recomputed by executing `scons` in the root directory of the repo.
