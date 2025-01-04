package com.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.user.model.User;

public class UserDAO {
    private String jdbcURL="jdbc:mysql://localhost:30006/userappdb";
    private String jdbcUserName="root";
    private String jdbcPassword="root";
    private static final String INSERT_USER_SQL="INSERT INTO users"+" (uname, email, country, passwd) VALUES "+"(?,?,?,?);";
    private static final String SELECT_USER_BY_ID="SELECT * FROM USERS WHERE ID=?;";
    private static final String SELECT_ALL_USERS="SELECT * FROM USERS;";
    private static final String DELETE_USERS_SQL="DELETE FROM USERS WHERE ID=?;";
    private static final String UPDATE_USERS_SQL="UPDATE USERS SET UNAME=?, EMAIL=?, COUNTRY=?, PASSWORD=? where ID=?;";
    
    public UserDAO() {
        super();  
        // TODO Auto-generated constructor stub 
    }

    public Connection getConnection()
    {
        Connection connection=null;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        }
            catch(SQLException | ClassNotFdException e)
        {
            e.printStackTrace();
        }
        catch(Exception e)
        { 
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(User user)
    {
        UserDAO dao=new UserDAO();
        try(Connection connection=dao.getConnection())
        {
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USER_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString,user.getEmail());
            preparedStatement.setString(3,user.getCountry()); 
            preparedStatement.setString(4,user.getPassword());
            preparedStatement.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }


public User selectUser(int id)
{
User user=new User();
UserDAO dao-new UserDAO();
try (Connection connection=dao.getConnection())
{
PreparedStatement preparedStatement-connection.prepareStatement (SELECT_USER_BY_ID); preparedStatement.setInt(1, id);
ResultSet resultSet-prepa Statement.executeQuery();
while(resultSet.next())
{
user.setId(id);
user.setName(resultSet.getString("uname"));
user.setEmail (resultSet.getString("email")); user.setCountry(resultSet.getString("country"));
user.setPassword (resultSet.getString("passwd"));
}
catch (Exception e) {
e.printStackTrace();
}
