FROM registry.access.redhat.com/ubi7/s2i-base:1

LABEL io.k8s.description="R" \
    io.k8s.display-name="R" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="builder,r" \
    # this label tells s2i where to find its mandatory scripts
    # (run, assemble, save-artifacts)
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

USER root

# kludge: ubi7
COPY centos.repo /etc/yum.repos.d/
COPY RPM-GPG-KEY-CentOS-7 /etc/pki/rpm-gpg/

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Install R and dependencies
RUN yum -y upgrade && \
    yum -y install \
      libtool file \
      R-core R-core-devel --enablerepo='*' && \
    yum clean all && \
    rm -rf /var/cache/yum

# Setup R paths
COPY setup.R /opt/app-root
ENV R_LIBS_USER=/opt/app-root/R

RUN mkdir /opt/app-root/R && \
    chmod -R g+w /opt/app-root/R

# kludge: fix install errors
# https://github.com/r-lib/devtools/issues/2084#issuecomment-530122317
RUN mkdir -v /usr/share/doc/$(R -s -e 'f <- R.Version(); cat(sprintf("R-%s.%s",f[6],f[7]))')/html && \
    cp /usr/lib64/R/library/stats/html/R.css /usr/share/doc/$(R -s -e 'f <- R.Version(); cat(sprintf("R-%s.%s",f[6],f[7]))')/html

#COPY Rprofile.site /usr/lib64/R/etc
RUN echo "local(options(shiny.port = 8080, shiny.host = '0.0.0.0'))" > /usr/lib64/R/etc/Rprofile.site
ENV _R_SHLIB_STRIP_=true

RUN R --no-save < /opt/app-root/setup.R && \
    fix-permissions /opt/app-root

COPY s2i/bin /usr/libexec/s2i

USER 1001

# Set the default port for applications built using this image
EXPOSE 8080

CMD ["/usr/libexec/s2i/run"]