package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidad.Categoria;
import entidad.Producto;
import interfaces.ProductoDAO;
import utils.MySQLConexion8;

public class MySqlProdcutoDAO implements ProductoDAO {

	@Override
	public int insert(Producto pr) {
		
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="insert into tb_Electrodomesticos values (?,?,?,?,?,?,1)";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setInt(1,pr.getCodigo());
			pstm.setInt(2,pr.getIde_cat());
			pstm.setString(3,pr.getNombre());
			pstm.setInt(4,pr.getStock());
			pstm.setDouble(5,pr.getPrecio());
			pstm.setString(6,pr.getMarca());
			

			//ejecutar
			salida=pstm.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Error al registrar producto: "+e.getMessage());
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
			String sql="update tb_Electrodomesticos set estado=0 where codigo=?";
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
	public int update(Producto pr) {
		
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			cn= MySQLConexion8.getConexion();
			//senetencia sql
			String sql="update tb_Electrodomesticos set ide_cat=?,nombre=?,stock=?,precio=?,Marca=? where codigo=?";
			pstm= cn.prepareStatement(sql);
			//pasar parametros
			pstm.setInt(1,pr.getIde_cat());
			pstm.setString(2,pr.getNombre());
			pstm.setInt(3,pr.getStock());
			pstm.setDouble(4,pr.getPrecio());
			pstm.setString(5,pr.getMarca());
			pstm.setInt(6,pr.getCodigo());

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
	public ArrayList<Producto> lisall() {
		ArrayList<Producto> lista = new ArrayList<Producto>();

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = MySQLConexion8.getConexion();
			String sql = "select e.codigo,c.descripcion,e.nombre,e.precio,e.stock,Marca from tb_Electrodomesticos as e join tb_Categoria as c on e.ide_cat=c.ide_cat where estado=1; ";
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				Producto e = new Producto();

				e.setCodigo(rs.getInt(1));
				e.setNombCate(rs.getString(2));
				e.setNombre(rs.getString(3));
				e.setPrecio(rs.getDouble(4));
				e.setStock(rs.getInt(5));
				e.setMarca(rs.getString(6));
				

				lista.add(e);
			}

		} catch (Exception e) {
			System.out.println("Error al listar productos: " + e.getMessage());
		} finally {
			MySQLConexion8.closeConexion(con);
		}

		return lista;
	}

	@Override
	public Producto buscar(int cod) {
		Producto e= null;

		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs= null;
		
		try {
			con=MySQLConexion8.getConexion();
			String sql="select * from tb_Electrodomesticos where codigo=?";
			pst=con.prepareStatement(sql);
			

			pst.setInt(1, cod);
			
			rs=pst.executeQuery();
			
			if(rs.next()) {
				e=new Producto();
				e.setCodigo(rs.getInt(1));
				e.setIde_cat(rs.getInt(2));
				e.setNombre(rs.getString(3));
				e.setStock(rs.getInt(4));
				e.setPrecio(rs.getDouble(5));
				e.setMarca(rs.getString(6));
			}
			
		} catch (Exception e2) {
			System.out.println("Error al buscar producto: "+e2.getMessage());
		}finally {
			MySQLConexion8.closeConexion(con);
		}
		
		return e;
	}

	@Override
	public int gencodi() {
		int codigo= 0;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn= MySQLConexion8.getConexion();
			String sql="select max(codigo)+1 from tb_Electrodomesticos";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			if(rs.next()){
				
				codigo=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}		
		return codigo;
	}

	@Override
	public ArrayList<Categoria> listar() {
		ArrayList<Categoria> lista= new ArrayList<Categoria>();
		//
		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs= null;
		
		try {
			con=MySQLConexion8.getConexion();
			String sql="select * from tb_Categoria";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			
			while(rs.next()) {
				Categoria c =new Categoria();
				c.setIde_cat(rs.getInt(1));
				c.setDescripcion(rs.getString(2));
				lista.add(c);
			}
			
		} catch (Exception e) {
			System.out.println("Error al listar categorias: "+e.getMessage());
		}finally {
			MySQLConexion8.closeConexion(con);
		}
		
		return lista;
	}

	@Override
	public ArrayList<Producto> consCate(int codcat) {
		
		ArrayList<Producto> lista = new ArrayList<Producto>();

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = MySQLConexion8.getConexion();
			String sql = "select e.codigo,c.descripcion,e.nombre,e.precio,e.stock,Marca from tb_Electrodomesticos as e join tb_Categoria as c \r\n"
					+ "on e.ide_cat=c.ide_cat where estado=1 and e.ide_cat=?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, codcat);
			
			rs = pst.executeQuery();

			while (rs.next()) {
				Producto e = new Producto();
				e.setCodigo(rs.getInt(1));
				e.setNombCate(rs.getString(2));
				e.setNombre(rs.getString(3));
				e.setPrecio(rs.getDouble(4));
				e.setStock(rs.getInt(5));
				e.setMarca(rs.getString(6));

				lista.add(e);
			}

		} catch (Exception e) {
			System.out.println("Error al listar productos: " + e.getMessage());
		} finally {
			MySQLConexion8.closeConexion(con);
		}

		return lista;
		
	}

	@Override
	public Producto buscarca(int cod) {
		
		Producto e= null;

		Connection con=null;
		PreparedStatement pst=null;
		ResultSet rs= null;
		
		try {
			con=MySQLConexion8.getConexion();
			String sql=" select e.codigo,c.descripcion,e.nombre,e.precio,e.stock,Marca from tb_Electrodomesticos as e join tb_Categoria as c \r\n"
					+ "on e.ide_cat=c.ide_cat where e.codigo=?";
			pst=con.prepareStatement(sql);
			

			pst.setInt(1, cod);
			
			rs=pst.executeQuery();
			
			if(rs.next()) {
				e=new Producto();
				e.setCodigo(rs.getInt(1));
				e.setNombCate(rs.getString(2));
				e.setNombre(rs.getString(3));
				e.setPrecio(rs.getDouble(4));
				e.setStock(rs.getInt(5));
				e.setMarca(rs.getString(6));
			}
			
		} catch (Exception e2) {
			System.out.println("Error al buscar producto: "+e2.getMessage());
		}finally {
			MySQLConexion8.closeConexion(con);
		}
		
		return e;
	}

}
