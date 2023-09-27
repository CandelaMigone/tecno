class Puntero {
//puntero es el blob que estamos dectectando convertido en un objeto de fisica 
  float id; //identificador de blob 
  float x;
  float y;

  float diametro;

  FWorld mundo; // puntero al mundo de fisica que está en el main


  FCircle body; //representa al cuerpo dentro del mundo de fisica que se va  amover a partir de un mouse joint

  FMouseJoint mj; //para mover cualquier objeto de manera dinamica en fisica necesito un mouse joint

  Puntero(FWorld _mundo, float _id, float _x, float _y) {
    mundo = _mundo;
    id = _id;
    x = _x;
    y = _y;
    diametro = 80;

    body = new FCircle(diametro);
    body.setPosition(x, y);
    mj = new FMouseJoint(body, x, y); //creamos el mouse joint por el cual se va a mover

    mundo.add(body);
    mundo.add(mj);
  }
 //para moverlo vamos a crear una funcion setTarget
  void setTarget(float nx, float ny) {
    mj.setTarget(nx, ny);
  }

  void setID(float id) {
    this.id = id;
  }
//funcion para cuando no hay blob, el orden es inverso para quitarlo del mundo que para agregarlo
  void borrar() {
    mundo.remove(mj);
    mundo.remove(body);
  }
  
  void dibujar() {
    pushStyle();
    noFill();
    stroke(255, 0, 0);
    rect(body.getX(), body.getY(), diametro, diametro);
    popStyle();
  }
}
