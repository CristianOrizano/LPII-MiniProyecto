package etiquetas;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import entidad.Ciudad;
import mantenimiento.MySqlAdministradorDAO;

public class CboCiudadTagParametro extends TagSupport {
	
	
	//si no ingreso nada es -1
	//este atributo recibe un codigo y si no hay -1
	public String valor = "-1";	// Atributo con valor x default
	
	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public int doStartTag() throws JspException{

		JspWriter out = pageContext.getOut();
		//
		try {
			
			 MySqlAdministradorDAO cat= new MySqlAdministradorDAO();
             ArrayList<Ciudad> listaCiu= cat.listar();
			
			for (Ciudad c: listaCiu) {
				//imprimir en la pagina out
				//%s cadena formateada para no escribir mucho. el 1-%s para getIdCate
				// 2-%s para getDes
				if(valor.equals(c.getCod())) 
					out.println(String.format("<option value='%s' selected> %s </option>", c.getCod(),c.getNomciu()));
				else 
					out.println(String.format("<option value='%s'> %s</option>", c.getCod(),c.getNomciu()));
				
			
			}
		} 
		catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la etiqueta CboCategoria"+e.getMessage());
		}
		//
		
		return SKIP_BODY;// Será una etiqueta sin cuerpo

	}

	public int doEndTag() throws JspException{
		return EVAL_PAGE;

	}

}
