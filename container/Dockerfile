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

# run test profile to grab plugins and make sure conda env is OK
RUN mkdir -p $NXF_HOME && \
    cat /opt/pgsc_calc/container.config >> /opt/pgsc_calc/nextflow.config && \
    nextflow plugin install nf-schema@2.0.0,nf-prov@1.2.2,nf-google@1.15.2 && \
    nextflow run /opt/pgsc_calc/main.nf -profile test,conda --only_input && \
    rm -r work/

ENV NXF_OFFLINE="true"
