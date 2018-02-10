import java.net.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.InputStream;

public class GetWebpage {
  public static void main(String args[]) throws Exception{

	  URL web = new URL(args[0]);				
	  InputStream is = web.openStream();										
	  BufferedReader in= new BufferedReader(new InputStreamReader(is));					
	  String line;
	  while ((line = in.readLine()) != null)
	  {
		System.out.println(line);
	  }
	  in.close();
       
    }
}