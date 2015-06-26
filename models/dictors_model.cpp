#include "dictors_model.h"

Dictors_model::Dictors_model(QObject *parent, QSqlDatabase db) : QSqlTableModel(parent, db)
{

    roles = new QHash<int,QByteArray>;
    roles->insert(Qt::UserRole, QByteArray("id_dictor"));
    roles->insert(Qt::UserRole + 1, QByteArray("name_dictor"));
    roles->insert(Qt::UserRole + 2, QByteArray("adress_dictor"));
    roles->insert(Qt::UserRole + 3, QByteArray("email_dictor"));
    roles->insert(Qt::UserRole + 4, QByteArray("icq_dictor"));
    roles->insert(Qt::UserRole + 5, QByteArray("telephone_dictor"));



    this->setTable("DICTORS");
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    this->select();


}



QVariant Dictors_model::data(const QModelIndex &index, int role) const
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


}

QHash<int, QByteArray> Dictors_model::roleNames() const
{
    return *roles;
}
