# ! ------------ NO 1 --------------- !

# Soal 1
x <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

# 1a
selisih <- y - x 

standar_deviasi <- sd(selisih)
print(paste("Standar Deviasi:", standar_deviasi))

# 1b
result <- t.test(x, y, paired = TRUE)

t_value <- result$statistic
print(paste("Nilai t:", t_value))

p_value <- result$p.value
print(paste("Nilai p:", p_value))

# 1c
t.test(x, y, paired = TRUE, conf.level = 0.95)

# ! ------------ NO 2 --------------- !

# Soal 2
library(BSDA)
mu      <- 25000
n_x     <- 100
mean_x  <- 23500
s_x     <- 3000

zsum.test(
    mean.x = mean_x, 
    sigma.x = s_x, 
    n.x = n_x,
    alternative = "greater", 
    mu = mu, 
    conf.level=0.95
)

# alternative hypotesis: true mean is greater than 25000

# ! ------------ NO 3 --------------- !

# Soal 3
n_1 <- 20
n_2 <- 27
mean_1 <- 3.64
mean_2 <- 2.79
s_1 <- 1.67
s_2 <- 1.5

# 3b
tsum.test(
    mean.x = mean_1, mean.y = mean_2, 
    n.x = n_1, n.y = n_2, 
    s.x = s_1, s.y = s_2,
    alternative="two.side",
    var.equal = TRUE, 
    conf.level = 0.95
)

# 3c
library(mosaic)
plotDist(dist = 't', df = 2, col = "blue")

# 3d
p_l <- qt(p = 0.025, df = 2, lower.tail = TRUE)
p_r <- qt(p = 0.025, df = 2, lower.tail = FALSE)
print(paste("nilai kritikal kiri: ", p_l)) 
print(paste("nilai kritikal kanan: ", p_r))

# ! ------------ NO 4 --------------- !

# Soal 4
data <- read.csv("GTI.csv")

# 4a
library(ggplot2)

ggplot(data, aes(x = Glass, y = Light, color = factor(Temp))) +
  geom_point() +
  labs(x = "Glass", y = "Light", color = "Temperature") +
  ggtitle("Pengaruh Suhu dan Jenis Kaca pada Keluaran Cahaya") +
  theme_minimal()

# 4b
model <- aov(Light ~ Glass * Temp, data = data)
anova_result <- anova(model)
print(anova_result)

# 4c
summaryBy(
	Light ~ Temp + Glass, 
	data = data, 
	FUN = function(x) c(mean = mean(x), 
	sd = sd(x))
)
