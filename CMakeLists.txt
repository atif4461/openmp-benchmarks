cmake_minimum_required(VERSION 3.25)

project(OpenMP-target-offload-benchmarks VERSION 0.0.1 LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CUDA_STANDARD 14)

# Add OpenMP
find_package(OpenMP REQUIRED)
if(OPENMP_FOUND)
  set(OpenMP_OPT_FLAGS "${OpenMP_OPT_FLAGS} -fopenmp-cuda-mode")
  set(OpenMP_OPT_FLAGS "${OpenMP_OPT_FLAGS} -foffload-lto")
  set(OpenMP_OPT_FLAGS "${OpenMP_OPT_FLAGS} -fopenmp-assume-no-thread-state")
  #set(OpenMP_OPT_FLAGS "${OpenMP_OPT_FLAGS} -fopenmp-assume-no-nested-parallelism")
  #set(OpenMP_OPT_FLAGS "${OpenMP_OPT_FLAGS} -maxrregcount=64")
  #set(OpenMP_OPT_RMRKS "-Rpass=openmp-opt -Rpass-analysis=openmp-opt -Rpass-missed=openmp-opt " )
  #set(OpenMP_DBG_FLAGS "-fopenmp-target-debug=0x5" )
  set(OpenMP_FLAGS "-fopenmp --offload-arch=sm_86 ") 
  #set(OpenMP_FLAGS "-fopenmp --offload-arch=gfx906") ##lambda3
  ##set(OpenMP_FLAGS "-mp=gpu -gpu=cc86 -cuda -Minfo=mp") ## for nvc++
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_FLAGS} ${OpenMP_OPT_FLAGS} ${OpenMP_OPT_RMRKS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_FLAGS} ${OpenMP_OPT_FLAGS} ${OpenMP_OPT_RMRKS}")
else()
  message(WARNING "Configuring without OpenMP!")
endif()

find_package(CUDA REQUIRED)

include_directories(include)

add_subdirectory(src)
add_subdirectory(saxpy)
add_subdirectory(array_init)
add_subdirectory(atomic_update)
add_subdirectory(atomic_capture)
