package com.nbcb.hadoop;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;;

public class MaxTemperatureReducer extends Reducer<Text, IntWritable, Text, IntWritable>{
	
	
	public void reduce(){
		
	}

}
