class Switch {
  public static void main(String[] args) {
    String[] newargs = {"r", "i"};
    args = newargs;
    int result = 0;
    {
        // fügen Sie Code nur in diesen Block ein
        int qCounter = 1;
        int vCounter = 0;

        for (String arg : args) {
          switch (arg) {
            case "r":
              result = 3;
              vCounter++;
              break;

            case "k":
              result = 1;
              vCounter++;
              break;

            case "i":
              result++;
              vCounter++;
              break;

            case "h":
              result /= 2;
              vCounter++;
              break;

            case "t":
              result *= 3;
              vCounter++;
              break;

            case "q":
              qCounter++;
              result += qCounter;
              vCounter++;
              break;

            case "v":
              result -= vCounter;
              break;

            default:
              break;
          }
        }
      System.out.println(result);
    }
  }
}