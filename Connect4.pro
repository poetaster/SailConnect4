QT += qml quick gui
TARGET = Connect4

CONFIG += c++11

SOURCES += UI/src/UI.cpp

RESOURCES += UI/qml/qml.qrc

HEADERS += \
	UI/include/UIInterface.h \
	UI/src/UI.h \
	Controller/include/ControllerInterface.h
