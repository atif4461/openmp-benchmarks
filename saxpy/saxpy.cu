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

template double* saxpy_wrapper <double> ( const int, const int );
template float*  saxpy_wrapper <float>  ( const int, const int );
template int*    saxpy_wrapper <int>    ( const int, const int );
	
template<typename T>
__global__ void saxpy_kernel ( T* result_dev, T* data_x_dev, T* data_y_dev, const T fact, const int size ) {

  int i = blockIdx.x * blockDim.x + threadIdx.x;
  
  if(i < size) {
    result_dev[i] = data_y_dev[i] + fact * data_x_dev[i];
  }
}

template<typename T>
__host__ T* saxpy_wrapper ( const int N, const int blocksize ) {

  int threads_tot = N;
  int nblocks     = ( threads_tot + blocksize - 1 ) / blocksize;

  const T epsilon = common::get_epsilon <T> ();

  T* data_x      = (T*)malloc(sizeof(T) * N);
  T* data_y      = (T*)malloc(sizeof(T) * N);
  T* result_host = (T*)malloc(sizeof(T) * N);

  const T fact = common::initialize_random ( epsilon );
  T* data_x_dev;
  T* data_y_dev;
  T* result_dev;
  cudaMalloc((void**)&data_x_dev, sizeof(T) * N);
  cudaMalloc((void**)&data_y_dev, sizeof(T) * N);
  cudaMalloc((void**)&result_dev, sizeof(T) * N);


  BENCHMARK_ADVANCED("CUDA saxpy")(Catch::Benchmark::Chronometer meter) {
    for(int i=0; i<N; i++)
    {
      data_x[i] = common::initialize_random ( epsilon );
      data_y[i] = common::initialize_random ( epsilon );
    }
   
    cudaMemcpy(data_x_dev, data_x, sizeof(T) * N, cudaMemcpyHostToDevice);
    cudaMemcpy(data_y_dev, data_y, sizeof(T) * N, cudaMemcpyHostToDevice);
   
    //BENCHMARK("CUDA") { return saxpy_kernel<<<nblocks, blocksize>>> ( result_dev, data_x_dev, data_y_dev, fact, N ); };
    meter.measure( [result_dev, data_x_dev, data_y_dev, fact, N, nblocks, blocksize]
    { return saxpy_kernel<<<nblocks, blocksize>>> ( result_dev, data_x_dev, data_y_dev, fact, N ); });	    
    cudaDeviceSynchronize() ;
    cudaMemcpy(result_host, result_dev, sizeof(T) * N, cudaMemcpyDeviceToHost);
  
    for(int i = 0; i < N; i++) {
      CHECK ( std::fabs(  result_host[i] - ( data_y[i] + fact * data_x[i]  ) ) <= epsilon );
    }
  };

  return data_x;

}


} //namespace cuda_bench
