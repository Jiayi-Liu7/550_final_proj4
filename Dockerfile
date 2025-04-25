# Dockerfile
FROM rocker/verse:4.3.0

# system deps for tidiverse + rmarkdown
RUN apt-get update && \
    apt-get install -y --no-install-recommends libcurl4-openssl-dev libssl-dev pandoc pandoc-citeproc && \
    rm -rf /var/lib/apt/lists/*

# copy project in
WORKDIR /home/rstudio/project
COPY . /home/rstudio/project

# install R deps
RUN R -e "install.packages(c('tidyverse','knitr','rmarkdown'), repos='https://cloud.r-project.org')"

# default working directory for report output
VOLUME ["/home/rstudio/project/report"]

# entrypoint: render the Rmd into report folder
ENTRYPOINT ["Rscript", "-e", "rmarkdown::render('DATA550_final proj.Rmd', output_dir='report')"]
