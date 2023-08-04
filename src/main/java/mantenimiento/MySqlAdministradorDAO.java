package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidad.Administrador;
import entidad.Ciudad;
import entidad.Empleado;
import interfaces.AdministradorDAO;
import utils.MySQLConexion8;

public class MySqlAdministradorDAO implements AdministradorDAO {

	@Override
	public int insert(Administrador ad) {
		
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="insert into tb_Administrador values(?,?,?,?,?,?,?,?)";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setString(1,ad.getCod_adm());
			pstm.setString(2,ad.getNombre());
			pstm.setString(3,ad.getApellido());
			pstm.setString(4,ad.getDireccion());
			pstm.setInt(5,ad.getTelefono());
			pstm.setString(6,ad.getSexo());
			pstm.setString(7,ad.getFecha_nac());
			pstm.setString(8,ad.getCod_ciu());

			//ejecutar
			salida=pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm !=null)pstm.close();
				if(cn !=null)cn.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		
		return salida;
	}

	@Override
	public int delete(String cod) {
		
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="delete from tb_Administrador where cod_adm =?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setString(1,cod);

			//ejecutar
			salida=pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm !=null)pstm.close();
				if(cn !=null)cn.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		
		return salida;
	}

	@Override
	public int update(Administrador ad) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql=" update tb_Administrador set nombre=?,apellido=?,\r\n"
					+ " Direccion=?,telefono=?,sexo=?,fecha_nac=?,cod_ciu=? where  cod_adm= ?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setString(1,ad.getNombre());
			pstm.setString(2,ad.getApellido());
			pstm.setString(3,ad.getDireccion());
			pstm.setInt(4,ad.getTelefono());
			pstm.setString(5,ad.getSexo());
			pstm.setString(6,ad.getFecha_nac());
			pstm.setString(7,ad.getCod_ciu());
			pstm.setString(8,ad.getCod_adm());
			//ejecutar
			salida=pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm !=null)pstm.close();
				if(cn !=null)cn.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		
		return salida;
	}

	@Override
	public ArrayList<Administrador> lisall() {
		
		ArrayList<Administrador> sali= new ArrayList<Administrador>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			String sql="select cod_adm,nombre,apellido,Direccion,telefono,sexo,fecha_nac,c.nom_ciu\r\n"
					+ "from tb_Administrador as a join tb_Ciudad as c\r\n"
					+ "on a.cod_ciu=c.cod_ciu";
			pstm=cn.prepareStatement(sql);
			//no hay parametros
			rs= pstm.executeQuery();
			while(rs.next()) {
				Administrador ad= new Administrador();
				ad.setCod_adm(rs.getString(1));
				ad.setNombre(rs.getString(2));
				ad.setApellido(rs.getString(3));
				ad.setDireccion(rs.getString(4));
				ad.setTelefono(rs.getInt(5));
				ad.setSexo(rs.getString(6));
				ad.setFecha_nac(rs.getString(7));
				ad.setNomciu(rs.getString(8));
				sali.add(ad);
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstm !=null)pstm.close();
				if(cn !=null)cn.close();
				
			
			} catch (SQLException e2) {
				System.out.println("error"+ e2.getMessage());
			}
		}
		
		return sali;
	}

	@Override
	public Administrador login(String login, String con) {
		
		Administrador ad=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="select ad.* from tb_Administrador as ad join tb_usuarios as u\r\n"
					+ "on ad.cod_adm=u.cod_adm where login=? and contra=?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setString(1,login);
			pstm.setString(2,con);
			//ejecutar
			rs=pstm.executeQuery();
			
			if(rs.next()) {
				ad= new Administrador();
				ad.setCod_adm(rs.getString(1));
				ad.setNombre(rs.getString(2));
				ad.setApellido(rs.getString(3));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstm !=null)pstm.close();
				if(cn !=null)cn.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		
		return ad;
	}

	@Override
	public String gencodi() {
		String codigo = "AD001"; // En caso de una tabla vacía, se genera el codigo por default
		// Plantilla de BD --> busqueda
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = MySQLConexion8.getConexion();
			// B0004 --> 0004
			String sql = "select substring(max(cod_adm),3) from tb_Administrador";
			pst = con.prepareStatement(sql);

			rs = pst.executeQuery();

			//
			if (rs.next()) {
				
				codigo = String.format("AD%03d", rs.getInt(1) + 1);
			}

		} catch (Exception e) {
			System.out.println("Error al generarNumBoleta: " + e.getMessage());
		} finally {
			MySQLConexion8.closeConexion(con);
		}

		return codigo;
	}

	@Override
	public ArrayList<Ciudad> listar() {
		
		ArrayList<Ciudad> sali= new ArrayList<Ciudad>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			String sql="select * from tb_Ciudad;";
			pstm=cn.prepareStatement(sql);
			//no hay parametros
			rs= pstm.executeQuery();
			while(rs.next()) {
				Ciudad ad= new Ciudad();
				ad.setCod(rs.getString(1));
				ad.setNomciu(rs.getString(2));
				
				sali.add(ad);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstm !=null)pstm.close();
				if(cn !=null)cn.close();
				
			
			} catch (SQLException e2) {
				System.out.println("error"+ e2.getMessage());
			}
		}
		
		return sali;
	}

	@Override
	public Administrador buscar(String cod) {
		Administrador em=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="select * from tb_Administrador where cod_adm=?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setString(1,cod);
			//ejecutar
			rs=pstm.executeQuery();
			
			if(rs.next()) {
				 em= new Administrador();
				 em.setCod_adm(rs.getString(1));
				 em.setNombre(rs.getString(2));
				 em.setApellido(rs.getString(3));
				 em.setDireccion(rs.getString(4));
				 em.setTelefono(rs.getInt(5));
				 em.setSexo(rs.getString(6));
				 em.setFecha_nac(rs.getString(7));
				 em.setCod_ciu(rs.getString(8));
				 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstm !=null)pstm.close();
				if(cn !=null)cn.close();
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		
		return em;
	}

}
