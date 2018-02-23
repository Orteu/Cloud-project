package com.iesemilidarder.projectozero.utils;

import com.iesemilidarder.projectozero.beans.Opinio;
import com.iesemilidarder.projectozero.beans.Restaurant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

/**
 * Llegeix la base de dades que està ubicada a la IP indicada "35.205.41.45:1521"
 */


public class ReadDB {

       public final static String DRIVER="oracle.jdbc.driver.OracleDriver";
    public final static String THIN_URL="jdbc:oracle:thin:@35.205.41.45:1521:XE";
    public final static String USER="usuari";
    public final static String PASSWORD="usuari";


    // Functional method

    private Object executeQuery(String sql, Function<ResultSet, Object> function){

        Connection con;
        Statement statement;
        try {

            Class.forName(DRIVER);
            con = DriverManager.getConnection(THIN_URL, USER, PASSWORD);
            statement = con.createStatement();

            ResultSet rs = statement.executeQuery(sql);
            Object o = function.apply(rs);
            statement.close();
            con.close();

            return o;

        }catch(Exception e){
            return null;
        }
    }
        

    private static Restaurant getRestaurantFromDB(ResultSet rs) {

        try {

            String code = rs.getString("RES_CODI");
            String name = rs.getString("RES_NOM");
            String address = rs.getString("RES_ADRECA");
            String website = rs.getString("RES_WEB");
            String numero = rs.getString("RES_TELEFON");
            String type = rs.getString("TRS_DESCRIPCIO");
            String images = rs.getString("RES_URL_IMG");
            String mitjana = rs.getString("RES_MITJANA");


            Restaurant restaurant = new Restaurant();
            restaurant.setCode(code);
            restaurant.setName(name);
            restaurant.setAddress(address);
            restaurant.setWebsite(website);
            restaurant.setNumero(numero);
            restaurant.setType(type);
            restaurant.setImages(images);
            restaurant.setMitjana(mitjana);
            return restaurant;
        } catch (Exception e) {
            return null;
        }


    }

    public ArrayList readRestaurant(String search) {
        ArrayList arrayRestaurants = new ArrayList();
        try {

            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(THIN_URL, USER, PASSWORD);

            Statement stmt = con.createStatement();

// Aquí feim una Query directament a la base de dades:

            ResultSet rs = stmt.executeQuery
                    ("SELECT R.RES_CODI,R.RES_NOM,R.RES_ADRECA,R.RES_WEB,R.RES_TELEFON,R.RES_URL_IMG,R.RES_MITJANA, TR.TRS_DESCRIPCIO FROM " +
                            "RESTAURANTS R,TRESTAURANTS TR WHERE ROWNUM <= 5 AND R.RES_TRS_CODI = TR.TRS_CODI ORDER BY RES_MITJANA DESC");

            // I aquí indicam que mentres hi hagi mes restaurants, segueixi impriment-los.

            if (search != null) {
                rs = stmt.executeQuery
                        ("SELECT R.RES_CODI,R.RES_NOM,R.RES_ADRECA,R.RES_WEB,R.RES_TELEFON,R.RES_URL_IMG,R.RES_MITJANA, TR.TRS_DESCRIPCIO " +
                                "FROM RESTAURANTS R,TRESTAURANTS TR WHERE R.RES_TRS_CODI = TR.TRS_CODI" +
                                " AND LOWER (RES_NOM) LIKE '%" + search.toLowerCase() + "%'");
            }


            while (rs.next()) {

                Restaurant restaurant = getRestaurantFromDB(rs);

                arrayRestaurants.add(restaurant);
            }

            stmt.close();
            con.close();


        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return arrayRestaurants;


    }





    public static Restaurant readRestaurantInfo(String id) {
        Restaurant restaurant = null;

        try {
            // Preparació de la Query
            String sql = "SELECT R.RES_CODI,R.RES_NOM,R.RES_ADRECA,R.RES_WEB,R.RES_TELEFON,R.RES_URL_IMG,R.RES_MITJANA, TR.TRS_DESCRIPCIO " +
                         "FROM RESTAURANTS R,TRESTAURANTS TR " +
                         "WHERE TR.TRS_CODI=R.RES_TRS_CODI AND R.RES_CODI='" + id + "'";

            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(THIN_URL, USER, PASSWORD);

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                restaurant = getRestaurantFromDB(rs);

            }
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return restaurant;

    }


    public ArrayList readOpinions(String id) {

        ArrayList arrayOpinions = new ArrayList();

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@35.205.41.45:1521:XE", "usuari", "usuari");

            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(
                    "SELECT O.OPI_OBSERVACIO, O.OPI_PUNTUACIO, U.USU_NOM FROM OPINIONS O\n" +
                            "JOIN USUARIS U ON U.USU_CODI = O.OPI_USU_CODI\n" +
                            "JOIN RESTAURANTS R ON O.OPI_RES_CODI = R.RES_CODI\n" +
                            "WHERE R.RES_CODI = '" + id + "'"

            );

            while (rs.next()) {

                String opinio = rs.getString("OPI_OBSERVACIO");
                String user = rs.getString("USU_NOM");
                String puntuacio = rs.getString("OPI_PUNTUACIO");


                Opinio opn = new Opinio();

                opn.setOpinio(opinio);
                opn.setUser(user);
                opn.setPuntuacio(puntuacio);


                arrayOpinions.add(opn);

            }
            stmt.close();
            con.close();


        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return arrayOpinions;
    }


    public static List readRestaurantAPI() {
       List<Restaurant> arrayRestaurants = new ArrayList<>();

       // VERSION GENERICS
        try {
            // Query prepared;
            String sql = "SELECT R.RES_CODI,R.RES_NOM,R.RES_ADRECA,R.RES_WEB,R.RES_TELEFON,R.RES_URL_IMG,R.RES_MITJANA, TR.TRS_DESCRIPCIO " +
                         "FROM RESTAURANTS R,TRESTAURANTS TR " +
                         "WHERE  R.RES_TRS_CODI = TR.TRS_CODI";

            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(THIN_URL, USER, PASSWORD);
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            ResultSetMapper<Restaurant> mapper = new ResultSetMapper<>();
            arrayRestaurants = mapper.mapRersultSetToObject(rs,Restaurant.class);
            stmt.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return arrayRestaurants;


    }


}






