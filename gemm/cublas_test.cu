#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_bench.cuh>
#include <catch.hpp>

namespace cuda_bench {

/*******************/	
/* Array size 2^12 */
/*******************/	

TEST_CASE("cuBLAS GEMM 512x512x512"){

  const int M = 512; 
  const int N = 512; 
  const int K = 512; 
  //double* temp1 = cublas_wrapper <double> (M, N, K);  
  float*  temp2 = cublas_wrapper <float>  (M, N, K);  
  //int*    temp3 = reduction_wrapper <int>    ( N, blocksize );  
}

} // namespace cuda_bench
