/*---------------------------------
 Name: Lucía Herrera Pin
 Date: Sept 2024
 Tittle:  Play-doh Commuting  
 Description: A single ball begins moving through the screen reaching towards the right frame. Behind it, it leaves a faint trace of see through balls. As soon as it hits the frame, ¡a new ball appears! Everytime one of these new balls 
 joins the canvas, we get to see new sizes and colors (with some of them evenb appearing to have different colored circles in the middle). The trace these shapes leave behind make them start to look more and more like tubes of 
 Play-doh playfully going back and forth through our canvas, as if trying to get from one place to another. Once having reached 100 of these shapes, the quantity remains constant, looping in a "Play-Doh Commuting" visual piece.
  -----------------------------------*/

/*
Primero creamos dos arrays para las bolas, uno principal y uno temporal. El array temporal almacena las bolas que van apareciendo durante el ciclo de draw(). Cuando este ciclo termina, todos los elementos almacenados en nuevasBolas
(array temporal), pasan a almacenarse en bolas (array principal). Así, el array temporal se vacía y vuelve a empezar el proceso. 

Asimismo, especificamos el número máximo de bolas que queremos que hayan en la pantalla.
*/

ArrayList<Bola> bolas = new ArrayList<Bola>(); //Array principal
ArrayList <Bola> nuevasBolas = new ArrayList<Bola>(); // Array temporal

int maxBolas = 100; 

// En void setup, establecemos el tamaño del lienzo y el color de fondo, y creamos la primera bola en el array. Esta bola será el detonante del resto de procesos. 

void setup() {
  //size(800, 800);
  fullScreen();
  background(0);
  noStroke();
  bolas.add(new Bola (0, random(height), 5, 1)); // aqui se crea la primera bola
}

// En void draw, dibujamos un rectangulo con opacidad baja para crear el efecto de "dejar rastro", e indicamos que mida lo mismo que el lienzo para que ocupe todo el espacio. 

void draw() {
  fill(0, 10); 
  rect(0, 0, width, height);
  
/*
En el siguiente for loop, le asignamos el nombre "b" a cada uno de los elementos del array principal "bolas" para poder designarles acciones a cada una de ellas. Así, cada bola se mueve y se dibuja en cada fotograma. 

En el loop if, se especifica que mientras que el número de bolas almacenadas en el array principal no supere el número máximo de bolas permitidas (maxBolas), los elementos del array temporal "nuevasBolas" 
seguirán almacenandose en el array principal. Después de pasar los elementos del array temporal al array principal, se vacía el array temporal. 

*/
  for (Bola b : bolas) {
    b.mover();  
    b.dibujar(); 
  }
  
  if (bolas.size() < maxBolas) { 
    bolas.addAll(nuevasBolas);
  }
  
  nuevasBolas.clear();
}
