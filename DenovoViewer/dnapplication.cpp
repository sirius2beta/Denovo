﻿#include <QRunnable>
#include <gst/gst.h>

#include "dnapplication.h"
#include "dnvideomanager.h"
#include "boatmanager.h"
#include "videoitem.h"
#include "sensormanager.h"
#include "controlmanager.h"
#include "controlitem.h"
#include "dnvalue.h"
G_BEGIN_DECLS
    GST_PLUGIN_STATIC_DECLARE(qmlgl);

G_END_DECLS
class FinishVideoInitialization : public QRunnable
{
public:
  FinishVideoInitialization(DNVideoManager* manager)
      : _dnvideomanager(manager)
  {
  }

  void run () {
     _dnvideomanager->initVideo();
  }

private:
  DNVideoManager* _dnvideomanager;
};

//register a singleton type provider
static QObject* DNQmlGlobalSingletonFactory(QQmlEngine*, QJSEngine*)
{
    DNQmlGlobal* qmlGlobal = new DNQmlGlobal(dnApp(), dnApp()->core());
    return qmlGlobal;
}

DNApplication* DNApplication::_app = nullptr;

DNApplication::DNApplication(int &argc, char *argv[])
    :QApplication (argc, argv)
{

    QString pluginpath = QCoreApplication::applicationDirPath()+"/gstreamer-plugins";
    qputenv("GST_PLUGIN_PATH", pluginpath.toStdString().c_str());


    gst_init (&argc, &argv);
    GST_PLUGIN_STATIC_REGISTER(qmlgl);
    _app = this;
    _qmlEngine = new QQmlApplicationEngine(this);
    _core = new DNCore(this, QString("config1"));
    // register C++ class of DNcore
    _init();
    _core->videoManager()->initGstreamer();
    _qmlEngine->addImportPath("qrc:/imports");
    _qmlEngine->addImportPath("qrc:/qml");
    _qmlEngine->load("qrc:/main.qml");

    QQuickWindow* rootWindow = dnApp()->mainRootWindow();
    if (rootWindow) {
        rootWindow->scheduleRenderJob (new FinishVideoInitialization (_core->videoManager()),
                QQuickWindow::BeforeSynchronizingStage);
    }

}

DNApplication::~DNApplication()
{

}

void DNApplication::_shutdown()
{

}

void DNApplication::_init()
{
    // Register our Qml objects
    qmlRegisterUncreatableType<BoatItem>("DeNovoViewer.Boat", 1, 0, "BoatItem",  "reference only");
    qmlRegisterUncreatableType<BoatManager>("DeNovoViewer.Boat", 1, 0, "BoatManager",  "reference only");
    qmlRegisterUncreatableType<DNVideoManager>("DeNovoViewer.Boat", 1, 0, "DNVideoManager",  "reference only");
    qmlRegisterUncreatableType<VideoItem>("DeNovoViewer.Boat", 1, 0, "VideoItem",  "reference only");
    qmlRegisterUncreatableType<SensorManager>("DeNovoViewer.Boat", 1, 0, "SensorManager",  "reference only");
    qmlRegisterUncreatableType<ControlManager>("DeNovoViewer.Boat", 1, 0, "ControlManager", "reference only");
    qmlRegisterUncreatableType<ControlItem>("DeNovoViewer.Boat", 1, 0, "ControlItem", "reference only");
    qmlRegisterType<DNValue>("DeNovoViewer.Boat", 1, 0, "DNValue");

    // Register Qml Singletons
    qmlRegisterSingletonType<DNQmlGlobal>("DeNovoViewer", 1, 0, "DeNovoViewer", DNQmlGlobalSingletonFactory);
    qDebug()<<"global init()";


}

QObject* DNApplication::_rootQmlObject()
{
    if(_qmlEngine && _qmlEngine->rootObjects().size())
        return _qmlEngine->rootObjects()[0];
    return nullptr;
}

QQuickWindow* DNApplication::mainRootWindow()
{
    if(!_mainRootWindow) {
        _mainRootWindow = reinterpret_cast<QQuickWindow*>(_rootQmlObject());
    }
    return _mainRootWindow;
}

DNApplication* dnApp(void)
{
    return DNApplication::_app;
}
