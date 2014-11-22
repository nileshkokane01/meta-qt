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
    Q_PROPERTY(int speedData READ speedData WRITE setspeedData)
//    Q_PROPERTY( SettingsDialog settings READ settings)
      //Q_INVOKABLE void show();

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();




    int speedData() const {
          return m_data1;
      }

private slots:
    void openSerialPort();
    void closeSerialPort();
    void about();
    void writeData(const QByteArray &data);
    void readData();

    void handleError(QSerialPort::SerialPortError error);
    void setspeedData(const int data) {
                m_data1=data;
     }

signals:
    void data1Changed();

private:
    void initActionsConnections();

private:
    Ui::MainWindow *ui;
    Console *console;
    SettingsDialog *settings;
    QSerialPort *serial;
    int m_data1;

};


#endif // MAINWINDOW_H
