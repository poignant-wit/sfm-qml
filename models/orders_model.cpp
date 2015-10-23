#include "orders_model.h"



Orders_model::Orders_model(QObject *parent): SqlQueryModel(parent)
{






   // addRecord();
    this->setQuery(SqlQueries::DEFAULT);
    QSqlRecord rec = record(1);
    qDebug() << rec.value(1).toString();

}

void Orders_model::addRecord()
{
    QSqlQuery query;
    query.exec("insert into orders (order_title) values ('TITLE222')");
}


//QSqlRecord Orders_model::getRow(int row)
//{
//    QSqlRecord rec = record(row);
//    return rec;
//}
