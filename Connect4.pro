
QT += core qml quick gui concurrent svg

CONFIG += c++11

sailfish {
  message("Build for Sailfish OS")
  TARGET = harbour-sailconnect4
  VPATH += Sailfish
  CONFIG += sailfishapp_no_deploy_qml sailfishapp sailfishapp_i18n
}
android {
  message("Build for Android")
}
else {
  message("Build for desktop")
  TARGET = Connect4
}


DEFINES += TARGET=\""$(TARGET")\"

SOURCES += \
	UI/src/UI.cpp \
	Controller/src/Controller.cpp \
	Game/src/Game.cpp \
	Game/src/Minimax.cpp

RESOURCES += \
	UI/qml/qml.qrc \
	UI/icons/icons.qrc \
	UI/i18n/translations.qrc

RC_FILE = UI/icons/icons.rc

HEADERS += \
	UI/include/UIInterface.h \
	UI/src/UI.h \
	Controller/include/ControllerInterface.h \
	Controller/include/FactoryInterface.h \
	Controller/src/Controller.h \
	Game/include/GameInterface.h \
	Game/src/Game.h \
	Game/src/Minimax.h


# Platform dependent sources

sailfish {
  SOURCES += \
	  UI/src/UISailfish.cpp \
	  Controller/src/sailfish.cpp

  RESOURCES += \
	  UI/qml/sailfish/sailfish.qrc
}
android {
  SOURCES += \
	  Controller/src/main.cpp

  RESOURCES += \
	  UI/icons/menu/menu.qrc \
	  UI/qml/phone/phone.qrc

  TRANSLATIONS += \
	  UI/i18n/Connect4_fr.ts \
	  UI/i18n/Connect4_es.ts \
	  UI/i18n/Connect4_de.ts
}
else {
  SOURCES += \
	  Controller/src/main.cpp

  RESOURCES += \
	  UI/qml/desktop/desktop.qrc

  TRANSLATIONS += \
	  UI/i18n/Connect4_fr.ts \
	  UI/i18n/Connect4_es.ts \
	  UI/i18n/Connect4_de.ts
}

lupdate_only {
  SOURCES = \
		UI/qml/desktop/menu/*.qml \
		UI/qml/desktop/apropos/*.qml \
		UI/qml/desktop/configure/*.qml \
		UI/qml/desktop/*.qml \
		UI/qml/board/*.qml \
		UI/qml/config/*.qml \
		UI/qml/sailfish/*.qml \
		UI/qml/sailfish/configure/*.qml \
		UI/qml/*.qml \
}

android {
  FORMS += Android/mainwindow.ui

  CONFIG += mobility
  MOBILITY =

  DISTFILES += \
    Android/AndroidManifest.xml \
    Android/gradle/wrapper/gradle-wrapper.jar \
    Android/gradlew \
    Android/res/values/libs.xml \
    Android/build.gradle \
    Android/gradle/wrapper/gradle-wrapper.properties \
    Android/gradlew.bat

  ANDROID_PACKAGE_SOURCE_DIR = $$PWD/Android
}
