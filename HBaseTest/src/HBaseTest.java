import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.MasterNotRunningException;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.HBaseAdmin;


public class HBaseTest {
	
	
	
	public static Configuration configuration;
	
	
	static {
		configuration = HBaseConfiguration.create();
		configuration.set("hbase.master", "172.16.198.133:9000");
		configuration.set("hbase.zookeeper.quorum", "172.16.198.133"); 
	}
	
	
	
	public static void main(String[] args) throws MasterNotRunningException, ZooKeeperConnectionException, IOException{
		System.out.println("start using HBase!");
		
		createTable();
		
	}
	
	// 创建表
	public static void createTable(){
		
		try{
			String tableName = "myTable1";
			// create table
			
			HBaseAdmin hBaseAdmin = new HBaseAdmin(configuration);
			if(hBaseAdmin.tableExists(tableName)){
				System.out.println("table exists!");
			}
			
			HTableDescriptor tableDescripter = new HTableDescriptor(tableName);
			tableDescripter.addFamily(new HColumnDescriptor("column1"));
			tableDescripter.addFamily(new HColumnDescriptor("column2"));
			tableDescripter.addFamily(new HColumnDescriptor("column3"));
			
			hBaseAdmin.createTable(tableDescripter);
			System.out.println("Create HBase table succ!");
		}catch(Exception e){
			System.out.println("Create HBase table error");
			e.printStackTrace();
			
		}
	}
	
	// 插入数据
	public static void insert(){
		
	}
	

}
