import TUIO.*;

TuioProcessing tuio;

int[] REY_Nx = {0};
int[] REY_Ny = {0};

//Declaramos fondo
PImage fondo;

//Declaramos imagenes negras
//peones
PImage peon_N1;
PImage peon_N2;
PImage peon_N3;
PImage peon_N4;
PImage peon_N5;
PImage peon_N6;
PImage peon_N7;
PImage peon_N8;
//torres
PImage torre_N1;
PImage torre_N2;
//caballos
PImage caballo_N1;
PImage caballo_N2;
//alfiles
PImage alfil_N1;
PImage alfil_N2;
//reyna
PImage reyna_N;
//rey
PImage rey_N;

//Declaramos imagenes blancas
//peones
PImage peon_B1;
PImage peon_B2;
PImage peon_B3;
PImage peon_B4;
PImage peon_B5;
PImage peon_B6;
PImage peon_B7;
PImage peon_B8;
//torres
PImage torre_B1;
PImage torre_B2;
//caballos
PImage caballo_B1;
PImage caballo_B2;
//alfiles
PImage alfil_B1;
PImage alfil_B2;
//reyna
PImage reyna_B;
//rey
PImage rey_B;

//Declaramos piezas negras
//peones
int peon_Nx1 = 55;
int peon_Ny1 = 145;
int peon_Nx2 = 140;
int peon_Ny2 = 145;
int peon_Nx3 = 225;
int peon_Ny3 = 145;
int peon_Nx4 = 310;
int peon_Ny4 = 145;
int peon_Nx5 = 395;
int peon_Ny5 = 145;
int peon_Nx6 = 480;
int peon_Ny6 = 145;
int peon_Nx7 = 565;
int peon_Ny7 = 145;
int peon_Nx8 = 650;
int peon_Ny8 = 145;
//torres
int torre_Nx1 = 55;
int torre_Ny1 = 55;
int torre_Nx2 = 650;
int torre_Ny2 = 55;
//caballos
int caballo_Nx1 = 140;
int caballo_Ny1 = 55;
int caballo_Nx2 = 565;
int caballo_Ny2 = 55;
//alfiles
int alfil_Nx1 = 225;
int alfil_Ny1 = 55;
int alfil_Nx2 = 480;
int alfil_Ny2 = 55;
//reyna
int reyna_Nx = 310;
int reyna_Ny = 55;
//rey
int rey_Nx = 395;
int rey_Ny = 55;

//Declaramos piezas blancas
//peones
int peon_Bx1 = 55;
int peon_By1 = 565;
int peon_Bx2 = 140;
int peon_By2 = 565;
int peon_Bx3 = 225;
int peon_By3 = 565;
int peon_Bx4 = 310;
int peon_By4 = 565;
int peon_Bx5 = 395;
int peon_By5 = 565;
int peon_Bx6 = 480;
int peon_By6 = 565;
int peon_Bx7 = 565;
int peon_By7 = 565;
int peon_Bx8 = 650;
int peon_By8 = 565;
//torres
int torre_Bx1 = 55;
int torre_By1 = 655;
int torre_Bx2 = 655;
int torre_By2 = 655;
//caballos
int caballo_Bx1 = 140;
int caballo_By1 = 655;
int caballo_Bx2 = 565;
int caballo_By2 = 655;
//alfiles
int alfil_Bx1 = 225;
int alfil_By1 = 655;
int alfil_Bx2 = 480;
int alfil_By2 = 655;
//reyna
int reyna_Bx = 310;
int reyna_By = 655;
//rey
int rey_Bx = 395;
int rey_By = 655;

//Declaramos el tiempo de los jugadores;


//Configuracion de la ventana
PGraphics pg1, pg2;

//Cargamos la posicion incial de todas las piezas
void iniciarPartida(){
  REY_Nx[0] = rey_Nx;
  REY_Ny[0] = rey_Ny;
  println("R x:" + REY_Nx[0] + ", y:" + REY_Ny[0]);
  return;
}

void setup(){
  size(displayWidth, 704);
  pg1 = createGraphics(708, 704);
  pg2 = createGraphics(width - 708,704);
  
  tuio = new TuioProcessing(this);
  
  fondo = loadImage("tablero.jpg"); //Asignamos imagen al fondo
  
  //Asignamos imagen a los peones
  peon_N1 = loadImage("peon_N.png");
  peon_N2 = loadImage("peon_N.png");
  peon_N3 = loadImage("peon_N.png");
  peon_N4 = loadImage("peon_N.png");
  peon_N5 = loadImage("peon_N.png");
  peon_N6 = loadImage("peon_N.png");
  peon_N7 = loadImage("peon_N.png");
  peon_N8 = loadImage("peon_N.png");
    
  peon_B1 = loadImage("peon_B.png");
  peon_B2 = loadImage("peon_B.png");
  peon_B3 = loadImage("peon_B.png");
  peon_B4 = loadImage("peon_B.png");
  peon_B5 = loadImage("peon_B.png");
  peon_B6 = loadImage("peon_B.png");
  peon_B7 = loadImage("peon_B.png");
  peon_B8 = loadImage("peon_B.png");
    
  //Asignamos imagen a las torres
  torre_N1 = loadImage("torre_N.png");
  torre_N2 = loadImage("torre_N.png");
  
  torre_B1 = loadImage("torre_B.png");
  torre_B2 = loadImage("torre_B.png");
  
  //Asignamos imagen a los caballos
  caballo_N1 = loadImage("caballo_N.png");
  caballo_N2 = loadImage("caballo_N.png");
  
  caballo_B1 = loadImage("caballo_B.png");
  caballo_B2 = loadImage("caballo_B.png");
  
  //Asignamos imagen a las alfiles
  alfil_N1 = loadImage("alfil_N.png");
  alfil_N2 = loadImage("alfil_N.png");
  
  alfil_B1 = loadImage("alfil_B.png");
  alfil_B2 = loadImage("alfil_B.png");
  
  //Asignamos imagen a las reynas
   reyna_N = loadImage("reyna_N.png");
   
   reyna_B = loadImage("reyna_B.png");
   
   //ASignamos imagen a los reyes
   rey_N = loadImage("rey_N.png");
   
   rey_B = loadImage("rey_B.png");
}

void draw(){
  PG_DRAW();
  image(pg1, 0, 0);
  image(pg2, 704, 0);
  
  cargarPiezas();
  
  if(mousePressed){
    println(mouseX + " : " + mouseY);
  }
}

void PG_DRAW(){
  pg1.beginDraw();
  pg1.background(fondo);
  pg1.endDraw();
  
  pg2.beginDraw();
  pg2.background(01);
  pg2.endDraw();
}

void cargarPiezas(){
  //peones
  image(peon_N1, peon_Nx1-40, peon_Ny1-40, 80,80);
  image(peon_N2, peon_Nx2-40, peon_Ny2-40, 80,80);
  image(peon_N3, peon_Nx3-40, peon_Ny3-40, 80,80);
  image(peon_N4, peon_Nx4-40, peon_Ny4-40, 80,80);
  image(peon_N5, peon_Nx5-40, peon_Ny5-40, 80,80);
  image(peon_N6, peon_Nx6-40, peon_Ny6-40, 80,80);
  image(peon_N7, peon_Nx7-40, peon_Ny7-40, 80,80);
  image(peon_N8, peon_Nx8-40, peon_Ny8-40, 80,80);
  
  image(peon_B1, peon_Bx1-40, peon_By1-40, 80,80);
  image(peon_B2, peon_Bx2-40, peon_By2-40, 80,80);
  image(peon_B3, peon_Bx3-40, peon_By3-40, 80,80);
  image(peon_B4, peon_Bx4-40, peon_By4-40, 80,80);
  image(peon_B5, peon_Bx5-40, peon_By5-40, 80,80);
  image(peon_B6, peon_Bx6-40, peon_By6-40, 80,80);
  image(peon_B7, peon_Bx7-40, peon_By7-40, 80,80);
  image(peon_B8, peon_Bx8-40, peon_By8-40, 80,80);
  
  //torres
  image(torre_N1, torre_Nx1-40, torre_Ny1-40, 80,80);
  image(torre_N2, torre_Nx2-40, torre_Ny2-40, 80,80);
  
  image(torre_B1, torre_Bx1-40, torre_By1-40, 80,80);
  image(torre_B2, torre_Bx2-40, torre_By2-40, 80,80);

  //alfiles
  image(alfil_N1, alfil_Nx1-40, alfil_Ny1-40, 80,80);
  image(alfil_N2, alfil_Nx2-40, alfil_Ny2-40, 80,80);
  
  image(alfil_B1, alfil_Bx1-40, alfil_By1-40, 80,80);
  image(alfil_B2, alfil_Bx2-40, alfil_By2-40, 80,80);
  
  //caballos
  image(caballo_N1, caballo_Nx1-40, caballo_Ny1-40, 80,80);
  image(caballo_N2, caballo_Nx2-40, caballo_Ny2-40, 80,80);
  
  image(caballo_B1, caballo_Bx1-40, caballo_By1-40, 80,80);
  image(caballo_B2, caballo_Bx2-40, caballo_By2-40, 80,80);
  
  
  //reynas
  image(reyna_N, reyna_Nx-40, reyna_Ny-40, 80,80);
  image(reyna_B, reyna_Bx-40, reyna_By-40, 80,80);
  
  //reynas
  image(rey_N, rey_Nx-40, rey_Ny-40, 80,80);
  image(rey_B, rey_Bx-40, rey_By-40, 80,80);
}
/////////////////////////////////////

Partida cuadrante(int x, int y){
  Partida partida = new Partida();
  if(x< 98){
    
  }
  return partida;
}







/////////////////////////////////////
//Parte de Reactivision y fiduciales

void addTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  println("entro " + idObjeto +" en la posicion x="+ objectTuio.getX()+ " y=" + objectTuio.getY());
  
}

void updateTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  
  // ¡¡Si desea conocer la lista de los fiduciales asignados favor de abrir archivo adjunto "Piezas.txt"!!
  
  // Asignacion de fiduciales a las piezas
  if(objectTuio.getSymbolID() ==0){
    rey_Nx = round (objectTuio.getX()*width);
    rey_Ny = round (objectTuio.getY()*height);
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
