import java.lang.reflect.Modifier;

public class Subtypes {

	// BEGIN Fügen Sie hier Ihre Typdefinitionen ein
	// public static ... {}

	public static interface S {} // 2
	public static interface K extends S {}  // 10
	public static interface U extends S {} // 4
	public static interface V extends U {}  // 4, 5
	public static interface M extends V {}  // 9, 10

	public static abstract class R implements S {}  // 7
	public static abstract class T extends R {}  // 3, 5, 7

	public static class P extends R implements U {} // 3, 5, 8
	public static final class Q extends T implements U {} // 3, 5, 6, 8, 10

	/*
	* 

	*/

	// END Fügen Sie hier Ihre Typdefinitionen ein
}
