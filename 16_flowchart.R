library(Gmisc, quietly = TRUE)
library(glue)
library(htmlTable)
library(grid)
library(magrittr)

org_cohort <- boxGrob(glue("Data collection",
                           "and systematization",
                            .sep = "\n"))
eligible <- boxGrob(glue("Data survey",
                          "Fieldwork observations",
                           .sep = "\n"))
included <- boxGrob(glue("Data modelling & GIS mapping",
                         "qualitative analysis",
                         .sep = "\n"))
grp_a <- boxGrob(glue("Data analysis (Python & R)",
                      "and interpretation",
                      .sep = "\n"))

grp_b <- boxGrob(glue("Data coordination",
                      "management",
                      .sep = "\n"))

excluded <- boxGrob(glue("Excluded:",
                         "noise, random variations",
                         .sep = "\n"),
                        just = "left")

grid.newpage()
vert <- spreadVertical(org_cohort,
                       eligible = eligible,
                       included = included,
                       grps = grp_a)
grps <- alignVertical(reference = vert$grps,
                      grp_a, grp_b) %>%
  spreadHorizontal()
vert$grps <- NULL

excluded <- moveBox(excluded,
                    x = 0.8,
                    y = coords(vert$included)$top + distance(vert$eligible, vert$included, half = TRUE, center = FALSE))

for (i in 1:(length(vert) - 1)) {
  connectGrob(vert[[i]], vert[[i + 1]], type = "vert") %>%
    print
}
connectGrob(vert$included, grps[[1]], type = "N")
connectGrob(vert$included, grps[[2]], type = "N")

connectGrob(vert$eligible, excluded, type = "L")

# Print boxes
vert
grps
excluded
