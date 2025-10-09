cmake_minimum_required(VERSION 3.10)
project(ae2f_docs)

set(ae2f_ProjRoot ${CMAKE_CURRENT_SOURCE_DIR} CACHE STRING "Current Source Root")
set(ae2f_)

function(GITCLONE AUTH NAME)
	if (NOT EXISTS submod/${AUTH}/${NAME})
		execute_process(
			COMMAND git clone https://codeberg.org/${AUTH}/${NAME} submod/${AUTH}/${NAME}
			)
	else()
		execute_process(
			COMMAND git restore .
			WORKING_DIRECTORY submod/${AUTH}/${NAME}
			)

		execute_process(
			COMMAND git pull
			WORKING_DIRECTORY submod/${AUTH}/${NAME}
			)
	endif()

	if (NOT EXISTS ${CMAKE_BINARY_DIR}/${AUTH}/${NAME})
		add_subdirectory(submod/${AUTH}/${NAME} submod/${AUTH}/${NAME})
	endif()
endfunction()

GITCLONE(ae2f Ann)
GITCLONE(ae2f Sys)

# Find Doxygen
find_package(Doxygen REQUIRED)
if(DOXYGEN_FOUND)
	# Set input directories (all subprojects' src and include)
	set(DOXYGEN_INPUT_DIR
		"${PROJECT_SOURCE_DIR}/submod/ae2f/ 
		${PROJECT_SOURCE_DIR}/Hell/ 
		${PROJECT_SOURCE_DIR}/README.md"
		)

	set(DOXYGEN_OUTPUT_DIR ${CMAKE_SOURCE_DIR})
	set(DOXYGEN_CONFIG_FILE ${CMAKE_SOURCE_DIR}/Doxyfile)

	# Configure the Doxyfile
	configure_file(${CMAKE_SOURCE_DIR}/Doxyfile.in ${DOXYGEN_CONFIG_FILE} @ONLY)

	# Add custom target for Doxygen
	add_custom_target(
		docs
		COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_CONFIG_FILE}
		WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
		COMMENT "Generating Doxygen documentation for all subprojects"
		VERBATIM
		)
else()
	message(WARNING "Doxygen not found, documentation target will not be available")
endif()
