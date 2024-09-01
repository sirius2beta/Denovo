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
