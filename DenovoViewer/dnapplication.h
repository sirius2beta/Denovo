#ifndef DNAPPLICATION_H
#define DNAPPLICATION_H

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include "gpbcore.h"
#include "dnqmlglobal.h"



class DNApplication:public QApplication
{
    Q_OBJECT
public:
    DNApplication(int &argc, char* argv[]);
    ~DNApplication();
    void _shutdown();
    void _init();
    QObject* _rootQmlObject();
    QQuickWindow* mainRootWindow();
    static DNApplication* _app;

    GPBCore* core() { return _core; }
private:
    GPBCore* _core;
    QQmlApplicationEngine* _qmlEngine = nullptr;
    QQuickWindow* _mainRootWindow = nullptr;

};


DNApplication* dnApp(void);
#endif // DNAPPLICATION_H
