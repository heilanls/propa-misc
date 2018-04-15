public class MandelbrotChecker {
    public static final class ComplexNumber {
        public double realPart, imaginaryPart;

        public ComplexNumber(final double realPart, final double imaginaryPart) {
            this.realPart = realPart;
            this.imaginaryPart = imaginaryPart;
        }
        
        public static ComplexNumber zero() {
            return new ComplexNumber(0, 0);
        }
        
        /**
         * compute the magnitude of a complex number
         */
        public static double magnitude(ComplexNumber c){
        	return Math.sqrt(Math.pow(c.realPart,2) + Math.pow(c.imaginaryPart, 2));
        }
        
        /**
         * square a complex number
         */
        public ComplexNumber square(){
        	double newRealPart = Math.pow(realPart, 2) - Math.pow(imaginaryPart, 2);
        	double newImaginaryPart = 2 * (realPart * imaginaryPart);
        	return new ComplexNumber(newRealPart, newImaginaryPart);
        }
        
        public static ComplexNumber add(ComplexNumber c1, ComplexNumber c2){
        	return new ComplexNumber(c1.realPart + c2.realPart, c1.imaginaryPart + c2.imaginaryPart);
        }
        
    }

    private final int maxSteps;
    public MandelbrotChecker(final int maxSteps) {
        this.maxSteps = maxSteps;
    }

    public int iterate(final ComplexNumber c) {
        ComplexNumber z = ComplexNumber.zero(); // Startwert
        int steps = 1;
        while ((ComplexNumber.magnitude(z) <= 2) && steps < maxSteps) {
			z = ComplexNumber.add(z.square(), c);
			steps++;
		}
        if(ComplexNumber.magnitude(z) > 2) return steps;
        return maxSteps + 1;
    }
}
