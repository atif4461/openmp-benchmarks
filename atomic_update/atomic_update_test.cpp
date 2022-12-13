#include <openmp_bench.h>
#include <catch.hpp>
#include <omp.h>

namespace openmp_bench {

/*******************/	
/* Array size 2^12 */
/*******************/	

TEST_CASE("OpenMP Atomic Update, 2^12, 128"){

  const std::size_t N = 4096; 
  const std::size_t blocksize = 128;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^12, 256"){

  const std::size_t N = 4096; 
  const std::size_t blocksize = 256;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^12, 512"){

  const std::size_t N = 4096; 
  const std::size_t blocksize = 512;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^12, 768"){

  const std::size_t N = 4096; 
  const std::size_t blocksize = 768;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

/*******************/	
/* Array size 2^18 */
/*******************/	

TEST_CASE("OpenMP Atomic Update, 2^18, 128"){

  const std::size_t N = 4096*64; 
  const std::size_t blocksize = 128;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^18, 256"){

  const std::size_t N = 4096*64; 
  const std::size_t blocksize = 256;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^18, 512"){

  const std::size_t N = 4096*64; 
  const std::size_t blocksize = 512;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^18, 768"){

  const std::size_t N = 4096*64; 
  const std::size_t blocksize = 768;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

/*******************/	
/* Array size 2^24 */
/*******************/	

TEST_CASE("OpenMP Atomic Update, 2^24, 128"){

  const std::size_t N = 4096*4096; 
  const std::size_t blocksize = 128;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^24, 256"){

  const std::size_t N = 4096*4096; 
  const std::size_t blocksize = 256;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^24, 512"){

  const std::size_t N = 4096*4096; 
  const std::size_t blocksize = 512;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}

TEST_CASE("OpenMP Atomic Update, 2^24, 768"){

  const std::size_t N = 4096*4096; 
  const std::size_t blocksize = 768;
  double* temp1 = atomic_update_wrapper <double> ( N, blocksize );  
  float*  temp2 = atomic_update_wrapper <float>  ( N, blocksize );  
  int*    temp3 = atomic_update_wrapper <int>    ( N, blocksize );  
}


} //namespace openmp_bench