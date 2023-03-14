FROM docker.io/rocker/r-ver:4

LABEL io.k8s.description="R" \
    io.k8s.display-name="R" \
    io.openshift.tags="builder,r" \
    io.openshift.expose-services="8080:http" \
    # this label tells s2i where to find its mandatory scripts
    # (run, assemble, save-artifacts)
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

USER root
COPY fix-permissions install2.r /usr/local/bin/

ENV STI_SCRIPTS_PATH=/usr/libexec/s2i

# Install R dependencies

# Setup R paths
RUN mkdir -p /opt/app-root/R && \
    mkdir -p /opt/app-root/src && \
    fix-permissions /opt/app-root

COPY setup.R /opt/app-root
ENV R_LIBS_USER=/opt/app-root/R


#COPY Rprofile.site /usr/lib64/R/etc
RUN echo "local(options(shiny.port = 8080, shiny.host = '0.0.0.0'))" > "${R_HOME}/Rprofile.site"
ENV _R_SHLIB_STRIP_=true

RUN R --no-save < /opt/app-root/setup.R && \
    fix-permissions /opt/app-root

COPY s2i/bin /usr/libexec/s2i

WORKDIR /opt/app-root/src

USER 1001

# Set the default port for applications built using this image
EXPOSE 8080

CMD ["/usr/libexec/s2i/run"]