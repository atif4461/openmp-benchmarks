#include <hip/hip_runtime.h>
#include <hip_bench.h>
#include <catch.hpp>

namespace hip_bench {

/*******************/	
/* Array size 2^16 */
/*******************/	

TEST_CASE("HIP Atomic Update 2^6 128"){

  const int N = 4096*16; 
  const int blocksize = 128;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^6 256"){

  const int N = 4096*16; 
  const int blocksize = 256;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^6 512"){

  const int N = 4096*16; 
  const int blocksize = 512;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^6 1024"){

  const int N = 4096*16; 
  const int blocksize = 1024;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

/*******************/	
/* Array size 2^20 */
/*******************/	

TEST_CASE("HIP Atomic Update 2^20 128"){

  const int N = 4096*256; 
  const int blocksize = 128;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^20 256"){

  const int N = 4096*256; 
  const int blocksize = 256;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^20 512"){

  const int N = 4096*256; 
  const int blocksize = 512;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^20 1024"){

  const int N = 4096*256; 
  const int blocksize = 1024;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

/*******************/	
/* Array size 2^24 */
/*******************/	

TEST_CASE("HIP Atomic Update 2^24 128"){

  const int N = 4096*4096; 
  const int blocksize = 128;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^24 256"){

  const int N = 4096*4096; 
  const int blocksize = 256;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^24 512"){

  const int N = 4096*4096; 
  const int blocksize = 512;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^24 1024"){

  const int N = 4096*4096; 
  const int blocksize = 1024;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

/*******************/	
/* Array size 2^28 */
/*******************/	

TEST_CASE("HIP Atomic Update 2^28 128"){

  const int N = 4096*4096*16; 
  const int blocksize = 128;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^28 256"){

  const int N = 4096*4096*16; 
  const int blocksize = 256;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^28 512"){

  const int N = 4096*4096*16; 
  const int blocksize = 512;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("HIP Atomic Update 2^28 1024"){

  const int N = 4096*4096*16; 
  const int blocksize = 1024;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}




} //namespace hip_bench
