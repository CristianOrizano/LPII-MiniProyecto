package etiquetas;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import entidad.Ciudad;
import mantenimiento.MySqlAdministradorDAO;

public class CboGeneroPa extends TagSupport {
	
	//atributo
	public String valor = "-1";	
	
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
			
				//imprimir en la pagina out
				//%s cadena formateada para no escribir mucho. el 1-%s para getIdCate
				// 2-%s para getDes
				if(valor.equals("Masculino")) {
					out.println(String.format("<option value='%s' selected> %s </option>","Masculino" ,"Masculino"));
				out.println(String.format("<option value='%s' > %s </option>","Femenino" ,"Femenino"));
				out.println(String.format("<option value='%s' > %s </option>","Masculino" ,"Masculino"));
				}else if(valor.equals("Femenino")) {
					out.println(String.format("<option value='%s' > %s </option>","Masculino" ,"Masculino"));
					out.println(String.format("<option value='%s' selected> %s </option>","Femenino" ,"Femenino"));
					out.println(String.format("<option value='%s' > %s </option>","Otro" ,"Otro"));
				}else if(valor.equals("Otro")) {
					out.println(String.format("<option value='%s' > %s </option>","Masculino" ,"Masculino"));
					out.println(String.format("<option value='%s' > %s </option>","Femenino" ,"Femenino"));
					out.println(String.format("<option value='%s' selected> %s </option>","Otro" ,"Otro"));
				}else {
					out.println(String.format("<option value='%s' > %s </option>","Masculino" ,"Masculino"));
					out.println(String.format("<option value='%s' > %s </option>","Femenino" ,"Femenino"));
					out.println(String.format("<option value='%s' > %s </option>","Otro" ,"Otro"));
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
