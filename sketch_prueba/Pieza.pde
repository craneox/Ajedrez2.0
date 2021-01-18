public class Pieza {
    public String nombre;
    public PImage imagen;
    public int posicion_x;
    public int posicion_y;
    
    public Cuadrante cuadrante;

    public Pieza() {
    }
    
    public Pieza(String nombre, PImage imagen,int posicion_x, int posicion_y) {
        this.nombre = nombre;
        this.imagen = imagen;
        this.posicion_x = posicion_x;
        this.posicion_y = posicion_y;
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

    public Cuadrante getCuadrante() {
        return cuadrante;
    }

    public void setCuadrante(Cuadrante cuadrante) {
        this.cuadrante = cuadrante;
    }

}
