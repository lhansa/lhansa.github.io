---
title: Habrás oído que todo está en internet
slug: descarga-internet
_build:
    list: never
---

## ¿Pero sabes extraer lo que necesitas de internet?

En mi primer trabajo me metieron en un proyecto en el que no teníamos datos. 

Ninguno. 

Teníamos que descargarlos primero. 

Luego ya los analizaríamos. 

Era un proyecto de fútbol... Mira...

No sé si te gusta el fútbol. A mí no, quizá a ti tampoco. 

Pero es importante que sepas que el proyecto iba de eso, de fútbol.

### Porque en internet hay mazo de datos sobre eso.

El primer paso era hacerse con los datos.

Nosotros no teníamos ni un Excel... pero no pasaba nada. **Todo estaba en internet.**

Mi jefe quería hacer un estudio que abarcara varios años. 10, 15 temporadas...

Y varias ligas. De unos cinco países. España, Francia, Reino Unido, Alemania, Italia...

Un sitio web tenía los datos que queríamos. 

Pero como te habrás dado cuenta, eran muchos datos. 

A ver, nada de big data. No, no...

#### Eran muchos datos para descargarlos a mano. 

Una vez descargados, cabían en un Excel. 

**Pero teníamos que hacernos con ellos primero.**

Un compañero se encargó de ello. 

Era 2015. 

Y fue la primera vez que me hablaron de _web scraping._

{{< rawhtml >}}
</br>
{{< /rawhtml >}}


Es una técnica de descarga de datos independiente del lenguaje que uses. 

Él me lo enseñó en R. 

## Pero sea cual sea el lenguaje que uses, puedes aplicar web scraping. 

Mi compañero hizo un código en menos de 1 hora con el que descargó todos los datos. 

De todas las temporadas. De todos los países. 

Y ya estaba. Lo demás era analizar.

## ¿Qué necesitas para hacer web scraping?

### Primero, unos datos que quieras descargar. 

A ver...

No se trata de que te pongas a descargar páginas web como si no hubiera mañana.

Necesitas una estructura. 

### Tienes que saber para qué quieres esos datos. Porque así en el proceso de descarga das el formato que te venga mejor.

Una vez tienes los datos claros, plantéate en qué lenguaje lo vas a hacer. 

Si estás leyendo esto, es **muy posible que R o Python sean las elecciones adecuadas.**

Y ahora toca elegir la librería. 

{{< rawhtml >}}
</br>
{{< /rawhtml >}}

Una vez leí en Twitter o similar:

> No quieres hacer web scraping. ¡Busca la API escondida!

Sí, `requests` y `httr` sacan de muchos apuros. 

Pero no de todos. 

A veces necesitas algo más. 

#### Necesitas interactuar con la página web.

Ahí, la elección de las librerías es clave. 

Una búsqueda rápida en Google lo único que te dará es un batiburrillo de opciones. 

**Pero sin una idea concreta de por dónde tirar.**

`rvest`, `scrapy`, `bs4`, `selenium`...

Me he visto ahí.

Y cuesta mucho salir de las dudas. 

Pero se sale. 

El método que yo seguí, y que no te recomiendo, es probarlo todo. 

Muchas veces. Distintos enfoques. 

Hasta que consigas lo que quieres. 

### El inconveniente es que pierdes mucho tiempo. 

Así que he preparado algo para que puedas ir directo a lo que necesitas.

## He preparado unos casos de uso sobre web scraping. 

**No es una formación.**

Lo que tengo para ti es un documento, con códigos, con tres ejemplos de uso de _web scraping_ para tres situaciones en las que me resultó útil. 

Más útil que copiar y pegar datos de páginas web. 

### ¿Qué tiene el documento?

**26 páginas** con comentarios sobre los códigos que uso. Explico por qué uso lo que uso. 

Los códigos también están comentados. 

Pero encontrarás matices más detallados en el documento. 

Digo que no es una formación porque

- no hago una introducción de los elementos que uso, 
- ni los voy añadiendo poco a poco, 
- ni hay un hilo de menos dificultad a más dificultad. 

Ahora bien, **incluye soporte.**

O sea, que si compras mis casos de uso, puedes escribirme por correo electrónico para preguntarme sobre ellos. 

- Me puedes preguntar sobre el código. 
- Me puedes preguntar sobre cambios en el código para poder variar el caso de uso. 
- Me puedes preguntar sobre por qué una librería o función y no otra. 

Si necesitas ayuda para aplicar el caso de uso a otro proyecto, te ayudo, pero es un servicio aparte.


#### Son casos de uso de web scraping que te pueden resultar útiles si los quieres usar como referencia. 

O como plantillas para hacer proyectos tuyos. 

## Te cuento los casos de uso

### 1. Productos de Amazon

El primer código sirve para realizar una búsqueda en Amazon de algún artículo: un teclado de ordenador, una crema, un _gadget_ para el iPhone, una prenda de ropa, un juguetito... lo que quieras. 

Y te descarga en una tabla el precio, el link, la valoración y el número de críticas que tiene. 

Me gusta tener a mano el número de críticas de un producto porque así me hago una idea de si lo ha comprado mucha gente. Si dudo entre dos productos, tiendo a comprar el más comprado. 

### 2. Artículos de una revista

El segundo caso surgió por razones personales. Hace años colaboré con una revista y quería descargar los artículos que publiqué. 

El formato final no es muy cómodo, cierto, pero no era mi prioridad. 

Solo quería los textos, por si cerraban la revista. 

### 3. Titulaciones de una universidad

El último caso sirve para descargar los pdf con los programas de las titulaciones de la Universidad Complutense de Madrid. 

El código navega por todas las titulaciones de la UCM y, si hay un pdf con información sobre la titulación, lo descarga en una carpeta. 

Una cosa que falta es hacer un filtro de titulaciones. Por ejemplo, sería fácil añadir la condición de que descargue el pdf solo si la titulación tiene que ver con datos y estadística.

**Como el producto tiene soporte, puedes preguntarme sobre el planteamiento.**

Por cierto, por si te suena, en este último uso selenium. En los otros dos, scrapy y bs4.

{{< rawhtml >}}
</br>
{{< /rawhtml >}}

### Está todo en Python. 

Pero el código te dará ideas suficientes si lo quieres llevar a R. 

La sintaxis de R y Python son muy distintas. 

Pero lo propio de web scraping, su interacción son los elementos web, es común. 

***

Entonces, todo junto: 

- **3 casos de uso** de web scraping. Con Python.  
- Muy **comentados y documentados**, con explicaciones de por qué uso el código que uso.
- Con soporte mío, **para que puedas hacer variaciones.**

## Descarga internet con web scraping: 3 casos de uso

### PVP: 26€ 

[Pago seguro con tarjeta.](https://buy.stripe.com/28o5mUbNA1JhfNSfZ4) 

***

## Preguntas frecuentes

### ¿Qué formato tiene el curso?

No es un curso. Son casos de uso. 

### Vale, vale. ¿Qué formato tienen?

Es **1 fichero pdf de 26 páginas** con las explicaciones. Y **3 scripts de Python** con comentarios. Tienes más de 200 líneas de código.

### Yo no sé Python. ¿Podré aprovecharlo?

Si no sabes nada de Python, no. Tengo una [formación sobre iniciación a Python para datos.](https://leonardohansa.com/muerde-a-la-serpiente/) 

Pero esto es otra cosa. Necesitas saber abrir un script, ejecutarlo, instalar librerías...

Aprende primero eso. Y luego vuelves aquí. 

### Ya intenté web scraping una vez y no me aclaraba

Las personas que más aprovechan este tipo de productos son precisamente quienes ya se han peleado con _web scraping_ pero necesitan un apoyo más. 

Los casos de uso te servirán como ejemplos completos, con varios elementos de web scraping, que luego podrás llevarte a cosas tuyas. 

En un tutorial o en una formación muy breve te enseñan algunos de las herramientas de web scraping pero no te enseñan a unirlas. A hacer que trabajen todas juntas. 

En estos casos de uso verás justo eso: tres ejemplos completos, para que veas cómo puedes unir todas las piezas.

### Es muy barato. ¿Por qué?

Porque no es una formación. 

Son casos que he hecho y creo que te pueden ser útiles. Están bien documentados pero no hay un hilo conductor en el que intente darte todo mascadito. 

Tendrás el material todo junto. Y si quieres ir de poco tendrás que toquetear tú el código para ver qué es la estructura general, qué elementos puedes cambiar libremente, qué elementos son imprescindibles. 

Tampoco cubro todas las casuísticas. 

### ¿Es solo un caso de uso? Entonces es muy caro. 

Pues no lo compres. 

Hay muchos tutoriales. 

Yo invertí tiempo en aprender web scraping. 

Te ofrezco que inviertas dinero. 

Pero si crees que es muy caro, invierte tiempo.

### Qué necesito tener instalado para que funcione. 

Python. Las librerías que necesitas son bs4, scrapy y selenium. Y pandas y requests, pero eso seguro que lo tienes. 

Y Firefox. Uso Firefox para el caso 3. 

#### Yo uso Chrome. ¿No vale?

El código está pensado para usar Firefox. La tarea se puede hacer con (casi) cualquier navegador, pero el código va a usar Firefox para navegar por la web y descargar los ficheros pdf. 

Habrá que cambiar algunas cosas del código para que funcione con Chrome. Con el soporte que tienes incluido, te puedo mandar algo de documentación para qué sepas por dónde van los tiros. 

Pero el soporte no incluye reescribir el código para Chrome.


## Descarga internet con web scraping: 3 casos de uso

### PVP: 26€ 

[Pago seguro con tarjeta.](https://buy.stripe.com/28o5mUbNA1JhfNSfZ4) 

***




Por cierto, por si aún no te has suscrito, en mi newsletter contaré más detalles sobre el curso (y más cosas sobre programación que te interesarán si te estás planteando meterte en la formación):

