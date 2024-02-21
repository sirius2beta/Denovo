#ifndef DNAPPLICATION_H
#define DNAPPLICATION_H

#include <QApplication>
#include <QQmlApplicationEngine>

class DNApplication:public QApplication
{
    Q_OBJECT
public:
    DNApplication(int &argc, char* argv[]);
    ~DNApplication();
    void _shutdown();
protected:

};

#endif // DNAPPLICATION_H
