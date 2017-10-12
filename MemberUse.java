import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberUse {
	public void saveUserData(MemberData memberData) {
		Connection connection = DatabaseConnect.getconnection();
		String sql = "insert into memberData(member_name, member_Email, member_password) values(?, ?, ?)";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberData.getMember_name());
			preparedStatement.setString(2, memberData.getMember_Email());
			preparedStatement.setString(3, memberData.getMember_password());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DatabaseConnect.closeConnection(connection);
		}
	}
	
	public MemberData login(String member_Email, String member_password) {
		MemberData memberData = null;
		Connection connection = DatabaseConnect.getconnection();
		String sql = "select * from memberData where member_Email=? and member_password=?";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, member_Email);
			preparedStatement.setString(2, member_password);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				memberData = new MemberData();
				memberData.setMember_name(resultSet.getString("member_name"));
				memberData.setMember_Email(resultSet.getString("member_Email"));
				memberData.setMember_password(resultSet.getString("member_password"));
			}
			
			resultSet.close();
			preparedStatement.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DatabaseConnect.closeConnection(connection);
		}
		
		return memberData;
	}
	
	public boolean userIsExist(String member_name) {
		Connection connection = DatabaseConnect.getconnection();
		String sql = "select * from memberData where member_name=?";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, member_name);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(!resultSet.next()) {
				return true;
			}
			
			resultSet.close();
			preparedStatement.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DatabaseConnect.closeConnection(connection);
		}
		
		return false;
	}
}
