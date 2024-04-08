#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <gst/gst.h>
#include <QQuickStyle>
#include <QDebug>
#include "dnapplication.h"
#include "boatitem.h"


int main(int argc, char *argv[])
{

    //GstElement *src = gst_element_factory_make ("videotestsrc", NULL);
    //GstElement *glupload = gst_element_factory_make ("glupload", NULL);
    /* the plugin must be loaded before loading the qml file to register the
     * GstGLVideoItem qml item */
    //GstElement *sink = gst_bin_get_by_name((GstBin*)pipeline,"sink");

    //qputenv("GST_PLUGIN_PATH", "D:/Qt/Denovo/build-DenovoViewer-Desktop_Qt_5_15_2_MSVC2019_64bit-Debug/debug/1.0/msvc_x86_64/lib/gstreamer-1.0");

    //qputenv("GST_DEBUG", "3");
    //g_assert (sink);


    //gst_registry_scan_path(registry, path.toStdString().c_str());



    QQuickStyle::setStyle("Material");
    DNApplication* app = new DNApplication(argc, argv);

    QFont fon("Brown", 12);
    app->setFont(fon);
    Q_CHECK_PTR(app);
    int exitcode = 0;
    exitcode = app->exec();

    app->_shutdown();
    delete app;
    gst_deinit();
    return exitcode;

}
