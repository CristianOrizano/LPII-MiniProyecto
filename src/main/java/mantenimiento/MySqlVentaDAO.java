package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidad.Boleta;
import entidad.DetalleBoleta;
import interfaces.VentaDAO;
import utils.MySQLConexion8;

public class MySqlVentaDAO implements VentaDAO {

	@Override
	public String gencodiBol() {
		
		String codigo = "B0001"; // En caso de una tabla vacía, se genera el codigo por default
		// Plantilla de BD --> busqueda
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion8.getConexion();
			// B0004 --> 0004
			String sql = "select substring(max(num_bol),2) from tb_cab_boleta";
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			//
			if (rs.next()) {
				// 0004 --> 4 +1 --> "B0005"
				codigo = String.format("B%04d", rs.getInt(1) + 1);
			}
		} catch (Exception e) {
			System.out.println("Error al generarNumBoleta: " + e.getMessage());
		} finally {
			MySQLConexion8.closeConexion(con);
		}

		return codigo;
		
	}

	@Override
	public int insBolyDeta(Boleta bo, ArrayList<DetalleBoleta> detbo) {
		
		int rs = 0;

		Connection con = null;
		PreparedStatement pst1 = null; //para insertar en boleta
		PreparedStatement pst2 = null; //para insertar en detalleBoleta
		PreparedStatement pst3 = null; //para actualizar el stock de prod

		try {
			con = MySQLConexion8.getConexion();
			con.setAutoCommit(false);

			String sql = "insert into tb_cab_boleta values (?,curdate(),?,?)";
			pst1 = con.prepareStatement(sql);

			pst1.setString(1, bo.getNum_bol());
			pst1.setString(2, bo.getCod_usua());
			pst1.setDouble(3, bo.getTotal());
            
			//ejecutar
			rs = pst1.executeUpdate();
            //grabar de nuevo
			String sql2 = "insert into tb_det_boleta values (?,?,?,?)";
			String sql3 = "update tb_Electrodomesticos set stock = stock - ? where codigo= ?";

			for (DetalleBoleta d : detbo) {
				pst2 = con.prepareStatement(sql2);
				pst2.setString(1, bo.getNum_bol());
				pst2.setInt(2, d.getCodigo_elc());
				pst2.setInt(3, d.getCantidad());
				pst2.setDouble(4, d.getImporte());
                        
				rs += pst2.executeUpdate();
                
				pst3 = con.prepareStatement(sql3);
				pst3.setInt(1, d.getCantidad());   //parametro de cantidad
				pst3.setInt(2, d.getCodigo_elc()); //parametro de codigoElec
				rs += pst3.executeUpdate();

			}
			con.commit();

		} catch (Exception e) {
			System.out.println("Error al realizar venta: " + e.getMessage());
			rs = 0;
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("Error al restaurar");
				e1.printStackTrace();
			}
		} finally {
			MySQLConexion8.closeConexion(con);
		}
		return rs;
	}
	

}
