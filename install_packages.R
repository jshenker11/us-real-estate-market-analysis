# Install only packages that are not already available.
packages <- c("tidyverse", "lubridate", "forecast", "knitr", "rmarkdown")
missing <- setdiff(packages, rownames(installed.packages()))
if (length(missing) > 0L) {
  install.packages(missing, repos = "https://cloud.r-project.org")
}
