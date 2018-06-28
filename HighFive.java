import java.util.Arrays;
import java.util.stream.Stream;

class HighFive {
  enum R { High, Low }
  /* Methode f */
  private static R f(String s){		
		return s.equalsIgnoreCase("high") ? R.High : R.Low;
	}

  public static void main(String[] args){
    final Stream<R> rs = Arrays.stream(args).map(HighFive::f);
		rs.forEach( r -> { 
			if(r == R.High) System.out.println("high!");
			else System.out.println("\n");
			});
  }
}
