package com.nbcb.hadoop;


import java.io.IOException;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import com.sun.jersey.core.impl.provider.entity.XMLJAXBElementProvider.Text;

/**
 * 
 * @author athena
 *
 */
public class MaxTemperature {
	
	public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException{
		String inputPath = "";
		String outputPaht = "";
		
		
		Job job = new Job();
		job.setJarByClass(MaxTemperature.class);
		job.setJobName("Max Temperature");
		
		FileInputFormat.addInputPath(job, new Path(inputPath));
		FileOutputFormat.setOutputPath(job, new Path(outputPaht));
		
		
		job.setMapperClass(MaxTemperatureMapper.class);
		job.setReducerClass(MaxTemperatureReducer.class);
		
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(Text.class);
		
		boolean result = job.waitForCompletion(true);
		if(result){
			System.out.println("succ");
		}	else{
			System.out.println("fail");
		}
			
		
	}

}
