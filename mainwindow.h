#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtCore/QtGlobal>

#include <QMainWindow>

#include <QtSerialPort/QSerialPort>

namespace Ui {
class MainWindow;
}


class Console;
class SettingsDialog;

class MainWindow : public QMainWindow
{
    Q_OBJECT
//    Q_PROPERTY( Console console READ console)
//    Q_PROPERTY( SettingsDialog settings READ settings)
      //Q_INVOKABLE void show();

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void openSerialPort();
    void closeSerialPort();
    void about();
    void writeData(const QByteArray &data);
    void readData();

    void handleError(QSerialPort::SerialPortError error);

private:
    void initActionsConnections();

private:
    Ui::MainWindow *ui;
    Console *console;
    SettingsDialog *settings;
    QSerialPort *serial;
};


#endif // MAINWINDOW_H
