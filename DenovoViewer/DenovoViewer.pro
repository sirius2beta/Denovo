QT += quick gui widgets

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

QT_CONFIG -= no-pkg-config
CONFIG += console link_pkgconfig debug
PKGCONFIG = \
    gstreamer-1.0 \
    gstreamer-video-1.0 \
    gstreamer-gl-1.0

DEFINES += GST_USE_UNSTABLE_API USE_QML

DEFINES += DNAPI_QML
SOURCES += \
        main.cpp\
        dnapi/dnqmlglobal.cpp \
        dnapi/dntypes.cpp \
        dnapi/dnqmlobjectlistmodel.cpp \
        dnapplication.cpp \
        dnapi/boatitem.cpp \
        dnapi/boatmanager.cpp \
        dnapi/configmanager.cpp \
        dnapi/dnmetadata.cpp \
        dnapi/dnvalue.cpp \
        dnapi/sensoritem.cpp \
        dnapi/sensormanager.cpp \
        dnapi/dnvideomanager.cpp \
        dnapi/gpbcore.cpp \
        dnapi/heartbeat.cpp \
        dnapi/networkmanager.cpp \
        dnapi/videoitem_qml.cpp \
        dnapi/device.cpp \

RESOURCES += qml.qrc



# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/res
QML_IMPORT_PATH += $$PWD/ui

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += \
    dnapi \


HEADERS += \
    dnapi/dnqmlglobal.h \
    dnapi/dntypes.h \
    dnapi/dnvideomanager.h \
    dnapi/dnvideomanager.h \
    dnapi/dnqmlobjectlistmodel.h \
    dnapplication.h\
    dnapi/boatitem.h \
    dnapi/boatmanager.h \
    dnapi/configmanager.h \
    dnapi/dnmetadata.h \
    dnapi/dnvalue.h \
    dnapi/sensoritem.h \
    dnapi/sensormanager.h \
    dnapi/gpbcore.h \
    dnapi/heartbeat.h \
    dnapi/networkmanager.h \
    dnapi/videoitem_qml.h \
    dnapi/device.h


