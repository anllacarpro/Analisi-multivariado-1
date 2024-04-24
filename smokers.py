import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Cargar datos desde el archivo CSV
data = pd.read_csv("./SmokeBan.csv")

# Mostrar las primeras filas del DataFrame para entender la estructura de los datos
print(data.head())

# Resumen estadístico de las variables numéricas
print(data.describe())

# Contar los valores únicos en las variables categóricas
print(data['gender'].value_counts())

# Visualizar la distribución de la variable 'age'
sns.histplot(data=data, x='age', bins=20)
plt.title('Distribución de Edad')
plt.xlabel('Edad')
plt.ylabel('Frecuencia')
plt.show()

# Visualizar la relación entre 'age' y 'smoker'
sns.boxplot(data=data, x='smoker', y='age')
plt.title('Relación entre Fumadores y Edad')
plt.xlabel('Fumador')
plt.ylabel('Edad')
plt.show()

# Visualizar la relación entre 'education' y 'smoker' con un gráfico de barras
sns.countplot(data=data, x='education', hue='smoker')
plt.title('Relación entre Educación y Fumador')
plt.xlabel('Nivel de Educación')
plt.ylabel('Conteo')
plt.show()

# Visualizar la relación entre 'gender' y 'smoker' con un gráfico de barras
sns.countplot(data=data, x='gender', hue='smoker')
plt.title('Relación entre Género y Fumador')
plt.xlabel('Género')
plt.ylabel('Conteo')
plt.show()

# Visualizar la relacion entre 'hispanic' y 'smoker' con un gráfico de barras
sns.countplot(data=data, x='hispanic', hue='smoker')
plt.title('Relación entre Hispanos y Fumador')
plt.xlabel('Hispano')
plt.ylabel('Conteo')
plt.show()
