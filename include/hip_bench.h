#pragma once

#include <iostream>
#include <hip/hip_runtime.h>

namespace hip_bench {

template <typename T>
__global__ void set_to_zero( T* hip_dev_array, const int N );

template <typename T>
__host__ T* set_to_zero_wrapper ( const int N, const int blocksize );

template <typename T>
__global__ void collect_pos( T* hip_dev_array, T* hip_dev_array_pos, int* ct, const int N );

template <typename T>
__host__ T* atomic_capture_wrapper ( const int N, const int blocksize);

template <typename T>
__host__ T* atomic_update_wrapper ( const int N, const int blocksize);

template <typename T>
__host__ T* saxpy_wrapper ( const int N, const int blocksize);


} // namespace hip_bench

