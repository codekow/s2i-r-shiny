# https://github.com/r-lib/devtools/issues/2084
# INSTALL_opts=c("--no-help", "--no-html")

install.packages('fs', repos = 'https://cran.microsoft.com/')
install.packages('withr', repos = 'https://cran.microsoft.com/', INSTALL_opts=c("--no-help", "--no-html"))

library(withr)

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    install.packages('shiny', repos = 'https://cran.microsoft.com/', INSTALL_opts=c("--no-help", "--no-html")),
    assignment = "+=")

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    install.packages('remotes', repos = 'https://cran.microsoft.com/', INSTALL_opts=c("--no-help", "--no-html")),
    assignment = "+=")

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    remotes::install_github('MilesMcBain/deplearning'),
    assignment = "+=")