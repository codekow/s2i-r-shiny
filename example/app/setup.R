options(
    repos = "https://cran.microsoft.com"
)

update.packages(ask = FALSE)

install.packages(c('rmarkdown', 'shiny'), INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))

install.packages('tm', INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))
