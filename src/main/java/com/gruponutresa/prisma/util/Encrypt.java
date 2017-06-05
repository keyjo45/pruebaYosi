package com.gruponutresa.prisma.util;

import java.nio.charset.Charset;
import com.google.common.hash.Hashing;

public final class  Encrypt {
	
	private Encrypt(){
		//constructor
	}
	
	public static String encryptPassword(String pass){
		return Hashing.sha256().hashString(pass, Charset.defaultCharset()).toString();
	}
}
