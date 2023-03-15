update.packages(ask = FALSE)

library(withr)

options(
    repos = "https://cran.microsoft.com"
)

with_makevars(c(PKG_CFLAGS = "-std=c11"),
    install.packages('tm', INSTALL_opts=c("--no-help", "--no-html")),
    assignment = "+=")
