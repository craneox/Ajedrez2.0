import TUIO.*;

TuioProcessing tuio;

//Declaramos fondo
PImage fondo;

//Declaramos las piezas
Pieza Peones_N[] = new Pieza[8];
Pieza Peones_B[] = new Pieza[8];
Pieza Torres_N[] = new Pieza[2];
Pieza Torres_B[] = new Pieza[2];
Pieza Caballos_N[] = new Pieza[2];
Pieza Caballos_B[] = new Pieza[2];
Pieza Alfiles_N[] = new Pieza[2];
Pieza Alfiles_B[] = new Pieza[2];
Pieza Reyna_N;
Pieza Reyna_B;
Pieza Rey_N;
Pieza Rey_B;

//Declaramos el tiempo de los jugadores;
  boolean partidaActiva = false;
  int Nx;
  int Ny;
  int Bx;
  int By;

//Cargamos la posicion incial de todas las pieza

void setup(){
  size(708, 704);
  createGraphics(708, 704);
  
  tuio = new TuioProcessing(this);
  
  fondo = loadImage("tablero.jpg"); //Asignamos imagen al fondo
}

void draw(){
  background(fondo);
  
  
  
  if(key == 'a' || key == 'A'){
   partidaActiva = true;
   cargarPiezas();
  }
  
}


void cargarPiezas(){
  if(partidaActiva){
    Nx = 55;
    Ny = 145;
    Bx = 55;
    By = 565;
    //peones
    for(int i=0; i<8; i++){
      Peones_N[i] = new Pieza("Peon", loadImage("peon_N.png"), Nx, Ny, 0, 0);
      Peones_B[i] = new Pieza("Peon", loadImage("peon_B.png"), Bx, By, 0, 0);
      image(Peones_N[i].getImagen(), Peones_N[i].getPosicion_x()-40, Peones_N[i].getPosicion_y()-40, 80,80);
      image(Peones_B[i].getImagen(), Peones_B[i].getPosicion_x()-40, Peones_B[i].getPosicion_y()-40, 80,80);
      Nx += 85;
      Bx += 85;
    }
    Nx = 55;
    Ny = 55;
    Bx = 55;  
    By = 650;
    //torres
    for(int i=0; i<2; i++){
      Torres_N[i] = new Pieza("Torre", loadImage("torre_N.png"), Nx, Ny, 0, 0);
      Torres_B[i] = new Pieza("Torre", loadImage("torre_B.png"), Bx, By, 0, 0);
      image(Torres_N[i].getImagen(), Torres_N[i].getPosicion_x()-40, Torres_N[i].getPosicion_y()-40, 80,80);
      image(Torres_B[i].getImagen(), Torres_B[i].getPosicion_x()-40, Torres_B[i].getPosicion_y()-40, 80,80);
      Nx += 595;
      Bx += 595;
    }
    Nx = 140;
    Ny = 55;
    Bx = 140;
    By = 650;
    //Caballos
    for(int i=0; i<2; i++){
      Caballos_N[i] = new Pieza("Caballo", loadImage("caballo_N.png"), Nx, Ny, 0, 0);
      Caballos_B[i] = new Pieza("Caballo", loadImage("caballo_B.png"), Bx, By, 0, 0);
      image(Caballos_N[i].getImagen(), Caballos_N[i].getPosicion_x()-40, Caballos_N[i].getPosicion_y()-40, 80,80);
      image(Caballos_B[i].getImagen(), Caballos_B[i].getPosicion_x()-40, Caballos_B[i].getPosicion_y()-40, 80,80);
      Nx += 425;
      Bx += 425;
    }
    Nx = 225;
    Ny = 55;
    Bx = 225;
    By = 650;
    //Alfiles
    for(int i=0; i<2; i++){
      Alfiles_N[i] = new Pieza("Alfil", loadImage("alfil_N.png"), Nx, Ny, 0, 0);
      Alfiles_B[i] = new Pieza("Alfil", loadImage("alfil_B.png"), Bx, By, 0, 0);
      image(Alfiles_N[i].getImagen(), Alfiles_N[i].getPosicion_x()-40, Alfiles_N[i].getPosicion_y()-40, 80,80);
      image(Alfiles_B[i].getImagen(), Alfiles_B[i].getPosicion_x()-40, Alfiles_B[i].getPosicion_y()-40, 80,80);
      Nx += 255;
      Bx += 255;
    }
    Nx = 310;
    Ny = 55;
    Bx = 310;
    By = 650;
    //Reynas
    Reyna_N = new Pieza("Reyna", loadImage("reyna_N.png"), Nx, Ny, 0, 0);
    Reyna_B = new Pieza("Reyna", loadImage("reyna_B.png"), Bx, By, 0, 0);
    image(Reyna_N.getImagen(), Reyna_N.getPosicion_x()-40, Reyna_N.getPosicion_y()-40, 80,80);
    image(Reyna_B.getImagen(), Reyna_B.getPosicion_x()-40, Reyna_B.getPosicion_y()-40, 80,80);
    
    Nx = 395;
    Ny = 55;
    Bx = 395;
    By = 650;
    //Reyes
    Rey_N = new Pieza("Rey", loadImage("rey_N.png"), Nx, Ny, 0, 0);
    Rey_B = new Pieza("Rey", loadImage("rey_B.png"), Bx, By, 0, 0);  
    image(Rey_N.getImagen(), Rey_N.getPosicion_x()-40, Rey_N.getPosicion_y()-40, 80,80);
    image(Rey_B.getImagen(), Rey_B.getPosicion_x()-40, Rey_B.getPosicion_y()-40, 80,80);
    partidaActiva = false;
  }
}
/////////////////////////////////////

Cuadrante BuscarCuadrante(Pieza pieza){
  Cuadrante cuadrante = new Cuadrante();
  if(pieza.getPosicion_x() <= 95){
    cuadrante.setLetra("A");
  }else{
    if(pieza.getPosicion_x() <= 180){
    cuadrante.setLetra("B");
    }else{
      if(pieza.getPosicion_x() <= 275){
        cuadrante.setLetra("C");
      }else{
        if(pieza.getPosicion_x() <= 355){
          cuadrante.setLetra("D");
        }else{
          if(pieza.getPosicion_x() <= 440){
            cuadrante.setLetra("E");
          }else{
            if(pieza.getPosicion_x() <= 525){
              cuadrante.setLetra("F");
            }else{
              if(pieza.getPosicion_x() <= 610){
                cuadrante.setLetra("G");
              }else{
               if(pieza.getPosicion_x() <= 696){
                  cuadrante.setLetra("H");
                }
              }
            }
          }
        }
      }
    }
  }
  if(pieza.getPosicion_y() <= 95){
    cuadrante.setNumero("8");
  }else{
    if(pieza.getPosicion_y() <= 180){
    cuadrante.setNumero("7");
    }else{
      if(pieza.getPosicion_y() <= 275){
        cuadrante.setNumero("6");
      }else{
        if(pieza.getPosicion_y() <= 355){
          cuadrante.setNumero("5");
        }else{
          if(pieza.getPosicion_y() <= 440){
            cuadrante.setNumero("4");
          }else{
            if(pieza.getPosicion_y() <= 525){
              cuadrante.setNumero("3");
            }else{
              if(pieza.getPosicion_y() <= 610){
                cuadrante.setNumero("2");
              }else{
               if(pieza.getPosicion_y() <= 696){
                  cuadrante.setNumero("1");
                }
              }
            }
          }
        }
      }
    }
  }
  return cuadrante;
}

/////////////////////////////////////
//Parte de Reactivision y fiduciales

void addTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  println("entro " + idObjeto +" en la posicion x="+ objectTuio.getX()+ " y=" + objectTuio.getY());
  
}

void updateTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  
  //Declaramos piezas negras
  //peones
  int peon_Nx1 = Peones_N[0].getPosicion_x();
  int peon_Ny1 = Peones_N[0].getPosicion_y();
  int peon_Nx2 = Peones_N[1].getPosicion_x();
  int peon_Ny2 = Peones_N[1].getPosicion_y();
  int peon_Nx3 = Peones_N[2].getPosicion_x();
  int peon_Ny3 = Peones_N[2].getPosicion_y();
  int peon_Nx4 = Peones_N[3].getPosicion_x();
  int peon_Ny4 = Peones_N[3].getPosicion_y();
  int peon_Nx5 = Peones_N[4].getPosicion_x();
  int peon_Ny5 = Peones_N[4].getPosicion_y();
  int peon_Nx6 = Peones_N[5].getPosicion_x();
  int peon_Ny6 = Peones_N[5].getPosicion_y();
  int peon_Nx7 = Peones_N[6].getPosicion_x();
  int peon_Ny7 = Peones_N[6].getPosicion_y();
  int peon_Nx8 = Peones_N[7].getPosicion_x();
  int peon_Ny8 = Peones_N[7].getPosicion_y();
  //torres
  int torre_Nx1 = Torres_N[0].getPosicion_x();
  int torre_Ny1 = Torres_N[0].getPosicion_y();
  int torre_Nx2 = Torres_N[1].getPosicion_x();
  int torre_Ny2 = Torres_N[1].getPosicion_y();
  //caballos
  int caballo_Nx1 = Caballos_N[0].getPosicion_x();
  int caballo_Ny1 = Caballos_N[0].getPosicion_y();
  int caballo_Nx2 = Caballos_N[1].getPosicion_x();
  int caballo_Ny2 = Caballos_N[1].getPosicion_y();
  //alfiles
  int alfil_Nx1 = Alfiles_N[0].getPosicion_x();
  int alfil_Ny1 = Alfiles_N[0].getPosicion_y();
  int alfil_Nx2 = Alfiles_N[1].getPosicion_x();
  int alfil_Ny2 = Alfiles_N[1].getPosicion_y();
  //reyna
  int reyna_Nx = Reyna_N.getPosicion_x();
  int reyna_Ny = Reyna_N.getPosicion_y();
  //rey
  int rey_Nx = Rey_N.getPosicion_x();
  int rey_Ny = Rey_N.getPosicion_x();
  
  //Declaramos piezas blancas
  //peones
  int peon_Bx1 = Peones_B[0].getPosicion_x();
  int peon_By1 = Peones_B[0].getPosicion_y();
  int peon_Bx2 = Peones_B[1].getPosicion_x();
  int peon_By2 = Peones_B[1].getPosicion_y();
  int peon_Bx3 = Peones_B[2].getPosicion_x();
  int peon_By3 = Peones_B[2].getPosicion_y();
  int peon_Bx4 = Peones_B[3].getPosicion_x();
  int peon_By4 = Peones_B[3].getPosicion_y();
  int peon_Bx5 = Peones_B[4].getPosicion_x();
  int peon_By5 = Peones_B[4].getPosicion_y();
  int peon_Bx6 = Peones_B[5].getPosicion_x();
  int peon_By6 = Peones_B[5].getPosicion_y();
  int peon_Bx7 = Peones_B[6].getPosicion_x();
  int peon_By7 = Peones_B[6].getPosicion_y();
  int peon_Bx8 = Peones_B[7].getPosicion_x();
  int peon_By8 = Peones_B[7].getPosicion_y();
  //torres
  int torre_Bx1 = Torres_B[0].getPosicion_x();
  int torre_By1 = Torres_B[0].getPosicion_y();
  int torre_Bx2 = Torres_B[1].getPosicion_x();
  int torre_By2 = Torres_B[1].getPosicion_y();
  //caballos
  int caballo_Bx1 = Caballos_B[0].getPosicion_x();
  int caballo_By1 = Caballos_B[0].getPosicion_y();
  int caballo_Bx2 = Caballos_B[1].getPosicion_x();
  int caballo_By2 = Caballos_B[1].getPosicion_y();
  //alfiles
  int alfil_Bx1 = Alfiles_B[0].getPosicion_x();
  int alfil_By1 = Alfiles_B[0].getPosicion_y();
  int alfil_Bx2 = Alfiles_B[1].getPosicion_x();
  int alfil_By2 = Alfiles_B[1].getPosicion_y();
  //reyna
  int reyna_Bx = Reyna_B.getPosicion_x();
  int reyna_By = Reyna_B.getPosicion_y();
  //rey
  int rey_Bx = Rey_B.getPosicion_x();
  int rey_By = Rey_B.getPosicion_x();
    
  // ¡¡Si desea conocer la lista de los fiduciales asignados favor de abrir archivo adjunto "Piezas.txt"!!
  
  // Asignacion de fiduciales a las piezas
  if(objectTuio.getSymbolID() ==0){
    rey_Nx = round (objectTuio.getX()*width);
    rey_Ny = round (objectTuio.getY()*width);
  }
  if(objectTuio.getSymbolID() ==1){
    reyna_Nx = round (objectTuio.getX()*width);
    reyna_Ny = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==2){
    alfil_Nx1 = round (objectTuio.getX()*width);
    alfil_Ny1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==3){
    alfil_Nx2 = round (objectTuio.getX()*width);
    alfil_Ny2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==4){
    caballo_Nx1 = round (objectTuio.getX()*width);
    caballo_Ny1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==5){
    caballo_Nx2 = round (objectTuio.getX()*width);
    caballo_Ny2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==6){
    torre_Nx1 = round (objectTuio.getX()*width);
    torre_Ny1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==7){
    torre_Nx2 = round (objectTuio.getX()*width);
    torre_Ny2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==8){
    peon_Nx1 = round (objectTuio.getX()*width);
    peon_Ny1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==9){
    peon_Nx2 = round (objectTuio.getX()*width);
    peon_Ny2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==10){
    peon_Nx3 = round (objectTuio.getX()*width);
    peon_Ny3 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==11){
    peon_Nx4 = round (objectTuio.getX()*width);
    peon_Ny4 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==12){
    peon_Nx5 = round (objectTuio.getX()*width);
    peon_Ny5 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==13){
    peon_Nx6 = round (objectTuio.getX()*width);
    peon_Ny6 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==14){
    peon_Nx7 = round (objectTuio.getX()*width);
    peon_Ny7 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==15){
    peon_Nx8 = round (objectTuio.getX()*width);
    peon_Ny8 = round (objectTuio.getY()*height);
  }
  
  if(objectTuio.getSymbolID() == 16){
    rey_Bx = round (objectTuio.getX()*width);
    rey_By = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==17){
    reyna_Bx = round (objectTuio.getX()*width);
    reyna_By = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==18){
    alfil_Bx1 = round (objectTuio.getX()*width);
    alfil_By1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==19){
    alfil_Bx2 = round (objectTuio.getX()*width);
    alfil_By2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==20){
    caballo_Bx1 = round (objectTuio.getX()*width);
    caballo_By1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==21){
    caballo_Bx2 = round (objectTuio.getX()*width);
    caballo_By2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==22){
    torre_Bx1 = round (objectTuio.getX()*width);
    torre_By1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==23){
    torre_Bx2 = round (objectTuio.getX()*width);
    torre_By2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==24){
    peon_Bx1 = round (objectTuio.getX()*width);
    peon_By1 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==25){
    peon_Bx2 = round (objectTuio.getX()*width);
    peon_By2 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==26){
    peon_Bx3 = round (objectTuio.getX()*width);
    peon_By3 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==27){
    peon_Bx4 = round (objectTuio.getX()*width);
    peon_By4 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==28){
    peon_Bx5 = round (objectTuio.getX()*width);
    peon_By5 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==29){
    peon_Bx6 = round (objectTuio.getX()*width);
    peon_By6 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==30){
    peon_Bx7 = round (objectTuio.getX()*width);
    peon_By7 = round (objectTuio.getY()*height);
  }
  if(objectTuio.getSymbolID() ==31){
    peon_Bx8 = round (objectTuio.getX()*width);
    peon_By8 = round (objectTuio.getY()*height);
  }
  
}

void removeTuioObject(TuioObject objectTuio){
  println("Salio: " + objectTuio.getSymbolID());
}
