cmake_minimum_required(VERSION 3.16)

project(qmlwasm VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appqmlwasm
    main.cpp
    seo.cpp
    seo.h
)

qt_add_qml_module(appqmlwasm
    URI qmlwasm
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appqmlwasm PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    LINK_FLAGS "-s EXPORTED_FUNCTIONS=_main,_hashchanged -s EXTRA_EXPORTED_RUNTIME_METHODS=allocate,intArrayFromString"
)

target_link_libraries(appqmlwasm
    PRIVATE Qt6::Quick)

install(TARGETS appqmlwasm
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
