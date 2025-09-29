

# Práctica 3 – Introducción al manejo de señales biomédicas: Señal de ECG

---

## 1. Descarga/adquisición de datos

Descargar/adquirir los datos fuente que se utilizarán durante la práctica. Se utilizarán los siguientes:

* **Señal de electrocardiograma (ECG)**. Utilizar una señal de la base de datos que se desee. Por ejemplo:

  * [PhysioNet Database](https://physionet.org/about/database/)

---

## 2. Configuración y despliegue en Matlab

1. Descomprimir los datos en el directorio de trabajo.
2. Ejecutar **Matlab**.
3. En esta parte de la práctica la idea es desplegar y familiarizarse con los diferentes tipos de datos.

Ejemplo de comandos para desplegar la señal de ECG:

```matlab
figure;
load senalECG.mat
t = [0:length(ecgdata)-1]/Fs;
plot(t, ecgdata);
```

---

## 3. Cuantificación de la señal

Escribir una función:

```matlab
function Yout = cuantificador2(Xin, NbitsC,NbitsS)
   p=((2^NbitsS)/(2^NbitsC)) :((2^NbitsS)/(2^NbitsC)):(2^NbitsS);
   Yout = quantiz (Xin,p);
end
```

La función debe tomar como entrada:

* La señal en forma de vector `Xin`.
* El número de bits `Nbits` del cuantificador (es decir, 2^Nbits).

Y debe generar una señal de salida **Yout** cuantificada.

Se deben utilizar y hacer las modificaciones necesarias de la función implementada en la **Práctica 1/Práctica 2**.

---

## 4. Generación y análisis de fragmentos

1. Elegir un fragmento de la señal de entre **2 y 4 segundos** para el análisis.
2. Generar varias versiones de la señal de ECG original usando diferentes valores de `Nbits`.
3. Desplegar de manera simultánea la señal original y las señales cuantificadas (utilizar el comando `subplot`) y comparar los resultados.
4. Explicar cómo afectan los diferentes valores del parámetro `Nbits`.

Elaborar una tabla en la que se especifique:

* La profundidad de bit.
* La calidad mostrada a esa profundidad.
* Las observaciones correspondientes.

Responder: **¿Cuál es la profundidad de bit adecuada para la señal ECG utilizada en esta práctica?**
Depende cual sea nuestro objetivo, si buscamos optimizar al maximo y solo necesitamos distinguir la presencia de pulso y frecuencia cardaica con un bit nos basta, si nos referimos a calidad de la grafica al menos considero que eberian utilizarse 6 bits para poder mostrar con calidad los cambios de voltaje en la bioseñal

---

## 5. Tabla de resultados
<img width="1589" height="881" alt="image" src="https://github.com/user-attachments/assets/0d66765a-6b9b-4cba-aa54-b1d8a34daf3f" />


### Tabla 1. Ejemplo de la tabla a realizar

| Profundidad de bit ó Nbits (niveles de cuantificación) | Calidad (MB/B/R/M/MM) | Observaciones                                                                                                               |
| ------------------------------------------------------ | --------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| 1 (2)                                                  | MM                    | Solo distingue dos niveles (señal arriba/abajo); útil solo como detector de presencia/ausencia de pulso.                    |
| 2 (4)                                                  | MM                    | Muy poca resolución; podría diferenciar cambios bruscos, pero pierde totalmente la morfología del ECG.                      |
| 3 (8)                                                  | M                     | Representación extremadamente limitada; se perciben picos muy básicos, pero la onda P y T se pierden.                       |
| 4 (16)                                                 | M                     | Resolución pobre; podría usarse para detección rítmica básica, no apto para diagnóstico clínico.                            |
| 5 (32)                                                 | R                     | Mejor definición, sirve para estudios de frecuencia cardiaca en dispositivos muy simples.                                   |
| 6 (64)                                                 | R                     | Permite observar picos R con cierta claridad, pero distorsiona ondas pequeñas; aún insuficiente para análisis clínico.      |
| 7 (128)                                                | B                     | Resolución aceptable para monitoreo de ritmo, aunque con pérdida de detalles finos en ondas P y T.                          |
| 8 (256)                                                | B                     | Común en sistemas portátiles; suficiente para monitoreo general, pero con limitaciones en estudios diagnósticos.            |
| 10 (1024)                                              | MB                    | Resolución mucho mayor, permite análisis morfológico de ondas; aplicable en telemedicina y monitoreo hospitalario.          |
| 12 (4096)                                              | MB                    | Estándar en muchos equipos médicos modernos; buena precisión para diagnóstico clínico.                                      |
| 14 (16384)                                             | MB                    | Alta fidelidad, captura detalles muy finos de la señal; útil en investigación y bases de datos ECG.                         |
| 16 (65536)                                             | MB                    | Máxima resolución típica en biomedicina; permite análisis muy detallados, filtrado avanzado e investigación en cardiología. |


