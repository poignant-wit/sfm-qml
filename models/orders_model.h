#ifndef ORDERS_MODEL_H
#define ORDERS_MODEL_H
#include "models/sqlquerymodel.h"
#include "QSqlQuery"
#include "QSqlRecord"
#include "QDebug"
#include "QSqlField"




namespace SqlQueries {
const  char* const DEFAULT = "select a.order_id, a.order_date, b.customer_name, a.order_title, c.payment_value from orders as a, customers as b left join payments as c on a.order_id = c.payment_order where a.order_customer = b.customer_id order by order_id desc";
}



class Orders_model: public SqlQueryModel
{
public:
    Orders_model(QObject *parent);
    Q_INVOKABLE void addRecord();




private:

    QHash<QString, QString> sqlQueries;


    // SqlQueryModel interface

    // QSqlRecord getRow(int row);
};

#endif // ORDERS_MODEL_H
