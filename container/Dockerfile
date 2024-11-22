FROM condaforge/miniforge3:24.9.2-0 AS builder

RUN conda config --add channels bioconda && conda config --add channels conda-forge && conda config --set channel_priority strict

RUN mamba install nextflow

RUN nextflow clone pgscatalog/pgsc_calc -r v2.0.0 /opt/pgsc_calc

RUN mamba env create --file=/opt/pgsc_calc/environments/pgscatalog_utils/environment.yml --prefix /opt/pgscatalog_utils

RUN mamba env create --file=/opt/pgsc_calc/environments/fraposa/environment.yml --prefix /opt/fraposa

RUN mamba env create --file=/opt/pgsc_calc/environments/report/environment.yml --prefix /opt/report

RUN mamba env create --file=/opt/pgsc_calc/environments/plink2/environment.yml --prefix /opt/plink2

RUN mamba env create --file=/opt/pgsc_calc/environments/pyyaml/environment.yml --prefix /opt/pyyaml

RUN mamba env create --file=/opt/pgsc_calc/environments/zstd/environment.yml --prefix /opt/zstd

ENV NXF_HOME=/opt/nextflow

COPY container.config /opt/pgsc_calc/

# grab plugins
RUN mkdir $NXF_HOME && nextflow run /opt/pgsc_calc/main.nf -profile test,conda --only_input -c /opt/pgsc_calc/container.config

ENV NXF_OFFLINE="true"
