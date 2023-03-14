# https://github.com/r-lib/devtools/issues/2084
# INSTALL_opts=c("--no-help", "--no-html")
# install.packages('fs', repos = 'https://cran.microsoft.com/')

install.packages('fs')
install.packages('withr', INSTALL_opts=c("--no-help", "--no-html"))

library(withr)

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    install.packages('shiny', INSTALL_opts=c("--no-help", "--no-html")),
    assignment = "+=")

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    install.packages('rmarkdown', INSTALL_opts=c("--no-help", "--no-html")),
    assignment = "+=")

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    install.packages('remotes', INSTALL_opts=c("--no-help", "--no-html")),
    assignment = "+=")

# with_makevars(c(PKG_CFLAGS = "-std=c11"),
#     remotes::install_github('MilesMcBain/deplearning'),
#     assignment = "+=")