package key_distribution_center;

import java.math.*;
//import java.util.*;
//import java.security.*;
//import java.io.*;



public class Elgamal_Encryption
{
	    	
    //Elgamal Encryption 
    public static String encrypt(String mx,String cc, String pp, String bb, String s)
        {
        	//final String ekey;
        	
        	
        	BigInteger myx = new BigInteger(mx);
        	
        	BigInteger m = new BigInteger(s);
        	
	        BigInteger y = new BigInteger(cc);
	        
	        BigInteger p = new BigInteger(pp);
	        
	        BigInteger g = new BigInteger(bb);
	        
	        BigInteger k = y.modPow(myx, p);
	        
	        BigInteger c1 = g.modPow(myx, p);
	        
	        BigInteger c2 = (m.multiply(k)).mod(p);
	        
	                
	        System.out.println("****************");
	        System.out.println("Encryption by Sender ");
	        System.out.println("\n");
	        System.out.println("Signature: ="+k);
	        System.out.println("Cipher Key C1: ="+c1);
	        System.out.println("Cipher Key C2: ="+c2);
	        System.out.println("\n");
	        System.out.println("****************");
	        
	        return k.toString()+","+c1.toString()+","+c2.toString();
		 	
    	}


}

