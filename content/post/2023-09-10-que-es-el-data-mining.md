---
title: Qué es el data mining y cómo funciona
author: 'Leonardo Hansa'
date: '2023-09-10'
slug: que-es-el-data-mining-y-como-funciona
description: "¿Confundido con los términos 'data mining', 'data science' y 'machine learning'? En este post, aclaramos las diferencias, las aplicaciones y la relevancia de la minería de datos en la actualidad. Descubre qué necesitas estudiar para adentrarte en este campo y qué herramientas son esenciales para llevar a cabo la minería de datos eficazmente."
summary: "¿Confundido con los términos 'data mining', 'data science' y 'machine learning'? En este post, aclaramos las diferencias, las aplicaciones y la relevancia de la minería de datos en la actualidad. Descubre qué necesitas estudiar para adentrarte en este campo y qué herramientas son esenciales para llevar a cabo la minería de datos eficazmente."
tags: [data-mining, data]
type: "post"
---

Con los años han surgido muchos nombres para llamar a la misma cosa. Y es importante aclarar algunos conceptos, aunque no se usen mucho, porque las pocas veces que se usan se dicen solo tonterías. 

En este post te cuento en qué consiste eso que algunos siguen llamando _data mining,_ con conceptos incluidos.

## Índice

- [Introducción. Qué es lo primero que tienes que saber sobre data mining](#section1)
- [Historia y evolución de la minería de datos](#section2)
- [Principios Básicos de la Minería de Datos](#section3)
- [Proceso de data mining](#section4)
- [Herramientas y Software para Data Mining](#section5)
- [Para qué sirve la minería de datos. Aplicaciones del data mining](#section6)
- [Beneficios y Desafíos de la Minería de Datos](#section7)
- [En qué se diferencia la ciencia de datos y la minería de datos](#section8)
- [Futuro de la Minería de Datos](#section9)
- [Recursos y formación en data mining. Qué tengo que estudiar para hacer data mining](#section10)
- [Conclusión](#section11)

## Introducción. Qué es lo primero que tienes que saber sobre data mining {#section1}

Lo primero que tienes que saber sobre data mining es que nadie lo llama así. 

Di estadística. Punto. 

Eso, si quieres decir la verdad. 

Si quieres encontrar trabajo, es mejor que digas _data science_ o _machine learning._

Pero vamos, que es estadística.

Puedes ver a la minería de datos como un subconjunto de la estadística, una rama de la estadística: nada de una rama de las ciencias de la computación. 

Aproximadamente, una definición de data mining diría que es una rama de la estadística que busca patrones en los datos a partir de modelos. Los modelos son ecuaciones matemáticas que obtienen un número a partir de una expresión. Esta expresión está basada en los datos que tengas.

## Historia y Evolución del Data Mining {#section2}

Pues dado que el data mining es estadística, podríamos decir que el origen del data mining es de hace mucho. Aunque no toda la estadística es data mining. 

Creo que lo más antiguo que yo he utilizado de _data mining_ es la regresión lineal, que tal y como la entendemos se [originó](https://es.wikipedia.org/wiki/Regresi%C3%B3n_lineal) a comienzos del siglo XIX.

Por aquella época los cálculos se hacían, como te puedes imaginar, a mano. La llegada de los ordenadores, bien avanzado el siglo XX, evolucionó el data mining gracias a metodologías como las que te enseñarán hoy en el día en el _bootcamp_ de ciencia de datos que hagas: _random forest_, XGBoost, etc.

## Principios Básicos de la Minería de Datos {#section3}

El principio fundamental del data mining es que tu análisis sea relevante para negocio. Si no lo es, olvídate y ponte a hacer otra cosa.

El fundamento de data mining es el negocio. A ver, no digo que solo sirva para empresas: me refiero a su aplicación práctica. **No tiene sentido que analices** por amor al arte. Está bien para estudiar, sí, pero nadie te va a pagar por ello. 

Las técnicas de data mining que aprendas tienes que saber interpretarlas para que sean útiles para negocio. 

Estas técnicas las puedes agrupar según su utilidad. 

- Por ejemplo, algo muy habitual, aunque quizá poco válido, es etiquetar a cada observación en un grupo. Así tendrás etiquetadas a distintas observaciones en un mismo grupo y esos significará que se parecen, de acuerdo a sus variables. Eso es **segmentación** o **clustering.** Para eso, todos seguimos haciendo kmeans, aunque si estamos muy motivados probamos otras cosas teóricamente más interesantes, aunque en la práctica no dan mejores resultados, como Clara (más robusto), DBSCAN (útil para clusters con formas complejas), borrosos (para etiquetar con varias etiquetas a la vez y probabilidades...)
- Quizá quieras predecir las ventas de un negocio, o saber cuál es el valor esperado de un nuevo cliente. Esos son análisis de **regresíón** y puedes hacer una regresión lineal o modelos más complejos, como basados en árboles (random forest, xgboost, un árbol sin más, cosa que no hace nadie) o incluso una red neuronal.
- Otro caso clásico es clasificar. Lo más habitual es un caso binario, sí o no, aunque también puede ser en varias categorías. Hay tipos de regresión que también hacen esto, aunque lo normal es que veas a gente tirar de nuevo de modelos basados en árboles o redes.

Esas son algunas técnicas de data mining que deben sonarte para modelado. Creo que el data mining siempre incluye modelado (si no, sería un análisis).


## Proceso de data mining {#section4}

En la Wikipedia tienes una explicación de cómo es un proceso de data mining, que a mí me suena a refrito irreal. 

- En un proceso de data mining, o proyecto, lo **primero** que tienes que hacer es entender qué se busca analizar. 
  + De todas las etapas del data mining, entender tu función en la primera. Cuidado, no digo que esperes que alguien te diga qué modelo aplicar y sobre qué datos. Lo que necesitas es entender qué va a hacer negocio con tu análisis. Con _negocio_ me refiero a la empresa, el departamento, el cliente para el que trabajes. 
- El **segundo paso** del data mining es entender qué datos tienes para responder esa pregunta de negocio. A ver, no digo que los explores, que hagas un EDA como dicen ahora. No. Digo que exijas saber qué datos hay. 
  + Si esos dos pasos se hicieran bien, el resto de pasos del data mining irían solos. 
- Sí, toca estudiar los **datos**, analizarlos, validarlos, ¿hay valores faltantes? ¿hay duplicados sin sentido?, ¿las variables aportan información?, ¿hay variabilidad?
- Y **después** te toca elegir qué modelo haces (más sobre esto, [arriba](#section3)). Después de ajustar el modelo (te puede llevar días), tendrás que explorar en detalle los resultados desde un punto de vista de negocio y presentarlos. 

No es poco, ya. Pero los dos primeros puntos son los pasos más importantes del data mining.

## Herramientas y Software para Data Mining {#section5}

Un principio del data mining debería ser que la herramienta da igual. Pero no, últimamente todos se decantan por lo mismo. 

### Python

A ver, vuelvo a lo de arriba: ya nadie hace _data mining,_ todo el mundo hace data science o data analytics, o business intelligence... cosas así. El nombre ha cambiado. 

Y además el campo se ha llenado de informáticos e ingenieros. Nada contra ellos, pero ellos vienen del mundo de la computación, no de la estadística, así que usan software para data mining que les suene, y no quieren aprender herramientas orientadas a estadística. 

Por eso se usa tanto Python en este campo. Si tuvieras que empezar desde cero, y tu objetivo es encontrar curro, [aprende Python.](https://leonardohansa.com/post/cuanto-se-tarda-en-aprender-python/)

### R

R no lo veas solo como un lenguaje de programación, sino como un software para estadística, un software para data mining. 

Es un entorno de trabajo. Si te centras en usarlo con RStudio, casi ni tendrás que salir de ahí. 

Si no fuera porque el mercado está copado de ingenieros, R sería la mejor opción para data mining porque está pensado justo para eso.

### SAS

Es caro. Hay empresas que lo siguen usando porque no se atreven a mover sus ecosistemas monstruosos a Python o R. Huye de esas empresas. 

### SPSS, Stata, etc

Estos programas para data mining se siguen enseñando en las universidades porque los profesores no conocen otra cosa. Pero solo los usan esos profesores, así que no te servirá de nada aprenderlos.

## Para qué sirve la minería de datos. Aplicaciones del data mining {#section6}

La minería de datos te servirá para encontrar relaciones entre tus datos. 

Esas relaciones sirven para explicar unas variables en función de otras. Concretamente, cuantificas el efecto de una variable frente a otra. 

Esto lo puedes traducir en aplicaciones concretas del data mining, desde un punto de vista de negocio.

Por ejemplo, ¿en cuánto aumenta la probilidad de tener cáncer de pulmón si una persona es fumadora frente a otra que no lo es? ¿O cuál es el valor esperado de este cliente? ¿O cuánta hipoteca estoy como banco dispuesto a prestar a este potencial cliente?

Eso son ejemplos de data mining, ejemplos de proyectos que podrías resolver con las técnicas de data mining de las que estoy hablando.

Como te puedes hacer idea, hay usos del data mining tanto en negocios como en sectores más científicos. 

## Beneficios y Desafíos de la Minería de Datos {#section7}

Los beneficios del data mining son, principalmente, que podrás encontrar patrones en tus datos que no podrás encontrar de otra forma. 

Sí, la ciencia de datos hace eso, pero podrías ver el data mining como una parte de la data science: la parte de modelar.

Los desafíos son la calidad de los datos. Si tus datos son malos, tu data mining también lo será. Y además, cuando empiezas un proyecto, es posible que tu cliente te diga que los datos están muy bien pero sea mentira. Y te des cuenta tarde. Luego, a saber cómo te organizas. 

Con la calidad de los datos no me refiero a conceptos técnicos de data science como el **data quality**, sino a cosas básicas como que los datos no estén en una hoja de papel (a mí me pasó).


## En qué se diferencia la ciencia de datos y la minería de datos {#section8}

Hasta donde yo sé, en nada. 

Se dice que un científico de datos debe ser un buen programador, un buen matemático y un analista de negocio. 

De un minero de datos no se dice nada. Sin más. Es que ya nadie usa ese término. Es como antiguo.

Lo importante es que todos ellos, sea en la actualidad o sea hace 30 años, usan estadística para responder a las preguntas de negocio. 

Y usan un ordenador para ejecutar esa estadística (porque a mano no se puede hacer).

Sí he sugerido antes que el data mining se puede ver como una subsección de la ciencia de datos, pero es solo una opinión mía. No hay claras diferencias entre el data mining y data science porque lo primero ya no se usa. 

Si buscas trabajo, fórmate en lo segundo.

## Futuro de la Minería de Datos {#section9}

No creo que haya un futuro del data mining. Las tendencias en datos están ligadas al machine learning, la inteligencia artificial, la ciencia de datos... ya nadie habla de minería de datos. 

Eso no significa que lo que aprendas de data mining no te sirva. En cierto modo, a un científico de datos le pagan por lo que sabe hacer de data mining, aunque en la práctica lo que hace principalmente es procesar datos.


Los avances en data mining vienen en el campo del machine learning y la inteligencia artificial. Así que, si por cualquier cosa vives en el pasado y te ha llamado la atención la mineria de datos, estudia estadística y a correr.

## Recursos y formación en data mining. ¿Qué tengo que estudiar para hacer data mining? {#section10}

Para saber qué estudiar si te quieres dedicar al _data mining_ te recomiendo que leas [este otro post](https://leonardohansa.com/post/que-es-el-business-intelligence/) en el que te hablo de _business intelligence_. No es lo mismo pero ahí hago un resumen de perfiles en el mundo de datos y menciono esto. 

El resumen es que lo normal es estudiar matemáticas, informática, estadística o alguna ingeniería, pero hay gente muy buena que viene de economía, administración y dirección de empresas y otras áreas más vinculadas a negocio, y luego han hecho un posgrado sobre _data mining_. 

Otra opción es que te formes por tu cuenta, con cursos de data mining y vayas ganando experiencia trabajando como analista de datos y te vayas empapando de lo que hacen tus compañeros más orientados a la ciencia de datos.

En cualquier caso, si tu prioridad es la formación en data mining, céntrate en estudiar ciencia de datos que es como se llama ahora.

## Conclusión {#section11}

En este texto te he puesto sobre la mesa el mejor resumen de data mining que verás por ahí, principalmente porque ya nadie habla de eso. 

Esa debería ser la conclusión: que ya nadie dice data mining y tendrás que saber si lo que te interesa es lo que llaman data science o data analysis. 

Y sobre todo, estudia **estadística.** No te líes con la locura de todos de la inteligencia artificial generativa.

{{< faqpage question1="¿Qué hace la minería de datos?" answer1="La minería de datos da respuestas a problemas de negocio o de ciencia en los que hace falta estadística para poder entender los datos y las relaciones entre las variables. Normalmente construye modelos con capacidad predictora." question2="¿Qué es el data mining y cuáles son sus principales características?" answer2="El data mining es un conjunto de técnicas estadísticas que permiten ajustar modelos a un conjunto de datos para poder lanzar predicciones sobre ellos. Sus características vienen dadas por conceptos estadísticos y las necesidades del software que se utilice." question3="¿Cómo se hace el data mining?" answer3="Si bien necesitas una buena base estadística para hacer data mining, es imprescindible un mínimo de potencia computacional. No hace falta ser programador, aunque saber un poco de ayudará a usar R y Python (herramientas gratuitas y muy completas). Si no sabes programar, puedes usar SPSS, SAS, Orange Data Mining... aunque todo ello es software propietario y caro." question4="¿Cuál es la diferencia entre big data y data mining?" answer4="El data mining hace referencia al conjunto de técnicas estadísticas para ajustar los modelos predictivos. Con Big Data se suele hacer referencia a las técnicas computacionales que necesitas para tratar datos de cierto volumen o cierta complejidad. Si estás haciendo data mining con un volumen de datos muy grande, es posible que necesites herramientas de Big Data para aplicar la estadística a todos esos datos (como Spark) pero las técnicas estadísticas no cambian: el Big Data solo hace que la computación que hay detrás sea diferente, pero como minero de datos no deberías preocuparte tanto por eso. Eso lo aprenderás igual que aprendes un idioma: lo importante es que tengas claros los fundamentos estadísticos." >}}

