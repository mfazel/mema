FROM rocker/rstudio-stable:3.4.0

COPY ./vignettes_MEP-LINCS_2017-05-17/* /home/rstudio/vignettes_MEP-LINCS_2017-05-17/
RUN chown -R rstudio:rstudio /home/rstudio/vignettes_MEP-LINCS_2017-05-17
RUN apt-get update -qq && \
    apt-get install -y \
    zlib1g-dev \
    libssh2-1-dev \
    libxml2-dev \
    curl \
    libpng-dev \
    sudo \
    wget

RUN R -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('data.table', 'gdata', 'reshape2', 'XML', 'mclust', 'dplyr', 'stringr', 'magrittr'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('rmarkdown', 'formatR'), repos = 'http://cran.us.r-project.org')"
RUN R -e "devtools::install_github('MEP-LINCS/MEMA@v1.0.1')"

RUN R -e "source('http://depot.sagebase.org/CRAN.R'); pkgInstall('synapseClient')"
RUN R -e "devtools::install_github('Sage-Bionetworks/rSynapseClient', force=TRUE)"
RUN R -e "install.packages('ggplot2', repos = 'http://cran.us.r-project.org')"
RUN R -e "source('http://bioconductor.org/biocLite.R'); biocLite('RUVnormalize')"
RUN R -e "install.packages(c('ruv', 'plotly', 'RColorBrewer'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('lme4', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('flexmix', 'fpc', 'dendextend'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('d3heatmap', repos = 'http://cran.us.r-project.org')"
