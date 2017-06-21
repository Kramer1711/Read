package com.kramer.util;

public class ThisSystemUtil {

	public static boolean isNone(String s){
		return s==null||(s.trim()).length()==0;
	}
	
	public static int parseInt(String s,int defaultValue){
		try{
			int value=Integer.parseInt(s);
			return value;
		}catch(Exception e){
			return defaultValue;	
		}
	}
	public static int totalPage(int total,int pageSize){
		int page=total/pageSize;
		if(total%pageSize!=0){
			page++;
		}
		return page;
	}
}
