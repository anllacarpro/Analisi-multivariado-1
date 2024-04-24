import pandas as pd
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
plt.hist(data['age'], bins=20)
plt.title('Distribución de Edad')
plt.xlabel('Edad')
plt.ylabel('Frecuencia')
plt.show(block=False)

# Visualizar la relación entre 'age' y 'smoker'
plt.boxplot([data[data['smoker'] == 'yes']['age'], data[data['smoker']
            == 'no']['age']], labels=['Fumador', 'No Fumador'])
plt.title('Relación entre Fumadores y Edad')
plt.xlabel('Fumador')
plt.ylabel('Edad')
plt.show(block=False)

# Visualizar la relación entre 'education' y 'smoker' con un gráfico de barras
education_counts = data.groupby(['education', 'smoker']).size().unstack()
education_counts.plot(kind='bar', stacked=True)
plt.title('Relación entre Educación y Fumador')
plt.xlabel('Nivel de Educación')
plt.ylabel('Conteo')
plt.show(block=False)

# Visualizar la relación entre 'gender' y 'smoker' con un gráfico de barras
gender_counts = data.groupby(['gender', 'smoker']).size().unstack()
gender_counts.plot(kind='bar', stacked=True)
plt.title('Relación entre Género y Fumador')
plt.xlabel('Género')
plt.ylabel('Conteo')
plt.show(block=False)

# Visualizar la relación entre 'hispanic' y 'smoker' con un gráfico de barras
hispanic_counts = data.groupby(['hispanic', 'smoker']).size().unstack()
hispanic_counts.plot(kind='bar', stacked=True)
plt.title('Relación entre Hispanos y Fumador')
plt.xlabel('Hispano')
plt.ylabel('Conteo')
plt.show(block=False)

plt.show()  # Mostrar todas las visualizaciones juntas
