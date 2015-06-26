TEMPLATE = app

QT += qml quick gui core sql

SOURCES += main.cpp \
    models/sqldatabase.cpp \
    models/checkout_model.cpp \
    models/sqldata.cpp \
    models/customers_model.cpp \
    models/dictors_model.cpp

RESOURCES += qml.qrc \
    icons.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    models/sqldatabase.h \
    models/checkout_model.h \
    models/sqldata.h \
    models/customers_model.h \
    models/dictors_model.h
