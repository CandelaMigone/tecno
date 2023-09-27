import fisica.*; //<>//

FWorld mundo;

int PUERTO_OSC = 12345; // este es el puerto por donde se comunica con el programa de Matias :S

Receptor receptor; // declarar objeto receptor la clase que va a administrar la  entrada de los mensajes y asignacion de blobs

Administrador admin; 

void setup() {

  size(800, 600);
  
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(0,0);
  setupOSC(PUERTO_OSC); 

  receptor = new Receptor();
  
  admin = new Administrador(mundo);
  
  //tiramos circulos 
  for(int i=0; i<80; i++){
  
    FCircle c = new FCircle(random(20, 50));
    c.setPosition(random (50, width-50), random(50, height-50));
    mundo.add(c);
  }
}

void draw() {
  background(255);  

  receptor.actualizar(mensajes); //  
  //receptor.dibujarBlobs(width, height);


  // Eventos de entrada y salida de blobs
  for (Blob b : receptor.blobs) {

    if (b.entro) {
      admin.crearPuntero(b);
      println("--> entro blob: " + b.id);
    }
    if (b.salio) {
      admin.removerPuntero(b);
      println("<-- salio blob: " + b.id);
    }
    
    admin.actualizarPuntero(b);
  }

  //println("cantidad de blobs: " + receptor.blobs.size());
  
  mundo.step();
  mundo.draw();
}
