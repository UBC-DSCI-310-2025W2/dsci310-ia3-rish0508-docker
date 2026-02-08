FROM rocker/rstudio:4.4.2

# Install remotes so we can pin package versions
RUN Rscript -e "install.packages('remotes', repos='https://cloud.r-project.org')"

# Install a pinned version of cowsay
RUN Rscript -e "remotes::install_version('cowsay', version='0.8.0', repos='https://cloud.r-project.org')"

# Add a script that uses the package (proof it works)
COPY say.R /home/rstudio/say.R
RUN chown rstudio:rstudio /home/rstudio/say.R

USER rstudio
CMD ["R"]
