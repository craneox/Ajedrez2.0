public class Pieza {
    public String nombre;
    public PImage imagen;
    public int posicion_x;
    public int posicion_y;
    
    public int nuevaX = 0;
    public int nuevaY = 0;

    public Pieza() {
    }
    
    public Pieza(String nombre, PImage imagen,int posicion_x, int posicion_y, int nuevaX, int nuevaY) {
        this.nombre = nombre;
        this.imagen = imagen;
        this.posicion_x = posicion_x;
        this.posicion_y = posicion_y;
        this.nuevaX = nuevaX;
        this.nuevaY = nuevaY;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public PImage getImagen() {
        return imagen;
    }

    public void setImagen(PImage imagen) {
        this.imagen = imagen;
    }

    public int getPosicion_x() {
        return posicion_x;
    }

    public void setPosicion_x(int posicion_x) {
        this.posicion_x = posicion_x;
    }

    public int getPosicion_y() {
        return posicion_y;
    }

    public void setPosicion_y(int posicion_y) {
        this.posicion_y = posicion_y;
    }

    public int getNuevaX() {
        return nuevaX;
    }

    public void setNuevaX(int nuevaX) {
        this.nuevaX = nuevaX;
    }

    public int getNuevaY() {
        return nuevaY;
    }

    public void setNuevaY(int nuevaY) {
        this.nuevaY = nuevaY;
    }
}
