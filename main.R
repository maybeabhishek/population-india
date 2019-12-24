df <- read.csv("./india-census/india-districts-census-2011.csv")
summary(df)
options(scipen=999)  # turn-off scientific notation like 1e+48
library(ggplot2)
theme_set(theme_bw())  # pre-set the bw theme.
library(ggplot2)
# Scatterplot
gg <- ggplot(df, aes(x=df$Literate/10000, y=df$Population/10000)) +
  geom_point(aes(col=df$State.name)) +
  labs(subtitle="Literacy Vs Population",
       y="Population",
       x="Literacy",
       title="Scatterplot",
       caption = "Source: Indian Census 2011")
plot(gg)
library(ggExtra)
# Scatterplot
theme_set(theme_bw())  # pre-set the bw theme.
mpg_select <- df[df$Male_Literate >= mean(df$Male_Literate) & df$Female_Literate>=mean(df$Female_Literate), ]
g <- ggplot(df, aes(Male_Literate, Female_Literate)) +
  geom_count() +
  geom_smooth(method="lm", se=F)
ggMarginal(g, type = "histogram", fill="transparent")
ggMarginal(g, type = "boxplot", fill="transparent")
library(ggcorrplot)
col <- c("Population", "Literate", "Male_Literate", "Female_Literate", "Hindus", "Muslims", "Christians", "Sikhs", "Buddhists", "Jains", "Others_Religions", "Rural_Households","Urban_Households")
seldf <- df[col]
corr <- round(cor(seldf), 1)
ggcorrplot(corr, hc.order = TRUE,
           type = "lower",
           lab = TRUE,
           lab_size = 3,
           method="circle",
           colors = c("tomato2", "white", "springgreen3"),
           title="Correlogram",
           ggtheme=theme_bw)
corr <- round(cor(seldf), 1)
ggcorrplot(corr, hc.order = TRUE,
           type = "lower",
           lab = TRUE,
           lab_size = 3,
           method="circle",
           colors = c("tomato2", "white", "springgreen3"),
           title="Correlogram",
           ggtheme=theme_bw)
col <- c("Population", "Literate", "Literate_Education","Illiterate_Education","Households_with_Internet","Location_of_drinking_water_source_Away_Households" )
seldf <- df[col]
corr <- round(cor(seldf), 1)
ggcorrplot(corr, hc.order = TRUE,
           type = "lower",
           lab = TRUE,
           lab_size = 3,
           method="circle",
           colors = c("tomato2", "white", "springgreen3"),
           title="Correlogram",
           ggtheme=theme_bw)
