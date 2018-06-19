import java.lang.reflect.Modifier;

public class Subtypes {

	// BEGIN Fügen Sie hier Ihre Typdefinitionen ein
	// public static ... {}

	interface S {} // 2
	interface K extends S {}  // 10
	interface U extends S {} // 4
	interface V extends U {}  // 4, 5
	interface M extends V {}  // 9, 10

	abstract class R implements S {}  // 7
	abstract class T extends R {}  // 3, 5, 7

	class P extends R implements U {} // 3, 5, 8
	final class Q extends T implements U {} // 3, 5, 6, 8, 10

	/*
	* 

	*/

	// END Fügen Sie hier Ihre Typdefinitionen ein
}
