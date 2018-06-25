
import java.util.Iterator;

final public class Array<T> implements Iterable<T> {

    private int lowerBound;
    private int higherBound;
    private T[] myArray;

    public Array(int L, int H) {
        lowerBound = L;
        higherBound = H;

        myArray = (T[]) new Object[this.length()];
    }

    public T get(int index) {
        return myArray[index - lowerBound];
    }

    public void set(int index, T v) {
        myArray[index - lowerBound] = v;
    }

    public int length() {
        return Math.abs(higherBound - lowerBound) + 1;
    }

    @Override
    public Iterator<T> iterator() {
        Iterator<T> myIterator = new Iterator<T>() {
            private int currentIndex = 0;

            @Override
            public boolean hasNext() {
                return currentIndex < length();
            }

            @Override
            public T next() {
                return myArray[currentIndex++];
            }

            @Override
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
        return myIterator;
    }

    // zu Testzwecken
    public static void main(String[] args) {
        Array<Integer> arr = new Array(-2, 1); //raw type warning (Array) + unchecked conversion
        // Array<Integer> arr = new Array(1, -1) arrError; <- Laufzeitfehler

        arr.set(-1, 42);

        System.out.println("arr.length = " + arr.length()); // 4
        System.out.println("arr[-1] = " + arr.get(-1)); // 42

        for (Integer i : arr) {
            System.out.println("arr -> " + i); // null, 42, null, null
        }
        for (int i : arr) {
            System.out.println("arr -> " + i); // NPE
        }
    }
}