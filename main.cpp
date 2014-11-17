#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick/QQuickView>

#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "console.h"
#include "settingsdialog.h"

#include <QMessageBox>
#include <QtSerialPort/QSerialPort>
#include <QtQml>

#include <QApplication>


int main(int argc, char *argv[])
{
 //   QGuiApplication app(argc, argv);

  //  serial = new QSerialPort(this);
  //  qmlRegisterType<serial>("serial", 1, 0, "serial");
  //  MainWindow w;
  //  w.show();

//    qmlRegisterType<MainWindow>("serialconsole", 1, 0, "MainWindow");
     QApplication a(argc, argv);


    MainWindow w;


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    w.setGeometry(20,20,20,20);
    w.show();
    return a.exec();
}
