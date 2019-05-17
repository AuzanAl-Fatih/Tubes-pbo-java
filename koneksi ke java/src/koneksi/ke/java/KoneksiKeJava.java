/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package koneksi.ke.java;

/**
 *
 * @author tosiba
 */
import java.sql.*;
import java.util.*;

import javax.swing.*;

public class KoneksiKeJava {
static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/klinik";
    static final String USER = "root";
    static final String PASS = "";

    // Menyiapkan objek yang diperlukan untuk mengelola database
    static Connection conn;
    static Statement stmt;
    static ResultSet rs;
    
    
    
    
    public  void daftarDokter(String id, String nama){
        try {
            // register driver yang akan dipakai
            Class.forName(JDBC_DRIVER);
            
            // buat koneksi ke database
            
            
            // buat objek statement
            
            String sql = "INSERT INTO dokter VALUES (?,?)";
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.setString(2, nama);
            pstmt.executeUpdate();
            view neww = new view();
            neww.showberhasil();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }
        catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    public void updatedata(String nama, String gol_darah, String berat, String tinggi, String riwayat, String alergi, int umur){
        try {
            // register driver yang akan dipakai
            Class.forName(JDBC_DRIVER);
            
            // buat koneksi ke database
            
            
            // buat objek statement
            
            String sql = "UPDATE pasien SET berat_badan=?, tinggi_badan=?, riwayat_penyakit=?, umur=?, alergi_obat=? where nama_pasien=? AND gol_darah=?";
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, berat);
            pstmt.setString(2, tinggi);
            pstmt.setString(3, riwayat);
            pstmt.setInt(4, umur);
            pstmt.setString(5, alergi);
            pstmt.setString(6, nama);
            pstmt.setString(7, gol_darah);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateobat(String id, String nama_ngobat, String tgl, int jumlah, String guna, int harga){
        try {
            // register driver yang akan dipakai
            Class.forName(JDBC_DRIVER);
            
            // buat koneksi ke database
            
            
            // buat objek statement
            
            String sql = "UPDATE obat SET tgl_kadaluarsa=?, jumlah=?, fungsi=?, harga=? where merk_obat=? AND id_obat=?";
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, tgl);
            pstmt.setInt(2, jumlah);
            pstmt.setString(3, guna);
            pstmt.setInt(4, harga);
            pstmt.setString(5, nama_ngobat);
            pstmt.setString(6, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void tambahpasien(String nama, String gol_darah, String berat, String tinggi, String riwayat, String alergi, int umur,String id){
        try {
            // register driver yang akan dipakai
            Class.forName(JDBC_DRIVER);
            
            // buat koneksi ke database
            
            
            // buat objek statement
            
            String sql = "INSERT INTO pasien SET berat_badan=?, tinggi_badan=?, riwayat_penyakit=?, umur=?, alergi_obat=?, nama_pasien=?, gol_darah=?,id_pasien=? ";
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, berat);
            pstmt.setString(2, tinggi);
            pstmt.setString(3, riwayat);
            pstmt.setInt(4, umur);
            pstmt.setString(5, alergi);
            pstmt.setString(6, nama);
            pstmt.setString(7, gol_darah);
            pstmt.setString(8, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void tambahobat(String id, String nama_ngobat, String tgl, int jumlah, String guna, int harga){
        try {
            // register driver yang akan dipakai
            Class.forName(JDBC_DRIVER);
            
            // buat koneksi ke database
            
            
            // buat objek statement
            
            String sql = "INSERT INTO obat SET id_obat=?, merk_obat=?, tgl_kadaluarsa=?, jumlah=?, fungsi_obat=?, harga=?";
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.setString(2, nama_ngobat);
            pstmt.setString(3, tgl);
            pstmt.setInt(4, jumlah);
            pstmt.setString(5, guna);
            pstmt.setInt(6, harga);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        KoneksiKeJava s = new KoneksiKeJava();
        s.daftarDokter("d_005", "Dinos");
        // Melakukan koneksi ke database
        // harus dibungkus dalam blok try/catch
        

    }
}
