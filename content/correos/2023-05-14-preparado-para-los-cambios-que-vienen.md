---
title: ¿Preparado para los cambios que vienen?
author: 'Leonardo Hansa'
date: '2023-05-14'
type: "correos"
slug: preparado-para-los-cambios-que-vienen
description: 'Relevancia de escribir código asumiendo que tendrás que cambiarlo. Y para esto te facilitará mucho el tenerlo todo modularizado.'
summary: 'Relevancia de escribir código asumiendo que tendrás que cambiarlo. Y para esto te facilitará mucho el tenerlo todo modularizado.'
tags: ["programming", "software", "architecture", "data"]
---


> Las arquitecturas de software no son como las de puentes y casas. Después de construir un puente, es difícil, si no imposible, cambiar cómo se hizo. El software es distinto, cuando usamos nuestro programa, podemos descubrir cosas sobre nuestras tareas que no sabíamos al diseñarlo. Y, si nos hubiéramos dado cuenta desde el principio, y escogimos una arquitectura adaptable, podríamos cambiar partes sin afectar la experiencia del cliente.


Ayudo en un proyecto que lleva años en marcha.

Lo hago en una consultora que hace análisis estadístico para un gran cliente.

Es una empresa (el cliente) de estas de referencia. Que ha hecho ricos a sus inversores. Cuyos productos están en todo el mundo.

Y es un auténtico desastre.

Es de esas instituciones que llevan a pensar "¿cómo hay gente haciendo las cosas tan mal y ganando tanto dinero?".     ¡

Nos han cambiado el formato de unos datos que nos mandan trimestralmente.

Hace poco más de un año una compañera hizo un proceso para procesar automáticamente esos datos.

Pero como digo, ahora los han cambiado.

¿Consecuencia?

Que el proceso ya no vale...

¿O sí?     

El párrafo que te he compartido al principio del email es de un post del portal All things distributed.

Plantea la importancia de asumir lo siguiente cuando escribes código de programación: vas a tener que cambiarlo en el futuro.     

Todo cambia, todo fluye. Y lo que involucra a la tecnología, especialmente.

Es ingenuo pensar que un código te va a servir siempre.

Escríbelo asumiendo que tendrás que cambiarlo.

¿Cómo te condiciona eso?

Haz módulos, bloques, mini-tareas.      


En el proyecto este del cliente insultante estuvo trabajando una antigua compañera mía.

Y ella no había leído este artículo (porque aún no se había escrito)... pero no le hacía falta.

Hizo justo lo necesario: asumió que habría que volver al código.

Una de las tareas que abarca el código, la lectura de un fichero Excel que el cliente ha cambiado, estaba en un fichero únicamente dedicado a ello.

He tenido que abrir el fichero, cambiar menos de 10 líneas, y ya está.

El resto del código quedaba estable.

Porque era independiente de eso.

**Claudia (mi ex-compi):** muchas gracias, porque me has ahorrado, mazo, mazo de tiempo.


