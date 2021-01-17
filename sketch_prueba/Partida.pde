public class Pieza{
  PImage imagen;
  public String nombre;
  public float x_Anterior;
  public float y_Anterior;
  
  public float x_Actual;
  public float y_Actual;
  
  public void Pieza(){}
    
  public void Pieza(PImage Imagen, String Nombre, int X, int Y){
    imagen  = Imagen;
    nombre = Nombre;
    x_Anterior = X;
    y_Anterior = Y;
  }
}
