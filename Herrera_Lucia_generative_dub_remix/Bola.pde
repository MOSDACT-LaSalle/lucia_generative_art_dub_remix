/*
Aquí creamos la clase Bola con los parámetros que especifican su posición en el eje x y el eje y, la velocidad y dirección de su movimiento, su dimensión y su color. Para los cambios de color, usamos un lerpColor con imputs aleatorios. Asimismo, 
la dimensión va tomando valores entre 10 y 70 para cada bola nueva. 
*/

class Bola {
  float posx;
  float posy;
  float speed;
  int direction;
  float dimension;
  color col; 
 

  Bola(float x, float y, float s, int d) {
    posx = x;
    posy = y;
    speed = random(5,10);
    direction = d;
    dimension = random(10, 70);
    col = lerpColor(color(random(255), random(255), random(255),random(75,255)), 
                    color(random(255), random(255), random(255),random(75,255)), 
                    random(1));
  }
  
  /*
La clase tiene dos métodos: mover() y dibujar(). El primer método especifica que cuando una de las bolas toca los bordes del lienzo, su dirección cambia, su posición en el eje Y varía, y se añade una bola nueva al array temporal. El método dibujar()
se encarga de hacer las elipses y darles color. 
*/

  void mover() {
    if (posx > width || posx < 0) { // Si toca los bordes:
      direction *= -1; // Cambia de dirección
      posy = random(height); // Aparece en una nueva posición Y aleatoria
      nuevasBolas.add(new Bola(0, posy, speed, direction)); // Añade una nueva bola a la lista temporal
    }
    posx += speed * direction; // su posición x se actualiza constantemente de acuerdo a la velocidad y dirección
  }

  void dibujar() {
    fill(col);
    circle(posx, posy+random(-50,50), dimension*random(1,6)); // Se dibuja la bola
    
  }
}
