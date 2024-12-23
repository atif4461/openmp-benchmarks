#define CATCH_CONFIG_ENABLE_BENCHMARKING
#ifndef CATCH_CONFIG_ENABLE_BENCHMARKING 
#endif

#include <cstdlib>
#include <iostream>
#include <ctime>
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_bench.cuh>
#include <catch2/catch_test_macros.hpp>
#include <catch2/benchmark/catch_benchmark.hpp>
#include <common.hpp>

namespace cuda_bench {

template double* atomic_update_wrapper <double> ( const int, const int );
template float*  atomic_update_wrapper <float>  ( const int, const int );
template int*    atomic_update_wrapper <int>    ( const int, const int );
	
template<typename T>
__global__ void get_residual ( T* res, T* data, const int size ) {

  int i = blockIdx.x * blockDim.x + threadIdx.x;
  
  if ( i == 0 ) res[i] = 0.;

  if(i < size) {
    atomicAdd( res, data[i]);
  }
}

template<typename T>
__host__ T* atomic_update_wrapper ( const int N, const int blocksize ) {

  int threads_tot = N;
  int nblocks     = ( threads_tot + blocksize - 1 ) / blocksize;

  T epsilon = common::get_epsilon <T> ();

  T* data = (T*)malloc(sizeof(T) * N);

  for(int i=0; i<N; i++) {
    data[i] = common::initialize_random ( epsilon );
  }

  T res = 0.0;
  for(int i=0; i<N; i++)
    res += data[i];
  res = (double) res / (double) N;

  T* data_d;
  cudaMalloc((void**)&data_d, sizeof(T) * N);
  cudaMemcpy(data_d, data, sizeof(T) * N, cudaMemcpyHostToDevice);

  T* res_d;
  cudaMalloc((void**)&res_d, sizeof(T) );
  
  //get_residual<<<nblocks,blocksize>>> ( res_d, data_d, N );  
  //BENCHMARK("CUDA") { return get_residual<<<nblocks, blocksize>>> ( res_d, data_d, N ); };
 
  BENCHMARK_ADVANCED("CUDA Atomic Update")(Catch::Benchmark::Chronometer meter) {
    cudaMemset( res_d, 0, sizeof(T) );
    meter.measure([res_d, data_d, N, nblocks, blocksize] 
    { return get_residual<<<nblocks, blocksize>>> ( res_d, data_d, N ); });
    cudaDeviceSynchronize() ;
  };
 
  T res_h = 0.0;
  cudaMemcpy(&res_h, res_d, sizeof(T), cudaMemcpyDeviceToHost);
  res_h = (double) res_h / (double) N;

  CHECK ( std::fabs(  res_h - res ) <= epsilon );
//  std::cout << res_h << " " << res << std::endl;

  return data;

}


} //namespace cuda_bench
