# normlize the file name of the hdf5 libs (remove any _D suffix that can come from visual studio debug builds)
if(WIN32)
	if(EXISTS ${INSTALL_DEPECENCIES_DIR}/lib/hdf5_D.lib)
		file(COPY  ${INSTALL_DEPECENCIES_DIR}/lib/hdf5_D.lib  DESTINATION ${INSTALL_DEPECENCIES_DIR}/lib/)
		file(COPY  ${INSTALL_DEPECENCIES_DIR}/lib/hdf5_cpp_D.lib  DESTINATION ${INSTALL_DEPECENCIES_DIR}/lib/)
	endif()
endif()