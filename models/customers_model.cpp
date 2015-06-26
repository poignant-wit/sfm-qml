#include "customers_model.h"

Customers_model::Customers_model(QObject *parent, QSqlDatabase db) : QSqlTableModel(parent, db)
{

    roles = new QHash<int,QByteArray>;
    roles->insert(Qt::UserRole, QByteArray("id_customer"));
    roles->insert(Qt::UserRole + 1, QByteArray("name_customer"));
    roles->insert(Qt::UserRole + 2, QByteArray("adress_customer"));
    roles->insert(Qt::UserRole + 3, QByteArray("email_customer"));
    roles->insert(Qt::UserRole + 4, QByteArray("icq_customer"));
    roles->insert(Qt::UserRole + 5, QByteArray("company_customer"));
    roles->insert(Qt::UserRole + 6, QByteArray("telephone_customer"));


    this->setTable("CUSTOMERS");
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    this->select();


}



QVariant Customers_model::data(const QModelIndex &index, int role) const
{
    if (role < Qt::UserRole) return QSqlTableModel::data(index, role);

    if (role == Qt::UserRole){
        QSqlRecord r = record(index.row());
        return r.value(0).toString();
    }
    if (role == Qt::UserRole + 1){
        QSqlRecord r = record(index.row());
        return r.value(1).toString();
    }
    if (role == Qt::UserRole + 2){
        QSqlRecord r = record(index.row());
        return r.value(2).toString();
    }
    if (role == Qt::UserRole + 3){
        QSqlRecord r = record(index.row());
        return r.value(3).toString();
    }
    if (role == Qt::UserRole + 4){
        QSqlRecord r = record(index.row());
        return r.value(4).toString();
    }
    if (role == Qt::UserRole + 5){
        QSqlRecord r = record(index.row());
        return r.value(5).toString();
    }
    if (role == Qt::UserRole + 6){
        QSqlRecord r = record(index.row());
        return r.value(6).toString();
    }
}



QHash<int, QByteArray> Customers_model::roleNames() const
{
    return *roles;
}
