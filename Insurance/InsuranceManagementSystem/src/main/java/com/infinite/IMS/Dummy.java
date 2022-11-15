package com.infinite.IMS;

public class Dummy {
public static void main(String[] args) {
	PolicyDAO dao=new PolicyDAO();
	System.out.println(dao.searchById("P001"));
}
}
