package entidad;

public class Boleta {
	public String num_bol,fch_emi;
	public String cod_usua;
	public double total;
	//metodos acceso
	
	public String getCod_usua() {
		return cod_usua;
	}
	public void setCod_usua(String cod_usua) {
		this.cod_usua = cod_usua;
	}
	
	
	public String getNum_bol() {
		return num_bol;
	}
	public void setNum_bol(String num_bol) {
		this.num_bol = num_bol;
	}
	public String getFch_emi() {
		return fch_emi;
	}
	public void setFch_emi(String fch_emi) {
		this.fch_emi = fch_emi;
	}
	
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
}
