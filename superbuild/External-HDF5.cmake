message( "External project - HDF5" )

ExternalProject_add(HDF5
  SOURCE_DIR ${CMAKE_BINARY_DIR}/HDF5
  BINARY_DIR ${CMAKE_BINARY_DIR}/HDF5-build
  URL http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.13/src/hdf5-1.8.13.tar.gz
  UPDATE_COMMAND ""
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=${BUILD_TYPE}
    -DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=OFF
    -DHDF5_BUILD_CPP_LIB:BOOL=ON
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DHDF5_BUILD_TOOLS:BOOL=OFF
    -DCMAKE_INSTALL_PREFIX:PATH=${INSTALL_DEPECENCIES_DIR}
  INSTALL_DIR ${INSTALL_DEPECENCIES_DIR}
)
if (WIN32)
  set( HDF5_DIR ${INSTALL_DEPECENCIES_DIR}/cmake/hdf5/ )
  add_custom_command(TARGET HDF5
                   POST_BUILD
				   COMMAND ${CMAKE_COMMAND} 
				   -D INSTALL_DEPECENCIES_DIR=${INSTALL_DEPECENCIES_DIR}
				   -P ${CMAKE_CURRENT_SOURCE_DIR}/normalize_hdf5_lib_names.cmake
                   COMMENT "normalizing hdf5 library filename")
else ()
  set( HDF5_DIR ${INSTALL_DEPECENCIES_DIR}/share/cmake/hdf5/ )
endif ()

