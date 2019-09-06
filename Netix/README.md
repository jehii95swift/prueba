
Readme

1. Describa las capas de la aplicación (por ejemplo capa de persistencia, vistas, red, negocio, etc) ,
qué clases pertenecen a cual  y la responsabilidad de cada clase creada.

Para el proyecto utilicé MVC, ya que es una forma de dividir responsabilidades para un proyecto sencillo como éste.

En este proyecto xcode se utilizan tres capas:

La capa Model, en donde se almacenan datos. En esta capa se encuentran las clases Movie que define los objetos que utilizaremos  y la clase Services que se encarga de traer los objetos, parsearlos y persistirlos.

La capa View es la que se encarga de toda la parte de interfaz de usuario, sus clases son reusables. En esta capa están contenidas las clases OneViewController que es la vista inicial en donde  se muestra y se permite seleccionar la categoria o tipo de show que el usuario desee, tambien buscar una pelicula o show de tv por nombre en el buscador, el collection view permitirá ser seleccionado a su vez, pasara a la celda  SelectCollectionViewCell y este mostrará en detalle las peliculas o tv contenidas  en el view controller DetailMovieViewController.

La capa Controller es la intermediaria entre las capas Model y View y esta encargada  de enviar la información y notificaciones para mantener sincronizadas ambas capas. En este proyecto la clase se llama Controller.

2. En qué consiste el principio de responsabilidad única? Cuál es su propósito?

El principio de responsabilidad única es algo básico en la programación que dice que cada clase, función o bloque de código  debe tener una sola responsabilidad sobre una parte de cada funcionalidad que le demos al codigo. 

El proposito es facilitar la programación, evitar que las responsabilidades se acumulen o se acoplen y evitar que las clases sean sensibles al cambio y que despues no podamos hacer algun cambio sin que este dependa de otro y otro. más bien con el principio de responsabilidad única, el cambio se hace en un solo archivo/función y este es más facil de modificar. 

3. Qué características tiene, según su opinión, un “buen” código o código limpio

Un código limpio es el código que yo o otro programador puede leer entender y modificar sin problema que no gasta lineas de código de mas, en funciones que se pueden simplificar haciendolas más cortas y entendibles, con esto me refiero a un código eficiente un buen código que tiene definidas y declaradas cada clase, cada capa, teniendo en claro el flow de ejecución, la responsabilidad de cada clase, los  motivos de los métodos y de las variables, como tener nombres claros que permiten la buena lectura y entendimiento del código, el código limpio permite que se pueda extender el código sin romper ninguna funcionalidad de la aplicacion, esto tambien lo permite el principio de responsabilidad única.
