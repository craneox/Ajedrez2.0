import TUIO.*;

TuioProcessing tuio;
//Declaramos fondo
PImage fondo;

//Declaramos imagenes negras
PImage[] peon_N;
PImage[] torre_N;
PImage[] caballo_N;
PImage[] alfil_N;
PImage reyna_N;
PImage rey_N;

//Declaramos imagenes blancas
PImage[] peon_B;
PImage[] torre_B;
PImage[] caballo_B;
PImage[] alfil_B;
PImage reyna_B;
PImage rey_B;

//Declaramos piezas negras
int[] peones_Nx;
int[] peones_Ny;
int[] torres_Nx;
int[] torres_Ny;
int[] caballos_Nx;
int[] caballos_Ny;
int[] alfiles_Nx;
int[] alfiles_Ny;
int reyna_Nx;
int reyna_Ny;
int rey_Nx;
int rey_Ny;

//Declaramos piezas blancas
int[] peones_Bx;
int[] peones_By;
int[] torres_Bx;
int[] torres_By;
int[] caballos_Bx;
int[] caballos_By;
int[] alfiles_Bx;
int[] alfiles_By;
int[] reyna_Bx;
int[] reyna_By;
int rey_Bx;
int rey_By;


//Configuracion de la ventan
void setup(){
  size(708, 704);
  tuio = new TuioProcessing(this);
  fondo = loadImage("tablero.jpg"); //Asignamos imagen al fondo
  //Asignamos imagen a los peones
  for(int i=0; i>8; i++){  
    peon_N[i] = loadImage("peon_negro");
    peon_B[i] = loadImage("peon_blanco");
  }
  //Asignamos imagen a las torres
  for(int i=0; i>2; i++){  
    torre_N[i] = loadImage("torre_negro");
    torre_B[i] = loadImage("torre_blanco");
  }
  //Asignamos imagen a los caballos
  for(int i=0; i>2; i++){  
    torre_N[i] = loadImage("caballo_negro");
    torre_B[i] = loadImage("caballo_blanco");
  }
  //Asignamos imagen a las alfiles
  for(int i=0; i>2; i++){  
    torre_N[i] = loadImage("alfil_negro");
    torre_B[i] = loadImage("alfil_blanco");
  }
  //Asignamos imagen a las reynas
   reyna_N = loadImage("reyna_negro");
   reyna_B = loadImage("reyna_blanco");
   //ASignamos imagen a los reyes
   rey_N = loadImage("rey_negro");
   rey_B = loadImage("rey_blanco");
}


void draw(){
  background(fondo);
  
  ellipse(peones_Nx[0], peones_Nx[0], 10,10);
  image(peon_N[0], peones_Nx[0], peones_Ny[0], 50,50);
}

void addTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  println("entro " + idObjeto +" en la posicion x="+ objectTuio.getX()+ " y=" + objectTuio.getY());
  
}

void updateTuioObject(TuioObject objectTuio){
  int idObjeto = objectTuio.getSymbolID();
  
  // si el id del objeto es 0 entonces mover el pajaro
  if(objectTuio.getSymbolID() ==0){
    //pajx = round (objectTuio.getX()*width);
    //pajy = round (objectTuio.getY()*height);
  }
  // si el id del objeto es 1 entonces mover el tigre
  if(objectTuio.getSymbolID() ==1){
    //tigx = round (objectTuio.getX()*width);
    //tigy = round (objectTuio.getY()*height);
  }
  //Si el id del objeto es 2 entonces mover el elefante
  if(objectTuio.getSymbolID() ==2){
    //elex = round (objectTuio.getX()*width);
    //eley = round (objectTuio.getY()*height);
  }
}

void removeTuioObject(TuioObject objectTuio){
  println("Salio: " + objectTuio.getSymbolID());
}
