#include(../RibiLibraries/Apfloat.pri)
include(../RibiLibraries/BigInteger.pri)
include(../RibiLibraries/BoostAll.pri)
include(../RibiLibraries/Fparser.pri)
include(../RibiLibraries/Wt.pri)

include(../RibiClasses/CppAbout/CppAbout.pri)
include(../RibiClasses/CppFileIo/CppFileIo.pri)
include(../RibiClasses/CppHelp/CppHelp.pri)
include(../RibiClasses/CppMenuDialog/CppMenuDialog.pri)
include(../RibiClasses/CppTestTimer/CppTestTimer.pri)
include(../RibiClasses/CppTrace/CppTrace.pri)

include(../RibiLibraries/GeneralWeb.pri)

#Detect dead code
#LIBS += -lgcov
#QMAKE_CXXFLAGS += --coverage

#Use of gprof
#QMAKE_CXXFLAGS_DEBUG += -pg
#QMAKE_LFLAGS_DEBUG += -pg

#Console
include(../RibiClasses/CppCanvas/CppCanvas.pri)
include(../RibiClasses/CppContainer/CppContainer.pri)
include(../RibiClasses/CppCounter/CppCounter.pri)
include(../DotMatrix/DotMatrix.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppGeometry/CppGeometry.pri)
include(../RibiClasses/CppImageCanvas/CppImageCanvas.pri)
include(../RibiClasses/CppIpAddress/CppIpAddress.pri)
include(../RibiClasses/CppLed/CppLed.pri)
include(../RibiClasses/CppLedWidget/CppLedWidget.pri)
include(../Hometrainer/ToolHometrainerWebsite.pri)
include(../plane/plane.pri)
include(../RibiClasses/CppRainbow/CppRainbow.pri)
include(../RibiClasses/CppRibiRegex/CppRibiRegex.pri)
#include(../RibiClasses/CppSafeIpAddress/CppSafeIpAddress.pri)
include(../RibiClasses/CppShape/CppShape.pri)
include(../RibiClasses/CppShapeWidget/CppShapeWidget.pri)
include(../RibiClasses/CppStopwatch/CppStopwatch.pri)
include(../RibiClasses/CppTextCanvas/CppTextCanvas.pri)
include(../RibiClasses/CppTribool/CppTribool.pri)
include(../RibiClasses/CppWidget/CppWidget.pri)
include(../RibiClasses/CppXml/CppXml.pri)

#Web
include(../RibiClasses/CppWtGroupWidget/CppWtGroupWidget.pri)
include(../RibiClasses/CppWtLedWidget/CppWtLedWidget.pri)
include(../RibiClasses/CppWtSelectFileDialog/CppWtSelectFileDialog.pri)
include(../RibiClasses/CppWtServerPusher/CppWtServerPusher.pri)
include(../RibiClasses/CppWtShapeGroupWidget/CppWtShapeGroupWidget.pri)
include(../RibiClasses/CppWtShapeWidget/CppWtShapeWidget.pri)
include(../RibiClasses/CppWtTimedServerPusher/CppWtTimedServerPusher.pri)

include(ProjectGtstWebsite.pri)

SOURCES += wtmain.cpp

# C++14
CONFIG += c++14
QMAKE_CXX = g++-5
QMAKE_LINK = g++-5
QMAKE_CC = gcc-5
QMAKE_CXXFLAGS += -std=c++14

# High warning levels
# Qt does not go well with -Weffc++
QMAKE_CXXFLAGS += -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Werror

# Debug and release mode
CONFIG += debug_and_release

# In release mode, define NDEBUG
CONFIG(release, debug|release) {

  DEFINES += NDEBUG
}

# In debug mode, turn on gcov and UBSAN
CONFIG(debug, debug|release) {

  # gcov
  QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
  LIBS += -lgcov

  # UBSAN
  QMAKE_CXXFLAGS += -fsanitize=undefined
  QMAKE_LFLAGS += -fsanitize=undefined
  LIBS += -lubsan
}

# Qt
QT += core

# Prevent Qt for failing with this error:
# qrc_[*].cpp:400:44: error: ‘qInitResources_[*]__init_variable__’ defined but not used
# [*]: the resource filename
QMAKE_CXXFLAGS += -Wno-unused-variable

# Fixes
#/usr/include/boost/math/constants/constants.hpp:277: error: unable to find numeric literal operator 'operator""Q'
#   BOOST_DEFINE_MATH_CONSTANT(half, 5.000000000000000000000000000000000000e-01, "5.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e-01")
#   ^
QMAKE_CXXFLAGS += -fext-numeric-literals

# Wt
LIBS += -lwt -lwthttp
