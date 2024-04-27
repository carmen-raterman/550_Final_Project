FROM rocker/r-ubuntu as base

RUN mkdir /final_project
WORKDIR /final_project

RUN mkdir -p renv
COPY renv.lock .
COPY .Rprofile .
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/r-ubuntu
RUN apt-get update 
RUN apt-get install -y pandoc

WORKDIR /final_project
COPY --from=base /final_project .

#Building structure
RUN mkdir code
RUN mkdir output
RUN mkdir raw_data
RUN mkdir report

#Multi-stage build
COPY raw_data raw_data
COPY code code
COPY Makefile .
COPY report.Rmd .

#Make and move report.html to report folder
CMD make && mv report.html report

