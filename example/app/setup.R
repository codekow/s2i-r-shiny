options(
    repos = "https://cran.microsoft.com"
)

update.packages(ask = FALSE)

install.packages('tm', INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))

# library(withr)

# with_makevars(c(PKG_CFLAGS = "-std=c11"),
#     install.packages('tm', INSTALL_opts=c("--no-docs", "--no-help", "--no-html")),
#     assignment = "+=")
