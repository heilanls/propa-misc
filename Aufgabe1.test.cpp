#include <iostream>
#include "array.h"


// Diese Datei wird NICHT abgegeben, daher können Sie hier nach belieben testen
int main(int argc, char** argv) {

  Array<int, -2, 1> arr;
  // Array<int, 1, -1> arrError; <- das darf nicht compilieren

  arr[-1] = 42;

  std::cout << "arr.length = " << arr.length << std::endl; // 4
  std::cout << "arr[-1] = " << arr[-1] << std::endl; // 42

  for(int i : arr)
    std::cout << "arr -> " << i << std::endl; // 0, 42, 0, 0

  return 0;
}
