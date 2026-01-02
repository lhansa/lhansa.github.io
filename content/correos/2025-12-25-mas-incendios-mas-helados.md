---
title: A más incendios, más ventas de helados
author: 'Leonardo Hansa'
date: '2025-12-25'
type: "correos"
slug: mas-incendios-mas-helados
description: 'Los incendios y las ventas de helados están correlacionados, pero los incendios no implican ventas de helados.'
tags: ["stats"]
---

Cuantos más incendios forestales hay, más helados se consumen.

Es más, un modelo de regresión podría decirte en cuánto aumentan tus ventas de helados por cada incendio forestal extra que provocas.

Un modelo de regresión malo, claro.

Tú y yo sabemos que aumentar los incendios forestales no aumenta las ventas de helados.

Pero si a un modelo de regresión le pones esas dos métricas, por su correlación, podrá predecir una bastante bien apoyándose solo en la otra.

Ahora bien, si le añades las temperaturas como variable explicativa, el modelo dejará de usar los incendios como predictor de las ventas, porque las temperaturas ya recogen la información necesaria.

Y así el modelo sabrá que los incendios no causan ventas de helados. Es solo una relación espuria.


***


Si ajustas un modelo sin tener en cuenta la relación causal entre las variables, las predicciones pueden salir bien (sí, en serio), pero te será inútil para cuantificar el efecto de unas acciones sobre el resto de métricas.

Esto es muy importante.

Si tu objetivo es predecir ventas, entonces todo esto te da igual (más o menos).

Pero si lo que quieres es cuantificar el efecto de lo que hace tu departamento, o el de al lado, o la competencia, sobre las ventas, entonces necesitas inferencia causal.

***



Hay tres grandes marcos de inferencia causal (¿o solo dos?). Son diferentes formas de plantear los modelos para cuantificar este efecto.

La duda entre si hay dos o tres la comento porque te traigo dos artículos. En uno dicen que hay tres. En otro, dos.

El de tres es mucho más técnico y formal. Parece redactado por matemáticos.

El de dos es un capítulo de un libro de texto algo técnico también pero mucho más práctico, con códigos y todo. En este, dos de los marcos los unifica en uno solo.

***

Uno de los marcos lo traduzco como el de resultados potenciales. Lo que busca es cuantificar la diferencia entre un individuo que ha recibido un tratamiento y ese mismo individuo como si no lo hubiera recibido.

Esto, aparte de un trabalenguas, es imposible, porque una persona no puede a la vez recibir y no recibir un tratamiento (no puedes en un mismo día provocar y no provocar un incendio para ver si vendes más helados).

Lo que busca el método es cuantificar esa diferencia entre toda la población, contando con que hay individuos parecidos y algunos han recibido el tratamiento y otros no.



El otro marco, el de los modelos causales estructurales, asume cómo se relacionan las variables, cuál impacta en cuál.

Luego el algoritmo que elijas cuantifica ese impacto, pero eres tú, con tu experiencia en el sector, quien decide si una variable (temperatura) impacta en otra (ventas de helados).

Los resultados del modelo de sirven para aceptar o descartar hipótesis.

Tus hipótesis deberían ser razonables si eres un experto en la materia y busca profundizar con datos. Si no sabes nada del tema, esto no es para ti.
