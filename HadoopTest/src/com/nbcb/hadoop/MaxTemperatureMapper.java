package com.nbcb.hadoop;

import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;

public class MaxTemperatureMapper  extends Mapper<LongWritable,Text,Text,IntWritable>{
	
	public void map(LongWritable key, Text value, Context context){
		
	}
	

}
