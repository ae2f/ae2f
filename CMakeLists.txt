cmake_minimum_required(VERSION 3.20)
enable_testing()
include(cmake/Core.cmake)

project(ae2f VERSION 1.3.5 LANGUAGES C CXX)
option(ae2f_ae2fDOCGEN "" ON)
option(ae2f_ae2fFechemAll "" OFF)

if(NOT TARGET ${PROJECT_NAME} AND ae2f_ae2fDOCGEN)
    if(${ae2f_ae2fFechemAll})
        file(REMOVE_RECURSE ${CMAKE_CURRENT_SOURCE_DIR}/submod)
    endif()

    ae2f_CoreLibFetch(ae2f Core main)
    ae2f_CoreLibFetch(ae2f Macro main)
    ae2f_CoreLibFetch(ae2f Ds main)
    ae2f_CoreLibFetch(ae2f Ruler main)
    ae2f_CoreLibFetch(ae2f mov main)
    ae2f_CoreLibFetch(ae2f mov2 main)
    ae2f_CoreLibFetch(ae2f err main)
    ae2f_CoreLibFetch(ae2f CL-Core main)
    ae2f_CoreLibFetch(ae2f Ann main)
    ae2f_CoreLibFetch(ae2f Math main)

    file(REMOVE_RECURSE ${PROJECT_SOURCE_DIR}/CMakeDocs/include)
    file(REMOVE_RECURSE ${PROJECT_SOURCE_DIR}/SharedHeaders/include)
    file(REMOVE_RECURSE ${PROJECT_SOURCE_DIR}/Source/include)
    file(REMOVE_RECURSE ${PROJECT_SOURCE_DIR}/include)
    file(REMOVE_RECURSE ${PROJECT_SOURCE_DIR}/docs/code)
    file(REMOVE_RECURSE ${PROJECT_SOURCE_DIR}/clinclude)

    file(GLOB_RECURSE __PROJECTS "${PROJECT_SOURCE_DIR}/submod/ae2f/*/CMakeLists.txt")
    foreach(__PROJECT ${__PROJECTS})
        file(RELATIVE_PATH REL ${PROJECT_SOURCE_DIR} ${__PROJECT})
        get_filename_component(PARENT_DIR ${__PROJECT} DIRECTORY)

        file(GLOB_RECURSE __HEADERS ${PARENT_DIR}/include/*.h*)
        foreach(__HEADER ${__HEADERS})
            file(RELATIVE_PATH REL ${PARENT_DIR}/include ${__HEADER})
            get_filename_component(PARENT_HEADER ${REL} DIRECTORY)

            file(
                COPY ${__HEADER}
                DESTINATION ${PROJECT_SOURCE_DIR}/include/SharedHeaders/${PARENT_HEADER}
            )
        endforeach()

        file(GLOB_RECURSE __HEADERS ${PARENT_DIR}/cmake/*.hpp)
        foreach(__HEADER ${__HEADERS})
            file(RELATIVE_PATH REL ${PARENT_DIR} ${__HEADER})

            file(
                COPY ${__HEADER}
                DESTINATION ${PROJECT_SOURCE_DIR}/include/CMakeDocs
            )
        endforeach()

        file(GLOB_RECURSE __HEADERS ${PARENT_DIR}/src/*.h*)
        foreach(__HEADER ${__HEADERS})
            file(RELATIVE_PATH REL ${PARENT_DIR}/src ${__HEADER})
            get_filename_component(PARENT_HEADER ${REL} DIRECTORY)

            file(
                COPY ${__HEADER}
                DESTINATION ${PROJECT_SOURCE_DIR}/include/Source/${PARENT_HEADER}
            )
        endforeach()
    endforeach()

    execute_process(
        COMMAND doxygen 
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    )
endif()
