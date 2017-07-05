FROM rocker/rstudio-stable:devel
#FROM rocker/rstudio:latest
#    biblatex \
#    libatlas3gf-base \
#    libgdal1-dev \
#    libmyodbc \
#    libmysqlclient15-dev \
#    libproc-dev \

RUN apt-get update -qq && \
    apt-get install -y \
    zlib1g-dev \
    libssh2-1-dev \
    libxml2-dev \
    curl \
    jags \
#    libcairo2 \
#    libcairo2-dev \
#    libfftw3-dev \
#    libgraphviz-dev \
#    libnetcdf-dev \
#    libproj-dev \
#    libprotoc-dev \
#    libxt-dev \
#    libxt6 \
#    lsb-release \
#    odbc-postgresql \
#    protobuf-compiler \
    sudo \
#    tdsodbc \
#    texinfo \
#    texlive \
#    texlive-bibtex-extra \
#    texlive-fonts-extra \
#    texlive-latex-extra \
#    texlive-xetex \
#    unixodbc \
#    unixodbc-dev \
    wget

## (2) Install base R, dependencies for MEMA, and lastly, MEMA itself.
RUN R -e "install.packages(c('devtools'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('data.table', 'gdata', 'reshape2', 'XML', 'mclust', 'dplyr', 'stringr', 'magrittr'), repos = 'http://cran.us.r-project.org')"
RUN R -e "devtools::install_github('MEP-LINCS/MEMA')"


## (3) Install the rest of R packages for running MEMA vignettes 
 RUN R -e "source('http://depot.sagebase.org/CRAN.R'); pkgInstall('synapseClient')"
RUN R -e "devtools::install_github('Sage-Bionetworks/rSynapseClient')"
RUN R -e "install.packages('ggplot2', repos = 'http://cran.us.r-project.org')"
RUN R -e "source('http://bioconductor.org/biocLite.R'); biocLite('RUVnormalize')"
RUN R -e "install.packages(c('ruv', 'plotly', 'RColorBrewer'), repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('lme4', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('png', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('flexmix', 'fpc', 'dendextend', 'd3heatmap'), repos = 'http://cran.us.r-project.org')"
