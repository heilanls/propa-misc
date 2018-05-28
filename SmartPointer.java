interface Freeable {
    default void free() {
        System.out.println(this + " is now free!");
    }
}

final public class SmartPointer<T extends Freeable> {
   
   private T target;
   
    /**
     * @return a SmartPointer pointing to a newly allocated T.
     */
    public static <T extends Freeable> SmartPointer<T> make(T target) throws IllegalArgumentException{
       if(target instanceof Freeable){
          SmartPointer<T> sp = new SmartPointer<>();
          sp.target = target;
          return sp;  
       }else{ 
         throw new IllegalArgumentException();
       }
    }

    /**
     * @return a SmartPointer pointing to nothing.
     */
    public static <T extends Freeable> SmartPointer<T> nullPointer(){
      return new SmartPointer<T>(); 
    }

    /**
     * @return true if X is a NullPointer
     */
    public boolean isNull(){
      return (this.target == null);
    }

    /**
     * @return the target of this pointer or null if isNull()
     */
    public T get(){
       if(!isNull()) return target;
       else return null;
    }

    /**
     * After assigning this, to Points to the same Object as from
     */
    public void assign(SmartPointer<T> to){
       this.target = to.target;
    }

    /**
     * Releases the pointer. Afterwards, X is a NullPointer.
     */
    public void release(){
       target.free();
       target = null;
    }

    /**
     * Prints the Object, that this points to. Prints an error message if
     * isNull().
     */                                                                                                                     
    @Override
    public String toString(){
       if(!isNull()){
          System.out.println(target.toString());
          return target.toString();
       }else{
          throw new NullPointerException();
       }
    }
}
