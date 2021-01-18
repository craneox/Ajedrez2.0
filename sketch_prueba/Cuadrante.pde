public class Cuadrante{
  public String letra;
  public String numero;
  
  public void Cuadrante(){}
  
  public void Cuadrante(String letrax, String numerox){
    letra = letrax;
    numero = numerox;
  }
  
  public String getLetra() {
        return letra;
  }

  public void setLetra(String Letra) {
      this.letra = Letra;
  }
  
  public String getNumero() {
        return numero;
  }

  public void setNumero(String Numero) {
      this.numero = Numero;
  }
}
