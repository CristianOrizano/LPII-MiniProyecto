package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidad.Empleado;
import interfaces.EmpleadoDAO;
import utils.MySQLConexion8;

public class MySqlEmpleadoDAO implements EmpleadoDAO {

	@Override
	public int insert(Empleado em) {
		
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="insert into  tb_empleado values(null,?,?,?,?)";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setString(1,em.getNombre());
			pstm.setString(2,em.getApellido());
			pstm.setInt(3, em.getNumhi());
			pstm.setDouble(4,em.getSueldo());
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
	public int delete(int cod) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="delete from tb_empleado where codi_empl=?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setInt(1,cod);
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
	public int update(Empleado em) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="update tb_empleado set nom_em=?,apell_em=?,num_hijos=?,sueldo=? where codi_empl=?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setString(1,em.getNombre());
			pstm.setString(2,em.getApellido());
			pstm.setInt(3, em.getNumhi());
			pstm.setDouble(4,em.getSueldo());
			pstm.setInt(5,em.getCodiEm());
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
	public ArrayList<Empleado> lisall() {
		
		ArrayList<Empleado> sali= new ArrayList<Empleado>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			String sql="select * from tb_empleado";
			pstm=cn.prepareStatement(sql);
			//no hay parametros
			rs= pstm.executeQuery();
			while(rs.next()) {
				Empleado em= new Empleado();
				em.setCodiEm(rs.getInt(1));
				em.setNombre(rs.getString(2));
				em.setApellido(rs.getString(3));
				em.setNumhi(rs.getInt(4));
				em.setSueldo(rs.getDouble(5));
				sali.add(em);
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
	public Empleado busq(int cod) {
		
		Empleado em=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="select * from tb_empleado where codi_empl=?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setInt(1,cod);
			//ejecutar
			rs=pstm.executeQuery();
			
			if(rs.next()) {
				 em= new Empleado();
				em.setCodiEm(rs.getInt(1));
				em.setNombre(rs.getString(2));
				em.setApellido(rs.getString(3));
				em.setNumhi(rs.getInt(4));
				em.setSueldo(rs.getDouble(5));
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
