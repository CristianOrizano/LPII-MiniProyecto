package etiquetas;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import entidad.Categoria;
import entidad.Ciudad;
import mantenimiento.MySqlAdministradorDAO;
import mantenimiento.MySqlProdcutoDAO;

public class CboCategoriaPar extends TagSupport {
	
	public int valor = -1;	
	
	public int getValor() {
		return valor;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}

	public int doStartTag() throws JspException{

		JspWriter out = pageContext.getOut();
		//
		try {
			
			 MySqlProdcutoDAO pro= new MySqlProdcutoDAO();
             ArrayList<Categoria> listca= pro.listar();
			
			for (Categoria c: listca) {
				//imprimir en la pagina out
				//%s cadena formateada para no escribir mucho. el 1-%s para getIdCate
				// 2-%s para getDes
				if(valor==c.getIde_cat()) 
					out.println(String.format("<option value='%s' selected> %s </option>", c.getIde_cat(),c.getDescripcion()));
				else 
					out.println(String.format("<option value='%s'> %s</option>", c.getIde_cat(),c.getDescripcion()));
				
			
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
