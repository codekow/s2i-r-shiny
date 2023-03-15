# https://github.com/r-lib/devtools/issues/2084
# INSTALL_opts=c("--no-help", "--no-html")
# install.packages('fs', repos = 'https://cran.microsoft.com/')

# https://cran.r-project.org/web/packages/available_packages_by_name.html

options(
    repos = list(CRAN = "https://packagemanager.posit.co/cran/__linux__/centos8/latest"),
    download.file.method = 'libcurl',
    INSTALL_opts=c("--no-docs", "--no-help", "--no-html")
)

# TODO: can not set global install opts

# setup remotes so you can pull in other libs
install.packages('remotes', INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))

# add some common packages
install.packages(c('withr', 'fs', 'pak', 'pkgdepends'), INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))

# add shiny packages
install.packages(c('rmarkdown', 'shiny'), INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))

# add remote for dependencies
remotes::install_github('MilesMcBain/deplearning', INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))

# library(withr)

# with_makevars(c(PKG_CFLAGS = "-std=c11"),
#     install.packages('shiny', INSTALL_opts=c("--no-help", "--no-html")),
#     assignment = "+=")

# with_makevars(c(PKG_CFLAGS = "-std=c11"),
#     install.packages('rmarkdown', INSTALL_opts=c("--no-help", "--no-html")),
#     assignment = "+=")

# with_makevars(c(PKG_CFLAGS = "-std=c11"),
#     install.packages('remotes', INSTALL_opts=c("--no-help", "--no-html")),
#     assignment = "+=")

# with_makevars(c(PKG_CFLAGS = "-std=c11"),
#     remotes::install_github('MilesMcBain/deplearning'),
#     assignment = "+=")