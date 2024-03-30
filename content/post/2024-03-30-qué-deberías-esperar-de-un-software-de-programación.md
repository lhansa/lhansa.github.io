---
title: Qué deberías esperar de un software de programación
author: ''
date: '2024-03-30'
slug: que-deberias-esperar-de-un-software-de-programacion
categories: []
tags: []
---


## Introducción: La importancia de elegir el software de programación adecuado en el análisis de datos

**TL;DR** [Lee la conclusión](#section8)

Mira. Muchas personas piensan que programar consiste en escribir códigos imposibles de entender en una pantalla en negro, con letras pixeladas de color verde. 

Nada más lejos de la realidad. 

Es muy importante que **cuando programes estés cómodo**: que veas bien la pantalla, que te resulte un entorno amigable, que sepas aprovecharlo...

Para eso necesitas elegir bien tu software de programación. Y ten en cuenta que vas a dedicar muchas horas en él. Así que no te preocupes por probar varios antes de casarte con uno.


## Índice

- [Fundamentos de programación para análisis de datos: Lenguajes y herramientas clave](#section1)
- [Python en el análisis de datos: Por qué es la primera opción para muchos](#section2)
- [R para estadística y visualización de datos: Ventajas y recursos](#section3)
- [Excel: El caballo de batalla para análisis de datos básicos](#section4)
- [SQL: El lenguaje esencial para manipulación de datos y bases de datos](#section5)
- [Herramientas de programación visual para no programadores: Tableau y Power BI](#section6)
- [Comparativa: Python vs R vs Excel – ¿Cuál es el mejor para tu proyecto de datos?](#section7)
- [Cómo elegir el software de programación adecuado para tus necesidades en ciencia de datos](#section8)

![Es muy frustrante no sentir cómodo en el entorno de programación que uses.](../../img/estudiante-programacion-frustrado-munch.jpg)

## Fundamentos de programación para análisis de datos: Lenguajes y herramientas clave {#section1}

Si sigues mi [newsletter](https://leonardohansa.com) habrás leído que siempre digo que no te empeñes en aprender herramientas, sino que aprendas fundamentos. Suelo hablar de fundamentos de programación y análisis de datos, para que si cambias de trabajo y usan otras herramientas, el cambio no te resulte muy fuerte. 

Si te limitas a ejecutar códigos sin pensar lo que haces, no sabrás adaptarlos a nuevas herramientas ni interpretar resultados de otros orígenes.

Esto aplica para todas las herramientas de análisis de datos, incluidos los software de programación. 

Pero si estás más perdido que Wally en el mundo de la programación para datos, no worries que te doy contexto aquí. 

Lo primero, ten en cuenta que al hablar de sofware de programación para datos podemos referirnos a muchas cosas. Con mucho abuso de lenguaje, las resumiré en que tienes que elegir el lenguaje que usarás (o herramienta de no programación) y la herramienta que usas para el lenguaje. 

No tiene sentido hablar del entorno de programación sin hablar del lenguaje: ambas cosas van de la mano. Así que te ayudaré un poco a elegir herramienta en función del lenguaje que uses. 

## Python en el análisis de datos: Por qué es la primera opción para muchos {#section2}

Python es el lenguaje más habitual en análisis de datos porque... pues porque es el lenguaje más habitual. Sí, sé que es una pescadilla que se muerde la cola. Pero es que no es el mejor. No hay _mejor_ opción. Hay unas pocas y todas te valen. Python seguramente sea la favorita porque hay muchos más ingenieros en temas de datos que estadísticos, y ellos saben Python. Si fuera al revés, Python no se usaría tanto. 

El caso, que si quieres progresar en el sector seguramente te toque conocer Python en análisis de datos. Tendrás que dominar **librerías de Python** como pandas, sklearn, polars, seaborn, scipy, etc. 

¿Y dónde usas eso?

**Esta es una de las grandes dudas de Python.** Hay mucha gente que hace todo su trabajo en Python en **Jupyter**, que usa [notebooks](https://jupyter.org/), mucho más visuales que los scripts de programación clásicos. Pero tienen muchas críticas: la más objetiva es que no es cómodo para trabajar con Git (porque Git detecta cambios en los resultados de los códigos de un notebook, no solo en el código en sí). Críticas más subjetivas se basan en que incentiva el desordenar códigos (añadiendo bloques de código en mitad del documento) o que están muy limitados en funcionalidades para codificar. 

Aparte, puedes usar notebooks de Jupyter en otras herramientas, como [VScode](https://code.visualstudio.com/), mucho más completo (aunque el notebook tampoco es cómodo para usar con Git). 

VScode es difícil de usar y configurar por lo que **no** te recomiendo empezar por ahí. Jupyter es bastante tedioso de configurar pero lo puedes hacer via Anaconda, gratis para uso particular y pequeños proyectos. 

La ventaja de VSCode es que tiene muchas extensiones que te permiten aumentar su funcionalidad.

## R para estadística y visualización de datos: Ventajas y recursos {#section3}

R es el lenguaje que sería líder en ciencia de datos si en el sector hubiera más estadísticos y menos ingenierios. R es estadística, está orientado a estadística y te va a ser más directo analizar tus datos si necesitas tirar de técnicas basadas en algoritmos que tú no sepas programar, porque ya los habrá programado otro. 

R es muy cómodo para visualización de datos gracias a su librería **ggplot2,** que incluye muchas extensiones para situaciones variadas.

Y tiene una cosa que la hace más recomendable para empezar que Python: RStudio. Rstudio es el software desarrollado por [Posit](https://posit.co), pensado precisamente para analizar datos. Es muy completo y puedes usar scripts o notebooks, como prefieras (tiene incluso una forma de notebooks compatible con Git, Quarto, también disponible ahora en VSCode). 

Para R puedes usar también Jupyter y VSCode pero sinceramente: 

- La extensión de VSCode para R es horrorosa. Te recomiendo que no la uses. 
- Jupyter está muy limitado por lo que he dicho antes. 

Aprovecha el potencial y facilidad de RStudio, que también puedes usar con Python.

## Excel: El caballo de batalla para análisis de datos básicos {#section4}

No uses Excel para análisis de datos. 

Si no te queda más remedio, aprende funciones avanzadas de Excel, como la combinación de `INDEX` y `MATCH`, `OFFSET`, `FILTER`, etc.

Eso por lo menos te ayudará a automatizar operaciones. Pero si dedicas mucho tiempo a Excel para analizar datos, deberías aprender un poco de programación para desatar todo tu potencial.

## SQL: El lenguaje esencial para manipulación de datos y bases de datos {#section5}

El primer día de clase suelo preguntar a mis alumnos que cuál es el lenguaje más importante en ciencia de datos. Todos dicen que Python; la respuesta correcta, SQL. 

SQL es la lingua franca en análisis de datos. Es el verdadero fundamento. Todas las operaciones asociadas a tratar datos tienen una forma de plantearlas en SQL. Si sabes SQL, te será mucho más fácil saltar luego de un lenguaje a otro. 

Cuidado: no digo que tengas que estudiar bases de datos SQL, en el sentido de que las gesiones y esas cosas. Digo que aprendas manipulación de datos con SQL. Cualquier tutorial o curso gratuito, como los de CodeAcademy, te valen. Necesitas saber qué es `select`, `from`, `where`, `group by`, `having` y `join`. Poco más, en serio. Pero apréndelo bien. Luego te dará igual saber Python, R o lo que sea, porque todo te parecerá igual (salvo detalles que aprenderás con la experiencia).

Como software de programación SQL no hay un estándar porque dependerá mucho de la base de datos que uses. Pero por ejemplo VSCode es un universal que te valdrá sea cuál sea el tipo de base de datos (MySQL, PostgreSQL, Oracle, etc), siempre que instales la extensión correspondiente.

## Herramientas de programación visual para no programadores: Tableau y Power BI {#section6}

¿Código? ¿Dónde? Aquí no hacemos eso, amigo. Aquí hacemos arte con datos, y tú también puedes.

Es verdad que aprender programación está muy demandado porque las empresas demandan programar, pero si tu objetivo es sacar aprendizajes de negocio a partir de datos, quizá te apañes con herramientas no-code, de estas de arrastrar cajitas. Las hay muy completas y te pueden servir de sobra para hacer tu trabajo. 

Hay muchas, pero pocas relevantes. Creo que ya nadie usa Qlik, así que nada. No sé si fue Amazon quién compró Tableau, así que servirá para alguno de sus prodctos. 

Pero está claro que el referente en programación visual es Power BI. Power BI es la herramienta de dashboards o tableros de Microsoft. 

Si lo tuyo es el análisis de datos, quizá debas aprender unos básicos de Power BI. Mi recomendación es que no te limites a aprender a poner gráficos monos en tu tablero, sino que aprendas a gestionar los datos detrás del tablero. Es lo que se llama modelo de datos (no tiene nada que ver con un modelo estadístico: consiste en cómo se relacionan las tablas entre sí) y te ayudará a tener un tablero eficiente, que se actualiza rápidamente y resonde bien a las peticiones del usuario.

## Comparativa: Python vs R vs Excel – ¿Cuál es el mejor para tu proyecto de datos? {#section7}

Los que prefieren Python dicen que no hay debate entre usar R ó Python: que uses Python y punto. Los que usamos R decimos que no hay debate porque deberías usar los dos y punto, pero es mentira: deberías usar R. 

El caso, que uses lo que te dé la gana. Intenta pillar unos básicos de ambos y luego te especializas en uno. Si vas a dar un servicio más orientado a la automatización de ajuste de modelos, algo así como una explotación masiva de machine learning, entonces deberías centrarte en Python. 

Si tu trabajo será analizar datos de forma robusta, con fundamento y conocimiento estadístico, profundiza en R. 

Excel deberías conocerlo un poco porque va a ser la lingua franca entre tus clientes (sí, la lingua franca en el sector es SQL, pero entre tus clientes será Excel). 

No deberías usar Excel para un proyecto de datos entero, porque es difícil de dejar una traza de las tareas que se han hecho. Pero ten un mínimo para poder comunicar con Excel cuando estés con personas no técnicas.

## Cómo elegir el software de programación adecuado para tus necesidades en ciencia de datos {#section8}

Para elegir un software de programación céntrate en qué tareas vas a hacer, y luego piensas en el software. Piensa en tus necesidades en análisis de datos.

En este artículo te he dado ideas de qué podrías usar en función de tus necesidades pero la conclusión es que tendrás que probar varios hasta que estés a gusto. Y te centres en ese. 

Y si las cosas modernas y cómodas, como RStudio o VScode, no te gustan, no pasa nada. Puedes usar Notepad++ o VIM, que bien configurados son súper potentes, y además transmitirás una imagen de auténtico friki.



{{< faqpage question1="¿Qué es el software de programación?" answer1="El software de programación es un programa con el que codificas. Puede hacer referencia tanto al software que sirve para que el ordenador entienda el lenguaje que estás usando, como R o Python, como a la herramienta que usas para escribir ese lenguaje, como RStudio o VSCode." question2="¿Qué es el software de programación 5 ejemplos?" answer2="Ejemplos de software de programación son RStudio, VSCode, Spyder, Jupyter o Notepad++" question3="¿Cuáles son los software de programación más utilizados?" answer3="Los lenguajes más usados en datos son Python o R, aunque también se usan C++, Java, etc para tareas concretas. Las herramientas para programar más habituales son RStudio, VSCode, PyCharm, Jupyter, etc." question4="¿Qué software se utiliza para programación?" answer4="Depende del tipo de programación que hagas usarás un software u otro. En datos, los más usados son RStudio, VSCode, Jupyter ó Spyder.">}}




