package com.kramer.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Chapter {
	public static void main(String[] args) throws IOException {
		InputStream f = new FileInputStream("C:/Users/Kramer/Downloads/遮天/遮天.txt");
		InputStreamReader reader = new InputStreamReader(f,"GBK");
		StringBuffer buffer = new StringBuffer();
		char[] numbers = {'零','一','二','三','四','五','六','七','八','九','十'};
		while(reader.ready()){
			buffer.append((char)reader.read());
		}
		System.out.println(buffer.toString());
		reader.close();
		f.close();
		System.out.println("总字数："+buffer.length());
	}
}
