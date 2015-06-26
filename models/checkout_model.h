#ifndef CHECKOUT_MODEL_H
#define CHECKOUT_MODEL_H

#include <QSqlTableModel>
#include "sqldatabase.h"
#include "sqldata.h"
#include <QtDebug>
#include <QString>
#include <QHash>
#include <QGuiApplication>
#include <QtQml>
#include <QQuickView>
#include <QtSql>
#include <QObject>


class Checkout_model : public QSqlTableModel
{
   //

   Q_OBJECT
public:
    Checkout_model(QObject *parent, QSqlDatabase db);

public:
    QHash<int,QByteArray> *roles;
    QHash<int, QByteArray> roleNames() const;
    QVariant data(const QModelIndex &index, int role) const;
    Q_INVOKABLE QVariantMap getRow(int row);


public slots:
    void addCheckout();
    void editCheckout(int row, QString title, QString type, QString customer, QString status);

};

#endif // CHECKOUT_MODEL_H
