TEMPLATE = app

QT += qml quick widgets serialport

SOURCES += main.cpp \
    console.cpp \
    settingsdialog.cpp \
    mainwindow.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    console.h \
    settingsdialog.h \
    mainwindow.h

FORMS += \
    settingsdialog.ui \
    mainwindow.ui

OTHER_FILES += \
    image/application-exit.png \
    image/battery_full.png \
    image/battery_low.png \
    image/battery_low1.png \
    image/battery_med.png \
    image/Brake_failure.png \
    image/button_default.png \
    image/button_pressed.png \
    image/clear.png \
    image/connect.png \
    image/disconnect.png \
    image/dropDown.png \
    image/Engine_start_stop_active.png \
    image/Engine_start_stop_inactive.png \
    image/fuel_gauge.png \
    image/fuelneedle.png \
    image/High_Beam_Indicator.png \
    image/navigation_next_item.png \
    image/navigation_previous_item.png \
    image/needle.png \
    image/oilIndicator.png \
    image/overlay_active.png \
    image/overlay_active1.png \
    image/overlay_inactive1.png \
    image/parkingLight.png \
    image/petrol.png \
    image/rpm_active.png \
    image/rpm_active1.png \
    image/rpm_inactive.png \
    image/settings.png \
    image/speed_active1.png \
    image/speed_inactive.png \
    image/tab_selected.png \
    image/tabs_standard.png \
    image/textinput.png \
    image/toolbar.png \
    image/turn_indicator_left.png \
    image/turn_indicator.png
