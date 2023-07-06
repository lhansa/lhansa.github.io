---
title: Vale, esta IA sí te puede quitar el trabajo
author: ''
date: '2023-07-06'
slug: vale-esta-ia-si-te-puede-quitar-el-trabajo
categories: []
tags:
  - ia
  - trabajo
  - programación
  - python
  - pandas
---


El finde leí sobre una chica, a la que llamaré B., que se había comprado un coche de 30.000 euros.

En el concesionario le ofrecieron financiación. La propuesta era un 17% TAE, que se le quedaba en unas mensualidades de 350€.

B. pensó que 350€ era algo aceptable en su economía mensual.

Se lo podía permitir.

Si sabes qué es el TAE, no necesito aclararte mucho más. Si no lo sabes, puede que hayas pensado "¿y durante cuánto tiempo tiene B. que pagar ese dinero?".

No sé si B. lo pensó, o si también le pareció bien, pero no se puso a multiplicar.

**Pero a B. el coche de 30 mil euros le salió por 40 mil y pico.**

Poca broma.

Puedo entender que B. no supiera qué es el TAE (tristemente, no la suficiente gente lo sabe), ¿pero que no se molestara en hacer ese cálculo?

Simplemente, porque le pareció que se lo podía permitir. Le encajaba. **Y no le dio más vueltas.**

No darle más vueltas a un asunto, esa facilidad para dejarse llevar, tiene consecuencias.

Las de B. son 10.000 euros extra que tiene que pagar.

¿Pero qué me dices de quienes no prestan atención al nivel de la tecnología?

Por ejemplo, IA generativa. Las hay que están verdes aún, sí. Pero su evolución sugiere que sus capacidades, dentro de poco, serán de ciencia ficción.

¿Nos las podemos permitir? ¿Te lo puedes permitir?

**¿Eres capaz de conservar tu trabajo pese a tener herramientas así?**

Te traigo un resumen de actualidad en el mundo de los datos. El 4º punto te hará pensarte esa pregunta dos veces.


***


1️⃣ **Si todos los meses, o todas las semanas, o todos los días, repites un análisis, necesitas que tus datos sigan ciertas reglas.**

- Si tu análisis lo haces kilómetros, no vale que de pronto te lo cambien a millas.
- Si lo haces en miles de personas, no vale que de pronto te lo cambien a cientos de miles.
- Si lo haces en euros, no vale que de pronto te lo cambien a dólares.

Revisar que tus datos siguen cierta magnitud, cierta variabilidad y ciertas reglas es un proceso que puedes automatizar. Si necesitas ideas, eso lo suelen llamar monitorización. 

Los sistemas de monitorización buscan garantizar que tus datos, mes tras mes, semana a semana, no hacen cosas raras.

[Deepchecks](https://github.com/deepchecks/deepchecks) es una herramienta open source de monitorización. 

Muy completa, quizá demasiado para que la instales y ya la uses (yo no lo voy a hacer) pero te da ideas de revisiones que deberías aplicar a tus datos si trabajas en proyectos que tengan una frecuencia de actualización. Para ideas de estas, me ha gustado la [documentación.](https://click.mlsend.com/link/c/YT0yMjUyMDIxNzc1NzA3Njc1MjY0JmM9YTJ0OSZlPTAmYj0xMTY4MzQzMzgzJmQ9dTRrMW4xeA==.NrXJEKcvnYs2kIwyZDM3sziy9KmxJSRiWW9UfFcH2mQ)


***


2️⃣ **Con tanta IA se nos olvida que los datos se analizan con estadística**.

Habitualmente, se aplica estadística ejecutando un código (R, Python) y mirando si el p-valor es pequeño. ¿Problema? **Que los conceptos detrás de eso son menos intuitivos que los argumentos de Christopher Nolan. **

El enfoque que me está gustando cada vez más es el bayesiano. Y te traigo [una lectura avanzada sobre estadística bayesiana.](https://click.mlsend.com/link/c/YT0yMjUyMDIxNzc1NzA3Njc1MjY0JmM9YTJ0OSZlPTAmYj0xMTY4MzQzMzg2JmQ9djlkMHkxdg==.ekVg8pNWBpg18zLTzjd13H5Cc6xBdTUSp5x505zdXl0)

¿Por qué comparto contigo si no sé si sabes suficiente estadística bayesiana para seguirla? 

Porque **muestra muchas librerías de R sobre esta rama, y te pueden servir para arrancar:** posterior, tidybayes, bayestestR... (con el potencial de la estadística bayesiana, deberías querer). Ni idea de si hay un equivalente a esto en Python.


***


3️⃣ **¿Por qué las empresas que se dicen data-driven siguen tomando las decisiones con intuición y no con datos?** 

¿Porque el análisis de datos ha fracasado? 

El objetivo del análisis de datos no es solo aplicar alguna técnica estadística a unas tablas. 

[El analista de datos debe estar al corriente de los detalles del negocio al que se dedique y contribuir a la toma de decisiones.](https://click.mlsend.com/link/c/YT0yMjUyMDIxNzc1NzA3Njc1MjY0JmM9YTJ0OSZlPTAmYj0xMTY4MzQzMzkyJmQ9ajRrNmc3eg==.hZzXSKvxEFG9EQ5HGhCM2T-s8ne3xHBlX6yZf-X9oRQ)

**Tiene que asegurarse de que la interpretación de sus análisis es la adecuada.** Y que las decisiones data-driven que se toman son de verdad data-driven, y no caprichos de gerentes que dicen que se apoyan en datos pero luego se inventan las conclusiones.


***

4️⃣ _(Sí, aquí te pongo el link que quizá te quite el trabajo_) **Con ChatGPT he leído a muchos críticos ensalzando los errores que comete la herramienta.**

Lo siento por ellos. 

Ha salido una librería de Python que, con la conexión a OpenAi adecuada, escribe y ejecuta Pandas por ti: PandasAI.

Pandas es la librería de referencia de análisis de datos en Python. SQL aparte, es una lingua franca en tratamiento de datos tabulares.

Y parece que una IA es capaz de programarla y ejecutarla por ti, solo con un par de frases.

[En su GitHub](https://click.mlsend.com/link/c/YT0yMjUyMDIxNzc1NzA3Njc1MjY0JmM9YTJ0OSZlPTAmYj0xMTY4MzQzMzk3JmQ9cTV2OGE1eQ==.uVH8RtgiXP2S60ZP-i-V8_UJ-O50GemFo542eFMUKbY) tienes ejemplos de cómo hace operaciones por columnas, gráficos de una serie temporal, joins de data frames, y cómo saca algunas conclusiones.

PandasAI parece que es muy reciente y esta semana no te quitará el trabajo. Se equivoca aún con frecuencia, sobre todo en gráficos. 

Pero si no eres como los críticos que mencionaba antes, no perderás de vista esta librería. 


***


B. solo se fijó en una parte de la financiación, en los 350 € al mes, y va tener que pagar 40.000 euros por un coche de 30.000.

¿Tú eres de los que solo se fija en las cosas que la IA hace mal?

Para poder usar PandasAI, aún necesita que cambies un poco su código Pandas (a veces) para que funcione (y una API de OpenAI, que cuesta dinero pero me parece asumible). 

Eso sí, de nada te servirá usarla si no sabes cambiar su código. Para cambiar su código necesitarás aprender Pandas. [Lo puedes hacer conmigo.](https://leonardohansa.com/muerde-a-la-serpiente/)

***

