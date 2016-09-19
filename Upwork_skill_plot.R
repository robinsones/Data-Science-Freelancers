library(readr)
if(!require(devtools)) {
  install.packages('devtools')
}
library(igraph)
library(ggraph)
library(widyr)
# use only packages with at least 4 mentions, to reduce noise
library(dplyr)
library(purrr)
devtools::install_github("dgrtwo/widyr")

all_skills <- read_csv("~/Dropbox/ds/PP/all_skills.csv")

all_skills <- all_skills[!grepl("translation", all_skills$skill_name),]
all_skills <- all_skills[!grepl("assistant", all_skills$skill_name),]
all_skills <- all_skills[!grepl("writing", all_skills$skill_name),]
all_skills <- all_skills[!grepl("market", all_skills$skill_name),]
all_skills <- all_skills[!grepl("admin", all_skills$skill_name),]
all_skills <- all_skills[!grepl("transcription", all_skills$skill_name),]
all_skills <- all_skills[!grepl("typing", all_skills$skill_name),]
all_skills <- all_skills[!grepl("customer", all_skills$skill_name),]
all_skills <- all_skills[!grepl("email", all_skills$skill_name),]

skill_counts <- all_skills %>%
  count(skill_name) %>%
  filter(n >= 1500)

skill_counts <- all_skills %>%
  count(skill_name) %>%
  filter(n >= 1000)

#write.csv(popular_skills)
skill_correlations <- all_skills %>%
  semi_join(skill_counts) %>%
  widyr::pairwise_cor(skill_name, ciphertext, sort = TRUE, upper = skill_counts)

skill_correlations
write_csv(skill_correlations, "skill_correlations.csv")

set.seed(2016)

# we set an arbitrary threshold of connectivity
skill_correlations %>%
  filter(correlation > .15) %>%
  graph_from_data_frame(vertices = skill_counts) %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = correlation)) +
  geom_node_point(aes(size = n), color = "lightblue") +
  theme_void() +
  geom_node_text(aes(label = name), repel = TRUE, size = 5.8) +
  theme(legend.position = "none")
