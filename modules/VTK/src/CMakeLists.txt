add_library( statismo_VTK ${statismo_LIB_TYPE}
  vtkStandardMeshRepresenter.cxx
  vtkUnstructuredGridRepresenter.cxx
)
target_link_libraries( statismo_VTK
  statismo_core
  ${VTK_LIBRARIES}
)

set_target_properties( statismo_VTK PROPERTIES
  DEBUG_POSTFIX "-d"
  VERSION "${statismo_LIB_VERSION}"
  SOVERSION "${statismo_LIB_SOVERSION}"
)

include(GenerateExportHeader)
generate_export_header(statismo_VTK EXPORT_FILE_NAME StatismoVTKExport.h)

set(statismo_VTK_EXPORT_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR} CACHE INTERNAL "" FORCE)
include_directories(${statismo_VTK_EXPORT_INCLUDE_DIR})

install( TARGETS statismo_VTK
  EXPORT statismoTargets
  RUNTIME DESTINATION ${INSTALL_BIN_DIR}
  LIBRARY DESTINATION ${INSTALL_LIB_DIR}
  ARCHIVE DESTINATION ${INSTALL_LIB_DIR}
)
