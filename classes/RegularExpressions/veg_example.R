# This example uses regular expressions
# to correct aberrations in a list of vegetation types.

rm(list = ls())
graphics.off()

# Sample data
dat <- data.frame(
    site_id = c(1, 2, 3, 4, 5, 6),
    veg_type = c("Forest",
                "Woodland",
                "Rain Forest",
                "Mangoev",
                "grassland",
                "rainforest")
)


## Define a correction strategy
correction_strategy <- list(
    "Mangoev" = "Mangrove",
    "Rain Forest" = "Rainforest",
    #"grassland" = "Grassland",     #instead of this...
    #"rainforest" = "Rainforest",   #...and this...
    "^(\\w)" = "\\U\\1"             #...use a (Perl-style) regular expression
                                    #that will capitalize the first letter of
                                    #each word that needs it
)

# Use gsub function to correct the data
nerrortype <- length(correction_strategy)
for (i in 1:nerrortype) {
    pattern <- names(correction_strategy)[i]
    repl <- correction_strategy[[i]]
    dat$veg_type <- gsub(pattern, repl, dat$veg_type, perl = TRUE)
}