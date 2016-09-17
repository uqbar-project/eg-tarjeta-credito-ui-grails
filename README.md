# Clientes de tarjeta de crédito - Grails con decorators en Scala

## Explicación

Este ejemplo permite mostrar la integración entre Grails y Scala, implementando el conocido ejercicio didáctico
de los clientes de una tarjeta de crédito, en la solución con el Decorator Pattern. 

## Consideraciones

* [Instalar el plugin de Xtend](http://uqbar-wiki.org/index.php?title=Integraci%C3%B3n_Grails_con_Xtend)
* El objeto de dominio está en Xtend
* También el repositorio (objeto de acceso a datos)
* Los controllers y las vistas son propias de Grails

## Proyecto de dominio
Tenés que tener instalado Maven, Scala y Grails. Descargate el proyecto de github e instalalo localmente. En un Eclipse tenés que hacer Run > Maven Install, o bien desde un Git Bash en Windows o una línea de comandos Linux/Mac:

```bash
$ git clone https://github.com/uqbar-project/eg-tarjeta-credito-scala
$ git checkout decorator
$ mvn clean install
```

## Versión del proyecto de Grails

* Grails 2.4.2
* en un entorno GGTS 3.6.0
* con Twitter Boostrap 3.2.0

## Características salientes

* Los objetos de dominio Cliente Posta y sus decoradores están escritos en Scala. 
 * Cuando no se puede comprar por exceder el saldo o por controles de la modalidad "compra segura", se tira una excepción. 
 * El Decorator Safe Shop cambia el monto de crédito al monto máximo de compra que tiene definido. 
 * Se redefinió el método nombre para fines didácticos, indicando qué decoraciones tiene. 
* El home/repo/DAO mantiene el estado de la app conociendo objetos cliente posta y decorados sin importar cuáles son. 
 * Pero para identificarlos en forma unívoca, el Home le agrega un identificador, formando un mapa de clientes: la clave es el id, el valor es el objeto cliente de Scala.
* La app hace la búsqueda y permite llamar a un popup modal de compra para cada cliente. 
 * Para eso necesita pasarle al formulario el identificador del cliente y el nombre (para mostrarlo en el título). 
 * El formulario modal tiene validaciones, para mostrarlas sin salir se hace una llamada remota (vía ajax) a un método comprar del ClienteController. 
 * En el comprar se capturan las excepciones que tira el negocio o bien las que surgen al convertir el monto a un número y en lugar de volver a cargar toda la pantalla, se actualiza un componente (div) que sólo contiene los mensajes de error / ok.
* Como muchas otras ventanas podrían querer compartir el comportamiento, el div no está dentro del mismo formulario sino que está en un template (componente visual separado que puede ser reutilizado cada vez que haya una llamada remota de validación).

## Arquitectura propuesta

![Diagrama general de la arquitectura propuesta](docs/Arquitectura%20general%20Clientes%20TC%20scala.jpg)
