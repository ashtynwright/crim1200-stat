mtcars
?mtcars
table(mtcars$vs)
table(mtcars$gear, mtcars$vs)
tab <- table(mtcars$gear, mtcars$vs)
tab
barplot(tab)

#Barplot
barplot(tab, beside = T)
barplot (tab, beside=TRUE, legend=FALSE)


ggplot(data = tab, aes(x=Engine, y=Value, fill=Gear)) +
    geom_bar(stat= "identity", position = "dodge")
ggplot fortify(Data=tab, aes(x=Engine, y=Value, fill=Gear)) + 
  geom_bar (stat= "identity", position= "dodge")





install.packages("ggplot2")
install.packages("reshape2")
install.packages(gggame)