#include <openmp_bench.h>
#include <catch.hpp>

namespace openmp_bench {

/*******************/	
/* Array size 2^12 */
/*******************/	

TEST_CASE("OMP GEMM 4x4x4"){

  const int M = 5; 
  const int N = 4; 
  const int K = 3; 
  double* temp1 = gemm_wrapper <double> (M, N, K);  
  //float*  temp2 = reduction_wrapper <float>  ( M, N, K );  
  //int*    temp3 = reduction_wrapper <int>    ( N, blocksize );  
}

} // namespace 
