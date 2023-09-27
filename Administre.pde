class Administrador {

  ArrayList <Puntero> punteros;

  FWorld mundo; // puntero al mundo en el main


  Administrador(FWorld _mundo) {
    punteros = new ArrayList<Puntero>();

    mundo = _mundo;
  }
//le vamos a pasar el blob a crear puntero 
  void crearPuntero(Blob b) {

    Puntero p = new Puntero(mundo, b.id, b.centroidX * width, b.centroidY * height);
    punteros.add(p);
  }
// cuando un puntero se va  (o blob) lo borramos 
  void removerPuntero(Blob b) {
    for (int i= punteros.size()-1; i>=0; i--) {

      Puntero p = punteros.get(i);

      if (p.id == b.id) {
        p.borrar();  
        punteros.remove(i);
        break;
      }
    }
  }
//el momento que se mueva se actualiza el blob, si el blob se esta moviendo coincide con algguno de mis punteeros le digo que lo siga
  void actualizarPuntero(Blob b) {
    for (Puntero p : punteros) {
      if (p.id == b.id) {
        p.setTarget(b.centroidX * width, b.centroidY * height);
        break;
      }
    }
  }

  void dibujar() {
    for (Puntero p : punteros) {
      p.dibujar();
    }
  }
}
