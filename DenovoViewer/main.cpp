#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <gst/gst.h>
#include "dnapplication.h"
#include "boatitem.h"
int main(int argc, char *argv[])
{

    //GstElement *src = gst_element_factory_make ("videotestsrc", NULL);
    //GstElement *glupload = gst_element_factory_make ("glupload", NULL);
    /* the plugin must be loaded before loading the qml file to register the
     * GstGLVideoItem qml item */
    //GstElement *sink = gst_bin_get_by_name((GstBin*)pipeline,"sink");


    //g_assert (sink);
    gst_init (&argc, &argv);
    DNApplication* app = new DNApplication(argc, argv);
    Q_CHECK_PTR(app);
    int exitcode = 0;
    exitcode = app->exec();

    app->_shutdown();
    delete app;
    gst_deinit();
    return exitcode;

}
