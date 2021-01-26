""" Para crear objetos básicos en JavaScript se puede tener la siguiente
" estructura

let duck = {
  name: 'Aflac',
  numLegs: 2,
};



""" Para aceder a los atributos de un objeto se puede utilizar la notación de
" punto

console.log(duck.name); // This prints 'Aflac' to the console



""" Para definir un método se pueden utilizar las siguientes notaciones

let duck = {
  name: 'Aflac',
  numLegs: 2,
  
  // ES5 2010
  sayName: function(){ return "The name of this duck is " + this.name + "."}
  // ES6 2015
  sayName(){ return `The name of this duck is ${this.name}.`}
};

" La palabra 'this' hace referencia al nombre de la instancia del objeto, ya
" que este puede ser variable.



""" Los 'constructores' son funciones que crean nuevos objetos. Definen
" propiedades y comportamientos que pertenecerán al nuevo objeto.

// ES5 2010
function Bird(name, color) {
  this.name = name;
  this.color = color;
  this.numLegs = 2;
}

// ES6 2015
class Bird {
  constructor(name, color){
    this.name = name;
    this.color = color;
    this.numLegs = 2;
  }
}

" Recordemos en JavaScript no existe el concepto de 'clases'. Aún en ES6 y la
" llegada de la palabra reservada 'class' sigue sin existir como tal.
" JavaScript es un lenguaje 'prototipado'. Aunque uses la nueva sintaxis para
" crear 'clases', estarás creando 'funciones' con un prototipo.



""" Cuando se utiliza un constructor se necesita utilizar la palabra reservada
" 'new', esto le dice a JavaScript que cree una nueva instancia de la clase
" llamada. Sin la palabra reservada 'new' la palabra 'this' dentro del
" constructor no va a apuntar correctamente al objeto creado y dara resultados
" inesperados.

let blueBird = new Bird('Albert', 'blue');

" Ahora todas las propiedades definidas en dentro de 'Bird()' están dentro de
" 'blueBird'

blueBird.name; // 'Albert'
blueBird.color; // 'blue'
blueBird.numLegs; // '2'

" Con la notación de punto podemos cambiar todas las propiedades dentro del
" objeto



""" Cada vez que una función crea un nuevo objeto, el objeto se dice que es una 
" instancia del constructor. JavaScript da una manera conveniente para verificar
" esto con el operador 'instanceof'. 'istanceof' permite comparar un objeto y un
" constructor y retornar 'true' o 'false' basado en si se a o no creado ese
" objeto con el constructor.

let Bird = function(name, color) {
  this.name = name;
  this.color = color;
  this.nameLegs = 2;
}

let crow = new Bird('Alexis', 'black');

corw instanceof Bird; // 'true'



""" Existen dos tipos de propiedades, las propiedades propias y las propiedades
" prototípicas, de las propiedades prototípicas se hablará más adelante. Las
" propiedades propias son aquellas que se declaran dentro del cuerpo del
" constructor.

function Bird(name) {
  this.name = name;
  this.numLegs = 2;
}

" Las propiedades propias del en el constructor son 'name' y 'numLegs'

let duck = new Bird('Donald');

" En este caso 'duck' al ser una instancia de 'Bird' hereda todas las
" propiedades y tiene su propia copia de dichas propiedades. Por ejemplo en el
" siguiente código podemos iterar en todas las propiedades de 'duck' y guardar
" en un array todas aquellas que sean suyas.

let ownProps = [];

for (let property in duck) {
  if(duck.hasOwnProperty(property)){
    ownProps.push(property)
  }
}

console.log(ownProps); // prints ['name', 'numLegs']



""" Las propiedades prototípicas son aquellas que se comparten entre todas las
" instancias creadas con el constructor, se pueden comparar con las
" variables estáticas de los lenguajes orientados a objetos como Java o C++.
" En este caso ya que la propiedad 'numLegs' no cambia podemos hacer esta una
" propiedad prototipo para que cada objeto(instancia) creado con el constructor 
" no tenga su propia cópia de la variable y así se guarde espacio y sea más
" eficiente.

Bird.prototype.numLegs = 2;

console.log(duck.numLegs); // prints 2



""" Podemos mejorar nuestro código anterior para poder iterar entre todas las
" propiedades de un objeto y guardar en un array las propiedades propias y en
" otro las propiedades prototipo.


function Bird(name) {
  this.name = name;  //own property
}

Bird.prototype.numLegs = 2; // prototype property

let duck = new Bird("Donald");


let ownProps = [];
let prototypeProps = [];

for (let property in duck) {
  if(duck.hasOwnProperty(property)) {
    ownProps.push(property);
  } else {
    prototypeProps.push(property);
  }
}

console.log(ownProps); // prints ["name"]
console.log(prototypeProps); // prints ["numLegs"]



""" En el ejercicio anterior declaramos una propiedad prototipo de manera
" manual, esto se puede hacer tedioso si es que las propiedades que declaramos
" son demasiadas, pero hay una manera mejor de declarar dichas propiedades.
" Dado que las propiedades detro de 'prototype' son a su ves objetos se puede
" declarar dichas propiedades dentro de 'prototype' con la notación de objetos
" de JS.
"
" También hay que tomar en cuenta que al declarar manualmente el prototipo de
" un constructor este pierde el constructor, por lo que lo tenemos que
" redeclarar.

Bird.prototype = {
  constructor: Bird, // redeclaramos el constructor
  numLegs: 2,
  
  // ES5
  eat: function(){
    console.log("My name is " + this.name);
  }
  // ES6
  eat(){
    console.log(`My name is ${this.name}`)
  }
};



""" Las propiedades prototipo son heredadas de los constructores que las
" que crean nuevos objetos, esta relación se puede conocer por medio del método
" 'isPrototypeOf([objet])'


function Bird(name) {
  this.name = name;
}

let duck = new Bird("Donald");


Bird.prototype.isPrototypeOf(duck); // returns 'true'



""" Todos los objetos en JavaSript (con unas pocas exepciones) tienen un
" 'prototipo' y también el objeto 'prototype' en si mismo.

function Bird(name) {
  this.name = name;
}
typeof Bird.prototype; // yelds 'object'

" Gracias a que 'prototype' es un objeto, un 'prototype' puede tener su propio
" 'prototype', en este caso el prototipo de 'Bird.prototype' es
" 'Object.prototype'

Object.prototype.isPrototypeOf(Bird.prototype); //returns 'true'

let duck = new Bird("Donald");
duck.hasOwnProperty("name"); // yields 'true'

" The método 'hasOwnProperty' está definído en 'Object.prototype', y puede ser
" accedido desde 'Bird.prototype', que puede ser accedido desde 'duck'. Esto es
" un ejemplo de la cadena de 'prototype'. En este caso 'Bird.prototype' en un
" super tipo de 'duck', mientras que 'duck' es un sub tipo. 'Object' es un
" super tipo de ambos 'Bird' y 'duck'. 'Object' es un super tipo de todos los
" objetos en JavaScript y por eso pueden acceder al método 'hasOwnProperty'



""" La herencia se puede crear de varias maneras, una de ellas que evita
" algunas desventajas es la siguiente


function Animal() { }
Animal.prototype.eat = function() {
  console.log("nom nom nom");
};


let animal = Object.create(Animal.prototype);

" 'Object.create(obj)' crea un nuevo objeto, y pone a las propiedades prototipo
" de 'obj' en el.

animal.eat(); // prints 'nom nom nom'
animal instaceof Animal; // 'true'

" Lo siguiente que se puede hacer es, con este método, agregar los prototpipos
" de un constructor a otro

Bird.prototype = Object.create(Animal.prototype);

let duck = new Bird("Donald");
duck.eat(); // prints 'nom nom nom'

" Cuando un objeto hereda los prototipos de otro objeto también hereda el
" método constructor del super tipo, esto es algo indeseable


function Bird() { }
Bird.prototype = Object.create(Animal.prototype);
let duck = new Bird();
duck.constructor // function Animal(){...}

" Todos las instancias de 'Bird' deberían de mostrar que fueron construidas
" por 'Bird' y no por 'Animal'

Bird.prototype.constructor = Bird;
duck.constructor // function Bird(){...}

" Simplificando todos los pasos sería esto:


function Animal() { } // Definimos el supertipo
Animal.prototype.eat = function() { // Declaramos el prototipo del super tipo
  console.log("nom nom nom");
};
function Bird() { } // Definimos el subtipo
Bird.prototype = Object.create(Animal.prototype); // Declaramos la herencia
Bird.prototype.constructor = Bird; // Redeclaramos el constructor del subtipo



""" Después podemos agregar comportamiento a los objetos de los sub tipos

Bird.prototype.fly = function() {
  console.log("I'm flying!");
}

" Ahora las instancias de Bird tienen los dos métodos que hemos trabajdo

let duck = new Bird();
duck.eat(); // prints 'nom nom nom'
duck.fly(); // prints "I'm flying!"



""" También se puede hacer sobrecarga de propiedades prototpipo


function Animal() { }
Animal.prototype.eat = function() {
  return "nom nom nom";
};
function Bird() { }

// Inherit all methods from Animal
Bird.prototype = Object.create(Animal.prototype);

// Bird.eat() overrides Animal.eat()
Bird.prototype.eat = function() {
  return "peck peck peck";
};

    duck => Is eat() defined here? No.
    Bird => Is eat() defined here? => Yes. Execute it and stop searching.
    Animal => eat() is also defined, but JavaScript stopped searching before 
    reaching this level.
    Object => JavaScript stopped searching before reaching this level.


""" Un mixin permite a un objeto usar una colleción de funciones

let flyMixin = function(obj) {
  obj.fly = function() {
    console.log("Flying, wooosh!");
  }
};


let bird = {
  name: "Donald",
  numLegs: 2
};

let plane = {
  model: "777",
  numPassengers: 524
};

flyMixin(bird);
flyMixin(plane);

bird.fly(); // prints "Flying, wooosh!"
plane.fly(); // prints "Flying, wooosh!"



""" Se puede hacer una variable de un objeto completamente privada de la 
" siguiente manera

function Bird() {
  let hatchedEgg = 10; // private variable

  /* publicly available method that a bird object can use */
  this.getHatchedEggCount = function() { 
    return hatchedEgg;
  };
}
let ducky = new Bird();
ducky.getHatchedEggCount(); // returns 10

" En este contexto la variable 'hatchedEgg' es privada, ya que solo puede ser
" accesible por medio del método 'getHatchedEggCout', esto porque está delarado
" por medio de 'let', por lo que solo puede ser modificado por alguna sentencia
" dentro del mismo 'scope' que la variable a cambiar.



""" Un patrón común para ejecutar una función tan pronto como es declarada es
" patrón 'IIFE' (immediately invoked function expression), se ve de la
" siguiente manera

(function() {
  console.log('Chirp, chirp!');
})();

" Notese que son los últimos dos parentesis al final de la expresión lo que
" hacen que la función sea ejecutada tan pronto como se declara, también hay
" que notar que la función es anónima.

" Una forma en la que se utiliza el patrón 'IIFE' es para crear grupos de
" funcionalidad dentro de un objeto o módulo, por ejemplo tenemos dos 'mixin'

function glideMixin(obj) {
  obj.glide = function() {
    console.log("Gliding on the water");
  };
}
function flyMixin(obj) {
  obj.fly = function() {
    console.log("Flying, wooosh!");
  };
}

" Podemos englobar estos dos 'mixin' en un solo modulo de la siguiente manera


let motionModule = (function () {
  return {
    glideMixin: function(obj) {
      obj.glide = function() {
        console.log("Gliding on the water");
      };
    },
    flyMixin: function(obj) {
      obj.fly = function() {
        console.log("Flying, wooosh!");
      };
    }
  }
})(); // The two parentheses cause the function to be immediately invoked

motionModule.glideMixin(duck);
duck.glide(); // 'Gliding on the water'

