library(withr)

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    install.packages('tm', repos = 'https://cran.microsoft.com/', INSTALL_opts=c("--no-help", "--no-html")),
    assignment = "+=")
