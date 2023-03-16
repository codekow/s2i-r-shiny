# options(
#     repos = "https://cran.microsoft.com"
# )

# update packages
update.packages(ask = FALSE)

# install packages
install.packages(c('rmarkdown', 'shiny'), INSTALL_opts=c("--no-docs", "--no-help", "--no-html"))
