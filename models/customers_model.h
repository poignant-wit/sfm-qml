#ifndef CUSTOMERS_MODEL_H
#define CUSTOMERS_MODEL_H

#include <QtSql>
#include "sqldatabase.h"



class Customers_model : public QSqlTableModel
{
    Q_OBJECT
public:
    Customers_model(QObject *parent, QSqlDatabase db);





    // QAbstractItemModel interface
public:

    QHash<int,QByteArray> *roles;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;
   // Q_INVOKABLE QVariantMap getRow(int row);

};

#endif // CUSTOMERS_MODEL_H
