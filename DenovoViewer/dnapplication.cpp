#include "dnapplication.h"

DNApplication::DNApplication(int &argc, char *argv[])
    :QApplication (argc, argv)
{
    QQmlApplicationEngine* qmlEngine = new QQmlApplicationEngine(this);
    qmlEngine->load("qrc:/main.qml");
}

DNApplication::~DNApplication()
{

}

void DNApplication::_shutdown()
{

}
