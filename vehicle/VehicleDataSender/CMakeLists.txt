cmake_minimum_required(VERSION 3.5)

project(VehicleDataSender)

add_library(VehicleDataSender SHARED VehicleLibrary.cpp VehicleLibrary.h)

#find_package(Qt5 REQUIRED COMPONENTS Core Quick Sql)

find_package(Qt5 REQUIRED COMPONENTS Sql)
target_link_libraries(VehicleDataSender PRIVATE Qt5::Sql)


target_link_libraries(VehicleDataSender PRIVATE Qt${QT_VERSION_MAJOR}::Core)
#target_link_libraries(VehicleDataSender PRIVATE Qt${QT_VERSION_MAJOR}::Widgets)

target_link_libraries(VehicleDataSender PRIVATE Qt5::Sql)
