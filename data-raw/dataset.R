
sample <- read.csv("./inst/extdata/sample.txt",
                   header = TRUE,
                   sep = ",",
                   na.strings = c(""),
                   stringsAsFactors = FALSE)

nodes <- read.csv("./inst/extdata/nodes.txt",
                   header = TRUE,
                   sep = ",",
                   na.strings = c(""),
                   stringsAsFactors = FALSE)

usethis::use_data(sample, overwrite = TRUE)

usethis::use_data(nodes, overwrite = TRUE)
