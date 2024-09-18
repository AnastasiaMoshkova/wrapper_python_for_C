find_package(Cython)
find_package(Python COMPONENTS Interpreter Development)
if(Cython_FOUND)
	include(UseCython)
	
	execute_process(COMMAND ${Python_EXECUTABLE} "-c" "import numpy as np; print(np.get_include())"
		OUTPUT_VARIABLE PYTHON_NUMPY_INCLUDE_DIRS
		OUTPUT_STRIP_TRAILING_WHITESPACE)

	cython_add_module(pywrapper pywrapper.pyx)
	target_link_libraries(pywrapper mylib)
	target_include_directories(pywrapper PUBLIC ${PROJECT_SOURCE_DIR} ${PYTHON_NUMPY_INCLUDE_DIRS} ${Python_INCLUDE_DIRS})

endif()