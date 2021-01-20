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

  int Nx;
  int Ny;
  int Bx;
  int By;
  int x;
  int y;
  
  Cuadrante cI;
  Cuadrante cF;
  
  String Movimiento_N[] = new String[200];
  String Movimiento_B[] = new String[200];
  int coN = 0;
  int coB = 0;
  
  String negro;
  String blanco;
  
  String P;
  String L;
  String N;
  String E = "";
  
  boolean ventana = true;

void setup(){
  size(708, 704);
  createGraphics(708, 704);
  
  
  tuio = new TuioProcessing(this);
  
  fondo = loadImage("tablero.jpg"); //Asignamos imagen al fondo
  
  acomodarTablero();
}

void draw(){
  if(ventana){
    background(fondo);
    cargarPiezas();
  }else{
    background(00);
    imprimir_Movimientos();
  }
  
  
  
  if(keyPressed){
    if(key == 'r'){
      println("reiniciando");
      reiniciar();
      ventana = true;
    }
    if (key == CODED){
      //Movimientos Blancos
      if(keyCode == LEFT){
        Movimiento_Blanco();
      }
      //Movimientos Negros
      if(keyCode == RIGHT){
        Movimiento_Negro();
      }
      if(keyCode == UP){
        println("Mostrando resultados");
        ventana = false;
      }
      if(keyCode == DOWN){
        println("Mostrando juego");
        ventana = true;
      }
    }
  } 
}

void acomodarTablero(){
    Nx = 55;
    Ny = 145;
    Bx = 55;
    By = 565;
    //peones
    for(int i=0; i<8; i++){
      Peones_N[i] = new Pieza("Peon", loadImage("peon_N.png"), Nx, Ny);
      Peones_B[i] = new Pieza("Peon", loadImage("peon_B.png"), Bx, By);
      Peones_N[i].setCuadrante(BuscarCuadrante(Peones_N[i]));
      Peones_B[i].setCuadrante(BuscarCuadrante(Peones_B[i]));
      Nx += 85;
      Bx += 85;
    }
    Nx = 55;
    Ny = 55;
    Bx = 55;  
    By = 650;
    //torres
    for(int i=0; i<2; i++){
      Torres_N[i] = new Pieza("Torre", loadImage("torre_N.png"), Nx, Ny);
      Torres_B[i] = new Pieza("Torre", loadImage("torre_B.png"), Bx, By);
      Torres_N[i].setCuadrante(BuscarCuadrante(Torres_N[i]));
      Torres_B[i].setCuadrante(BuscarCuadrante(Torres_B[i]));
      Nx += 595;
      Bx += 595;
    }
    Nx = 140;
    Ny = 55;
    Bx = 140;
    By = 650;
    //Caballos
    for(int i=0; i<2; i++){
      Caballos_N[i] = new Pieza("Caballo", loadImage("caballo_N.png"), Nx, Ny);
      Caballos_B[i] = new Pieza("Caballo", loadImage("caballo_B.png"), Bx, By);
      Caballos_N[i].setCuadrante(BuscarCuadrante(Caballos_N[i]));
      Caballos_B[i].setCuadrante(BuscarCuadrante(Caballos_B[i]));
      Nx += 425;
      Bx += 425;
    }
    Nx = 225;
    Ny = 55;
    Bx = 225;
    By = 650;
    //Alfiles
    for(int i=0; i<2; i++){
      Alfiles_N[i] = new Pieza("Alfil", loadImage("alfil_N.png"), Nx, Ny);
      Alfiles_B[i] = new Pieza("Alfil", loadImage("alfil_B.png"), Bx, By);
      Alfiles_N[i].setCuadrante(BuscarCuadrante(Alfiles_N[i]));
      Alfiles_B[i].setCuadrante(BuscarCuadrante(Alfiles_B[i]));
      Nx += 255;
      Bx += 255;
    }
    Nx = 310;
    Ny = 55;
    Bx = 310;
    By = 650;
    //Reynas
    Reyna_N = new Pieza("Reyna", loadImage("reyna_N.png"), Nx, Ny);
    Reyna_B = new Pieza("Reyna", loadImage("reyna_B.png"), Bx, By);
    Reyna_N.setCuadrante(BuscarCuadrante(Reyna_N));
    Reyna_B.setCuadrante(BuscarCuadrante(Reyna_B));
    
    Nx = 395;
    Ny = 55;
    Bx = 395;
    By = 650;
    //Reyes
    Rey_N = new Pieza("Rey", loadImage("rey_N.png"), Nx, Ny);
    Rey_B = new Pieza("Rey", loadImage("rey_B.png"), Bx, By);
    Rey_N.setCuadrante(BuscarCuadrante(Rey_N));
    Rey_B.setCuadrante(BuscarCuadrante(Rey_B));
    Nx = 0;
    Ny = 0;
    Bx = 0;
    By = 0;
}

void cargarPiezas(){
    //peones
    for(int i=0; i<8; i++){
      if(Peones_N[i].getPosicion_x() != 0 || Peones_N[i].getPosicion_y() != 0 ){
      image(Peones_N[i].getImagen(), Peones_N[i].getPosicion_x()-40, Peones_N[i].getPosicion_y()-40, 80,80);
      }
      if(Peones_B[i].getPosicion_x() != 0 || Peones_B[i].getPosicion_y() != 0 ){
      image(Peones_B[i].getImagen(), Peones_B[i].getPosicion_x()-40, Peones_B[i].getPosicion_y()-40, 80,80);
      }
    }
    //torres
    for(int i=0; i<2; i++){
      if(Torres_N[i].getPosicion_x() != 0 || Torres_N[i].getPosicion_y() !=0) {
      image(Torres_N[i].getImagen(), Torres_N[i].getPosicion_x()-40, Torres_N[i].getPosicion_y()-40, 80,80);
      }
      if(Torres_B[i].getPosicion_x() != 0 || Torres_B[i].getPosicion_y() !=0) {
      image(Torres_B[i].getImagen(), Torres_B[i].getPosicion_x()-40, Torres_B[i].getPosicion_y()-40, 80,80);
      }
    }
    //Caballos
    for(int i=0; i<2; i++){
      if(Caballos_N[i].getPosicion_x() != 0 || Caballos_N[i].getPosicion_y() !=0) {
      image(Caballos_N[i].getImagen(), Caballos_N[i].getPosicion_x()-40, Caballos_N[i].getPosicion_y()-40, 80,80);
      }
      if(Caballos_B[i].getPosicion_x() != 0 || Caballos_B[i].getPosicion_y() !=0) {
      image(Caballos_B[i].getImagen(), Caballos_B[i].getPosicion_x()-40, Caballos_B[i].getPosicion_y()-40, 80,80);
      }
    }
    //Alfiles
    for(int i=0; i<2; i++){
      if(Alfiles_N[i].getPosicion_x() != 0 || Alfiles_N[i].getPosicion_y() !=0) {
      image(Alfiles_N[i].getImagen(), Alfiles_N[i].getPosicion_x()-40, Alfiles_N[i].getPosicion_y()-40, 80,80);
      }
      if(Alfiles_B[i].getPosicion_x() != 0 || Alfiles_B[i].getPosicion_y() !=0) {
      image(Alfiles_B[i].getImagen(), Alfiles_B[i].getPosicion_x()-40, Alfiles_B[i].getPosicion_y()-40, 80,80);
      }
    }
    //Reynas
    if(Reyna_N.getPosicion_x() != 0 || Reyna_N.getPosicion_y() !=0) {
    image(Reyna_N.getImagen(), Reyna_N.getPosicion_x()-40, Reyna_N.getPosicion_y()-40, 80,80);
    }
    if(Reyna_B.getPosicion_x() != 0 || Reyna_B.getPosicion_y() !=0) {
    image(Reyna_B.getImagen(), Reyna_B.getPosicion_x()-40, Reyna_B.getPosicion_y()-40, 80,80);
    }
    //Reyes
    if(Rey_N.getPosicion_x() != 0 || Rey_N.getPosicion_y() !=0) {
    image(Rey_N.getImagen(), Rey_N.getPosicion_x()-40, Rey_N.getPosicion_y()-40, 80,80);
    }
    if(Rey_B.getPosicion_x() != 0 || Rey_B.getPosicion_y() !=0) {
    image(Rey_B.getImagen(), Rey_B.getPosicion_x()-40, Rey_B.getPosicion_y()-40, 80,80);
    }
}
void reiniciar(){
  acomodarTablero();
  P = null;
  L = null;
  N = null;
  E = "";
  for(int i=0;i<200;i++){
    Movimiento_N[i]=null;
    Movimiento_B[i]=null;
  }
}

void Movimiento_Blanco(){
  if(P != null){
    blanco = P+E+L+N;
    if(Movimiento_B[0] == null){
      Movimiento_B[0] = blanco;
      println("Se agrego a la primera posicion blanca: "+ blanco);
    }else{
      boolean bandera = false;
      if(Movimiento_B[coB].equals(blanco)){
        bandera = true; 
      }
      if(bandera){
        bandera = false;
      }else{
        coB = coB +1;
        Movimiento_B[coB] = blanco;
        println("Se agrego " + blanco +" a la posicion "+ coB);
        bandera = false;
        E="";
      }
    }
  }
  P = null;
}

void Movimiento_Negro(){
  if(P != null){
    negro = P+E+L+N;
    if(Movimiento_N[0] == null){
      Movimiento_N[0] = negro;
      println("Se agrego a la primera posicion negra: "+ negro);
    }else{
      boolean bandera = false;
      if(Movimiento_N[coN].equals(negro)){
        bandera = true; 
      }
      if(!bandera){
        coN = coN +1;
        Movimiento_N[coN] = negro;
        println("Se agrego " + negro +" a la posicion "+ coN);
        bandera = false;
        E="";
      }else{
        bandera = false;
      }
    }
  }
  P = null;
}

void imprimir_Movimientos(){
  textSize(32);
  text("Movimientos de la partida", 140, 60);
  fill(200, 200, 200);
  textSize(18);
  text("Blancos",40,110);
  text("Negros",180,110);
  text("Blancos",380,110);
  text("Negros",520,110);
  
  textSize(14);
  int j = 1;
  int mBx = 30;
  int mBy = 140;
  int mNx = 170;
  int mNy = 140;
  
  for(int i=0; i<79;i++){
    if(Movimiento_B[i] == null){
      i=78;
    }else{
      if(mBy<680 || mNy<680){
        text(j+"  "+Movimiento_B[i],mBx,mBy);
        mBy = mBy + 14;
        j++;
      }else{
        mBx = 370;
        mBy = 140;
      }
    }
    if(Movimiento_N[i] == null){
      i=78;
    }else{
      if(mBy<680 || mNy<680){
        text(j+"  "+Movimiento_N[i],mNx,mNy);
        mNy = mNy + 14;
        j++;
      }else{
        mNx = 510;
        mNy = 140;
      }
    }
  } 
}

/////////////////////////////////////

Cuadrante BuscarCuadrante(Pieza pieza){
  Cuadrante cuadrante = new Cuadrante();
  if(pieza.getPosicion_x() <= 95){
    cuadrante.setLetra("a");
  }else{
    if(pieza.getPosicion_x() <= 180){
    cuadrante.setLetra("b");
    }else{
      if(pieza.getPosicion_x() <= 275){
        cuadrante.setLetra("c");
      }else{
        if(pieza.getPosicion_x() <= 355){
          cuadrante.setLetra("d");
        }else{
          if(pieza.getPosicion_x() <= 440){
            cuadrante.setLetra("e");
          }else{
            if(pieza.getPosicion_x() <= 525){
              cuadrante.setLetra("f");
            }else{
              if(pieza.getPosicion_x() <= 610){
                cuadrante.setLetra("g");
              }else{
               if(pieza.getPosicion_x() <= 696){
                  cuadrante.setLetra("h");
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

String leerFiducial(int f){
  if(f < 32){
    if(f == 0 || f == 16){
      return "R";
    }
    if(f == 1 || f == 17){
      return "D";
    }
    if(f == 2 || f == 3 || f == 18 || f == 19){
      return "A";
    }
    if(f == 4 || f == 5 || f == 20 || f == 21){
      return "C";
    }
    if(f == 6 || f == 7 || f == 22 || f == 23){
      return "T";
    }else{
      return "";
    }
  }else{
    println("No es una pieza del ajedrez");
    return "-";
  }
}

/////////////////////////////////////
//Parte de Reactivision y fiduciales

void addTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  // ¡¡Si desea conocer la lista de los fiduciales asignados favor de abrir archivo adjunto "Piezas.txt"!!
  // Asignacion de fiduciales a las piezas
  if(objectTuio.getSymbolID() ==0){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Rey_N.setPosicion_x(x);
    Rey_N.setPosicion_y(y);
  }

  if(objectTuio.getSymbolID() ==1){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Reyna_N.setPosicion_x(x);
    Reyna_N.setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==2){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_N[0].setPosicion_x(x);
    Alfiles_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==3){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_N[1].setPosicion_x(x);
    Alfiles_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==4){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_N[0].setPosicion_x(x);
    Caballos_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==5){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_N[1].setPosicion_x(x);
    Caballos_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==6){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_N[0].setPosicion_x(x);
    Torres_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==7){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_N[1].setPosicion_x(x);
    Torres_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==8){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[0].setPosicion_x(x);
    Peones_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==9){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[1].setPosicion_x(x);
    Peones_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==10){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[2].setPosicion_x(x);
    Peones_N[2].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==11){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[3].setPosicion_x(x);
    Peones_N[3].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==12){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[4].setPosicion_x(x);
    Peones_N[4].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==13){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[5].setPosicion_x(x);
    Peones_N[5].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==14){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[6].setPosicion_x(x);
    Peones_N[6].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==15){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[7].setPosicion_x(x);
    Peones_N[7].setPosicion_y(y);
  }
  
  if(objectTuio.getSymbolID() ==16){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Rey_B.setPosicion_x(x);
    Rey_B.setPosicion_y(y);
  }

  if(objectTuio.getSymbolID() ==17){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Reyna_B.setPosicion_x(x);
    Reyna_B.setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==18){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_B[0].setPosicion_x(x);
    Alfiles_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==19){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_B[1].setPosicion_x(x);
    Alfiles_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==20){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_B[0].setPosicion_x(x);
    Caballos_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==21){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_B[1].setPosicion_x(x);
    Caballos_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==22){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_B[0].setPosicion_x(x);
    Torres_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==23){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_B[1].setPosicion_x(x);
    Torres_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==24){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[0].setPosicion_x(x);
    Peones_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==25){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[1].setPosicion_x(x);
    Peones_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==26){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[2].setPosicion_x(x);
    Peones_B[2].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==27){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[3].setPosicion_x(x);
    Peones_B[3].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==28){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[4].setPosicion_x(x);
    Peones_B[4].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==29){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[5].setPosicion_x(x);
    Peones_B[5].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==30){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[6].setPosicion_x(x);
    Peones_B[6].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==31){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[7].setPosicion_x(x);
    Peones_B[7].setPosicion_y(y);
  }
}

void updateTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  // ¡¡Si desea conocer la lista de los fiduciales asignados favor de abrir archivo adjunto "Piezas.txt"!!
  // Asignacion de fiduciales a las piezas
  if(objectTuio.getSymbolID() ==0){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Rey_N.setPosicion_x(x);
    Rey_N.setPosicion_y(y);
    cF = BuscarCuadrante(Rey_N);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Rey_N.setCuadrante(cF);
  }

  if(objectTuio.getSymbolID() ==1){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Reyna_N.setPosicion_x(x);
    Reyna_N.setPosicion_y(y);
    cF = BuscarCuadrante(Reyna_N);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Reyna_N.setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==2){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_N[0].setPosicion_x(x);
    Alfiles_N[0].setPosicion_y(y);
    cF = BuscarCuadrante(Alfiles_N[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Alfiles_N[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==3){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_N[1].setPosicion_x(x);
    Alfiles_N[1].setPosicion_y(y);
    cF = BuscarCuadrante(Alfiles_N[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Alfiles_N[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==4){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_N[0].setPosicion_x(x);
    Caballos_N[0].setPosicion_y(y);
    cF = BuscarCuadrante(Caballos_N[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Caballos_N[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==5){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_N[1].setPosicion_x(x);
    Caballos_N[1].setPosicion_y(y);
    cF = BuscarCuadrante(Caballos_N[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Caballos_N[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==6){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_N[0].setPosicion_x(x);
    Torres_N[0].setPosicion_y(y);
    cF = BuscarCuadrante(Torres_N[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Torres_N[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==7){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_N[1].setPosicion_x(x);
    Torres_N[1].setPosicion_y(y);
    cF = BuscarCuadrante(Torres_N[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Torres_N[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==8){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[0].setPosicion_x(x);
    Peones_N[0].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_N[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==9){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[1].setPosicion_x(x);
    Peones_N[1].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_N[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==10){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[2].setPosicion_x(x);
    Peones_N[2].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_N[2]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[2].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==11){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[3].setPosicion_x(x);
    Peones_N[3].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_N[3]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[3].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==12){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[4].setPosicion_x(x);
    Peones_N[4].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_N[4]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[4].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==13){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[5].setPosicion_x(x);
    Peones_N[5].setPosicion_y(y);;
    cF = BuscarCuadrante(Peones_N[5]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[5].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==14){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[6].setPosicion_x(x);
    Peones_N[6].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_N[6]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[6].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==15){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_N[7].setPosicion_x(x);
    Peones_N[7].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_N[7]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_N[7].setCuadrante(cF);
  }
  
  if(objectTuio.getSymbolID() ==16){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Rey_B.setPosicion_x(x);
    Rey_B.setPosicion_y(y);
    cF = BuscarCuadrante(Rey_B);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Rey_B.setCuadrante(cF);
  }

  if(objectTuio.getSymbolID() ==17){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Reyna_B.setPosicion_x(x);
    Reyna_B.setPosicion_y(y);
    cF = BuscarCuadrante(Reyna_B);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Reyna_B.setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==18){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_B[0].setPosicion_x(x);
    Alfiles_B[0].setPosicion_y(y);
    cF = BuscarCuadrante(Alfiles_B[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Alfiles_B[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==19){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Alfiles_B[1].setPosicion_x(x);
    Alfiles_B[1].setPosicion_y(y);
    cF = BuscarCuadrante(Alfiles_B[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Alfiles_B[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==20){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_B[0].setPosicion_x(x);
    Caballos_B[0].setPosicion_y(y);
    cF = BuscarCuadrante(Caballos_B[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Caballos_B[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==21){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Caballos_B[1].setPosicion_x(x);
    Caballos_B[1].setPosicion_y(y);
    cF = BuscarCuadrante(Caballos_B[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Caballos_B[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==22){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_B[0].setPosicion_x(x);
    Torres_B[0].setPosicion_y(y);
    cF = BuscarCuadrante(Torres_B[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Torres_B[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==23){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Torres_B[1].setPosicion_x(x);
    Torres_B[1].setPosicion_y(y);;
    cF = BuscarCuadrante(Torres_B[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Torres_B[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==24){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[0].setPosicion_x(x);
    Peones_B[0].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[0]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[0].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==25){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[1].setPosicion_x(x);
    Peones_B[1].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[1]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[1].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==26){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[2].setPosicion_x(x);
    Peones_B[2].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[2]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[2].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==27){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[3].setPosicion_x(x);
    Peones_B[3].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[3]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[3].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==28){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[4].setPosicion_x(x);
    Peones_B[4].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[4]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[4].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==29){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[5].setPosicion_x(x);
    Peones_B[5].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[5]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[5].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==30){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[6].setPosicion_x(x);
    Peones_B[6].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[6]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[6].setCuadrante(cF);
  }
  if(objectTuio.getSymbolID() ==31){
    x = round (objectTuio.getX()*width);
    y = round (objectTuio.getY()*height);
    Peones_B[7].setPosicion_x(x);
    Peones_B[7].setPosicion_y(y);
    cF = BuscarCuadrante(Peones_B[7]);
    P = leerFiducial(idObjeto);
    L = cF.getLetra();
    N = cF.getNumero();
    Peones_B[7].setCuadrante(cF);
  }
}

void removeTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  x = 0;
  y = 0;
  E = "x";
  // ¡¡Si desea conocer la lista de los fiduciales asignados favor de abrir archivo adjunto "Piezas.txt"!!
  // Asignacion de fiduciales a las piezas
  if(objectTuio.getSymbolID() ==0){
    Rey_N.setPosicion_x(x);
    Rey_N.setPosicion_y(y);
  }

  if(objectTuio.getSymbolID() ==1){
    Reyna_N.setPosicion_x(x);
    Reyna_N.setPosicion_y(y);    
  }
  if(objectTuio.getSymbolID() ==2){
    Alfiles_N[0].setPosicion_x(x);
    Alfiles_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==3){
    Alfiles_N[1].setPosicion_x(x);
    Alfiles_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==4){
    Caballos_N[0].setPosicion_x(x);
    Caballos_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==5){
    Caballos_N[1].setPosicion_x(x);
    Caballos_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==6){
    Torres_N[0].setPosicion_x(x);
    Torres_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==7){
    Torres_N[1].setPosicion_x(x);
    Torres_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==8){
    Peones_N[0].setPosicion_x(x);
    Peones_N[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==9){
    Peones_N[1].setPosicion_x(x);
    Peones_N[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==10){
    Peones_N[2].setPosicion_x(x);
    Peones_N[2].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==11){
    Peones_N[3].setPosicion_x(x);
    Peones_N[3].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==12){
    Peones_N[4].setPosicion_x(x);
    Peones_N[4].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==13){
    Peones_N[5].setPosicion_x(x);
    Peones_N[5].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==14){
    Peones_N[6].setPosicion_x(x);
    Peones_N[6].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==15){
    Peones_N[7].setPosicion_x(x);
    Peones_N[7].setPosicion_y(y);
  }
  
  if(objectTuio.getSymbolID() ==16){
    Rey_B.setPosicion_x(x);
    Rey_B.setPosicion_y(y);
  }

  if(objectTuio.getSymbolID() ==17){
    Reyna_B.setPosicion_x(x);
    Reyna_B.setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==18){
    Alfiles_B[0].setPosicion_x(x);
    Alfiles_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==19){
    Alfiles_B[1].setPosicion_x(x);
    Alfiles_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==20){
    Caballos_B[0].setPosicion_x(x);
    Caballos_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==21){
    Caballos_B[1].setPosicion_x(x);
    Caballos_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==22){
    Torres_B[0].setPosicion_x(x);
    Torres_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==23){
    Torres_B[1].setPosicion_x(x);
    Torres_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==24){
    Peones_B[0].setPosicion_x(x);
    Peones_B[0].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==25){
    Peones_B[1].setPosicion_x(x);
    Peones_B[1].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==26){
    Peones_B[2].setPosicion_x(x);
    Peones_B[2].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==27){
    Peones_B[3].setPosicion_x(x);
    Peones_B[3].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==28){
    Peones_B[4].setPosicion_x(x);
    Peones_B[4].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==29){
    Peones_B[5].setPosicion_x(x);
    Peones_B[5].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==30){
    Peones_B[6].setPosicion_x(x);
    Peones_B[6].setPosicion_y(y);
  }
  if(objectTuio.getSymbolID() ==31){
    Peones_B[7].setPosicion_x(x);
    Peones_B[7].setPosicion_y(y);
  }
}
