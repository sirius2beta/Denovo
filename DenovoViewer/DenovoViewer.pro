QT += quick gui widgets quickcontrols2

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

QT_CONFIG -= no-pkg-config
CONFIG += console link_pkgconfig



#- gstreamer installed by default under c:/gstreamer
GST_ROOT = c:/gstreamer/1.0/msvc_x86_64

!exists($$GST_ROOT) {
    # In GitHub actions windows runner installation is on D drive, so try there as well
    GST_ROOT = d:/gstreamer/1.0/msvc_x86_64
}

exists($$GST_ROOT) {
    CONFIG      += VideoEnabled

    LIBS        += -L$$GST_ROOT/lib -lgstreamer-1.0 -lgstgl-1.0 -lgstvideo-1.0 -lgstbase-1.0
    LIBS        += -lglib-2.0 -lintl -lgobject-2.0

    INCLUDEPATH += \
        $$GST_ROOT/include \
        $$GST_ROOT/include/gstreamer-1.0 \
        $$GST_ROOT/include/glib-2.0 \
        $$GST_ROOT/lib/gstreamer-1.0/include \
        $$GST_ROOT/lib/glib-2.0/include

    DESTDIR_WIN = $$replace(DESTDIR, "/", "\\")
    GST_ROOT_WIN = $$replace(GST_ROOT, "/", "\\")


}

DEFINES += GST_USE_UNSTABLE_API USE_QML

DEFINES += DNAPI_QML
SOURCES += \
        dnapi/dnqmlglobal.cpp \
        dnapi/dntypes.cpp \
        dnapi/dnqmlobjectlistmodel.cpp \
        dnapi/boatitem.cpp \
        dnapi/boatmanager.cpp \
        dnapi/configmanager.cpp \
        dnapi/dnmetadata.cpp \
        dnapi/dnvalue.cpp \
        dnapi/sensorgroup.cpp \
        dnapi/sensoritem.cpp \
        dnapi/sensormanager.cpp \
        dnapi/dnvideomanager.cpp \
        dnapi/dncore.cpp \
        dnapi/heartbeat.cpp \
        dnapi/networkmanager.cpp \
        dnapi/videoitem_qml.cpp \
        dnapi/device.cpp \
        main.cpp \
        dnapplication.cpp

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
    dnapi/boatitem.h \
    dnapi/boatmanager.h \
    dnapi/configmanager.h \
    dnapi/dnmetadata.h \
    dnapi/dnvalue.h \
    dnapi/sensorgroup.h \
    dnapi/sensoritem.h \
    dnapi/sensormanager.h \
    dnapi/dncore.h \
    dnapi/heartbeat.h \
    dnapi/networkmanager.h \
    dnapi/videoitem_qml.h \
    dnapi/device.h \
    dnapplication.h


QT += \
        opengl \
        gui-private

DEFINES += HAVE_QT_WIN32 HAVE_QT_QPA_HEADER
LIBS += opengl32.lib user32.lib

SOURCES += \
    libs/ext/qt/gstplugin.cc \
    libs/ext/qt/gstqtglutility.cc \
    libs/ext/qt/gstqsgtexture.cc \
    libs/ext/qt/gstqtsink.cc \
    libs/ext/qt/gstqtsrc.cc \
    libs/ext/qt/qtwindow.cc \
    libs/ext/qt/qtitem.cc

HEADERS += \
    libs/ext/qt/gstqsgtexture.h \
    libs/ext/qt/gstqtgl.h \
    libs/ext/qt/gstqtglutility.h \
    libs/ext/qt/gstqtsink.h \
    libs/ext/qt/gstqtsrc.h \
    libs/ext/qt/qtwindow.h \
    libs/ext/qt/qtitem.h

