# Cargar datos desde el archivo CSV
library(readr)

# Leer el archivo CSV y asignar los datos a un objeto llamado 'data'
data <- read_csv("C:/Users/carlo/OneDrive - Universidad Peruana Unión/Ciclo VII/Análisis Multivariado/Análisis exploratorio/SmokeBan.csv")

View(data)

# Mostrar las primeras filas del DataFrame para entender la estructura de los datos
print(head(data))

# Resumen estadístico de las variables numéricas
print(summary(data))

# Contar los valores únicos en las variables categóricas
print(table(data$gender))

# Calcular los conteos de cada categoría
counts <- data %>% group_by(ban, smoker) %>% summarise(counts = n())

# Calcular los porcentajes
total <- sum(counts$counts)
counts$percentage <- (counts$counts / total) * 100

# Imprimir los conteos y porcentajes
print(counts)

# Instalar y cargar la biblioteca ggplot2
#install.packages("ggplot2")
library(ggplot2)

# Efecto de las prohibiciones de fumar en el lugar de trabajo en el hábito de fumar de los trabajadores de interiores
ggplot(data, aes(x = ban, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Efecto de las Prohibiciones de Fumar en el Lugar de Trabajo",
       x = "Prohibición de Fumar en el Lugar de Trabajo",
       y = "Conteo")

# Demografía y hábitos de fumar
ggplot(data, aes(x = age, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Hábitos de Fumar por Edad",
       x = "Edad",
       y = "Conteo") +
  facet_wrap(~., scales = "free")

ggplot(data, aes(x = education, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Hábitos de Fumar por Educación",
       x = "Nivel de Educación",
       y = "Conteo") +
  facet_wrap(~., scales = "free")

ggplot(data, aes(x = gender, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Hábitos de Fumar por Género",
       x = "Género",
       y = "Conteo") +
  facet_wrap(~., scales = "free")

ggplot(data, aes(x = hispanic, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Hábitos de Fumar por Origen Étnico",
       x = "Hispano",
       y = "Conteo") +
  facet_wrap(~., scales = "free")

# Impacto del género en el hábito de fumar
ggplot(data, aes(x = gender, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Impacto del Género en el Hábito de Fumar",
       x = "Género",
       y = "Conteo")

# Impacto de la educación en el hábito de fumar
ggplot(data, aes(x = education, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Impacto de la Educación en el Hábito de Fumar",
       x = "Nivel de Educación",
       y = "Conteo")

# Relación entre la educación y el hábito de fumar
ggplot(data, aes(x = education, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Relación entre Educación y Hábito de Fumar",
       x = "Nivel de Educación",
       y = "Conteo")

# Efecto de la edad en el hábito de fumar
ggplot(data, aes(x = age, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Efecto de la Edad en el Hábito de Fumar",
       x = "Edad",
       y = "Conteo") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

# Influencia de la etnia en el hábito de fumar
ggplot(data, aes(x = hispanic, fill = smoker)) +
  geom_bar(position = "dodge") +
  labs(title = "Influencia de la Etnia en el Hábito de Fumar",
       x = "Hispano",
       y = "Conteo")

# Visualizar la relación entre 'age' y 'smoker'
ggplot(data, aes(x = smoker, y = age)) +
  geom_boxplot() +
  labs(title = "Relación entre Fumadores y Edad",
       x = "Fumador",
       y = "Edad")