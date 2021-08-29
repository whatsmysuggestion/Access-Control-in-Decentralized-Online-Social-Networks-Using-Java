package key_distribution_center;

import java.math.*;
//import java.util.*;
//import java.security.*;
//import java.io.*;



public class Diffie_Hellman
{
	    	
    //Elgamal Encryption 
    public static String key_exchange(String c11,String xx, String pp)
        {
        	
        	BigInteger c1 = new BigInteger(c11);
        	
	        BigInteger p = new BigInteger(pp);
	        
	        BigInteger x = new BigInteger(xx);
	        
	        BigInteger k2 = c1.modPow(x, p);
	        
	                        
	        System.out.println("****************");
	        System.out.println("\n");
	        System.out.println("Signature");
	        System.out.println("K2= "+k2);
	        
	        System.out.println("\n");
	        System.out.println("****************");
	        
	        return k2.toString();
		 	
    	}


}

