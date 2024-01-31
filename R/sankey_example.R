
library("dplyr")
library("htmlwidgets")
library("networkD3")

data(nodes)
data(sample)

sample <- sample %>%
  group_by(starting_status,
           ending_status) %>%
  summarise(count = n())

# nodes <- data.frame(name = c(as.character(sample$starting_status),
#                              as.character(sample$ending_status)) %>% unique())

sample$source_id <- match(sample$starting_status, nodes$node_title) - 1

sample$target_id <- match(sample$ending_status, nodes$node_title) - 1

p <- sankeyNetwork(Links = sample,
                   Nodes = nodes,
                   Source = "source_id",
                   Target = "target_id",
                   Value = "count",
                   NodeID = "node_title",
                   sinksRight = FALSE,
                   iterations = 0,
                   fontFamily = "Calibri",
                   fontSize = 11); p

# Code to add group headings to chart.
#
# htmlwidgets::onRender(p, '
#   function(el) {
#
#     var cols_x = this.sankey.nodes().map(d => d.x).filter((v, i, a) => a.indexOf(v) === i).sort(function(a, b){return a - b});
#
#     cols_x.forEach((d, i) => {
#
#       d3.select(el).select("svg")
#         .append("text")
#         .attr("x", d)
#         .attr("y", 12)
#         .text("Step " + (i + 1));
#
#     })
#
#   }
#
# ')

saveWidget(p, file = "./inst/extdata/sankey_model.html")
