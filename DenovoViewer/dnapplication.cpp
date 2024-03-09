﻿#include <QRunnable>

#include "dnapplication.h"
#include "dnvideomanager.h"
#include "boatmanager.h"

class FinishVideoInitialization : public QRunnable
{
public:
  FinishVideoInitialization(DNVideoManager* manager)
      : _manager(manager)
  {}

  void run () {
     // _manager->_initVideo();
  }

private:
  DNVideoManager* _manager;
};

static QObject* DNQmlGlobalSingletonFactory(QQmlEngine*, QJSEngine*)
{

    // We create this object as a QGCTool even though it isn't in the toolbox
    DNQmlGlobal* qmlGlobal = new DNQmlGlobal(dnApp(), dnApp()->core());

    return qmlGlobal;
}

DNApplication* DNApplication::_app = nullptr;

DNApplication::DNApplication(int &argc, char *argv[])
    :QApplication (argc, argv)
{
    _app = this;
    _qmlEngine = new QQmlApplicationEngine(this);
    _core = new GPBCore(this, QString("config1"));
    _init();
    _qmlEngine->load("qrc:/main.qml");


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
    // Register Qml Singletons
    qmlRegisterSingletonType<DNQmlGlobal>   ("DeNovoViewer", 1, 0, "DeNovoViewer", DNQmlGlobalSingletonFactory);
    qDebug()<<"global init()";


}

QObject* DNApplication::_rootQmlObject()
{
    if(_qmlEngine && _qmlEngine->rootObjects().size())
        return _qmlEngine->rootObjects()[0];
    return nullptr;
}

QQuickItem* DNApplication::mainRootWindow()
{
    if(!_mainRootWindow) {
        _mainRootWindow = reinterpret_cast<QQuickItem*>(_rootQmlObject());
    }
    return _mainRootWindow;
}

DNApplication* dnApp(void)
{
    return DNApplication::_app;
}
