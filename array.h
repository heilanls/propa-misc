#include <iterator>
#include <math.h>
using namespace std;

/**
 * Ein Array vom Typ T mit Indices in [L; H].
 */
template<typename T, int L, int H>
class Array {

  static_assert(H>L, "lower bound is greater than upper bound!");

  public:
    static const size_t length = (H > 0 && L > 0)||(H < 0 && L < 0) ? (abs(H) - abs(L)) : (abs(H) + abs(L) + 1);
    T internalArray[length];

    T& operator [](int x){
      
      if (x > internalArray.length || x < L) {
        throw "index out of bounds!";
      }
      else {
        int newIndex = abs(L) + x;
        return internalArray[newIndex];
      }
      
    }
};
