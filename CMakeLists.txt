cmake_minimum_required(VERSION 3.25)

project(OpenMP-target-offload-benchmarks VERSION 0.0.1 LANGUAGES CXX )

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CUDA_STANDARD 14)

# Add OpenMP
find_package(OpenMP REQUIRED)
if(OPENMP_FOUND)
  set(OpenMP_FLAGS "-fopenmp -fopenmp -foffload=amdgcn-amdhsa=\"-march=gfx906\" -foffload-options=-lm ") 
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_FLAGS} ${OpenMP_OPT_FLAGS} ${OpenMP_OPT_RMRKS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_FLAGS} ${OpenMP_OPT_FLAGS} ${OpenMP_OPT_RMRKS}")
else()
  message(WARNING "Configuring without OpenMP!")
endif()

#find_package(CUDA REQUIRED)

include_directories(include)

add_subdirectory(src)
add_subdirectory(saxpy)
add_subdirectory(array_init)
add_subdirectory(atomic_update)
add_subdirectory(atomic_capture)
