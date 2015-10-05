#include "checkout_model.h"
#include <QDebug>

Checkout_model::Checkout_model(QObject *parent, QSqlDatabase db) :
    QSqlTableModel(parent, db)
{

    roles = new QHash<int,QByteArray>;
    roles->insert(Qt::UserRole, QByteArray("id_checkout"));
    roles->insert(Qt::UserRole + 1, QByteArray("date_checkout"));
    roles->insert(Qt::UserRole + 2, QByteArray("title_checkout"));
    roles->insert(Qt::UserRole + 3, QByteArray("type_checkout"));
    roles->insert(Qt::UserRole + 4, QByteArray("customer_name_checkout"));
    roles->insert(Qt::UserRole + 5, QByteArray("customer_company_checkout"));
    roles->insert(Qt::UserRole + 6, QByteArray("payvalue_checkout"));
    roles->insert(Qt::UserRole + 7, QByteArray("paytype_checkout"));
    roles->insert(Qt::UserRole + 8, QByteArray("paystatus_checkout"));
    roles->insert(Qt::UserRole + 9, QByteArray("status_checkout"));

    this->setTable("CHECKOUT");
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    this->select();

}



QHash<int, QByteArray> Checkout_model::roleNames() const
{
    return *roles;
}

QVariant Checkout_model::data(const QModelIndex &index, int role) const
{
    // qDebug() << "DATA";
    if (role < Qt::UserRole) return QSqlTableModel::data(index, role);

    if (role == Qt::UserRole){
        QSqlRecord r = record(index.row());
        QString value;
        value = QString("%1").arg( r.value(0).toInt(), 4, 10, QChar('0'));
        return value;
    }

    if (role == Qt::UserRole + 1){
        QSqlRecord r2 = record(index.row());
        return r2.value(1).toString();
    }

    if (role == Qt::UserRole + 2){
        QSqlRecord r2 = record(index.row());
        return r2.value(2).toString();
    }

    if (role == Qt::UserRole + 3){
        QSqlRecord r2 = record(index.row());
        return r2.value(3).toString();
    }

    if (role == Qt::UserRole + 4){
        QSqlRecord r = record(index.row());


        QSqlQuery qry;
        qry.prepare("SELECT * FROM customers where id_customer = :id");
        qry.bindValue(":id", r.value(4).toInt());
        if (qry.exec()){


            QString name;
            while (qry.next()) {
                name =  qry.value(1).toString();
            }

            return name;
        }

        //return r2.value(4).toString();
        return "ERROR GET NAME";
    }

    if (role == Qt::UserRole + 5){
        QSqlRecord r = record(index.row());


        QSqlQuery qry;
        qry.prepare("SELECT * FROM customers where id_customer = :id");
        qry.bindValue(":id", r.value(4).toInt());
        if (qry.exec()){


            QString company;
            while (qry.next()) {
                company =  qry.value(5).toString();
            }

            return company;
        }

        //return r2.value(4).toString();
        return "ERROR GET COMPANY";
    }

    if (role == Qt::UserRole + 6){
        QSqlRecord r2 = record(index.row());
        return r2.value(5).toString();
    }

    if (role == Qt::UserRole + 7){
        QSqlRecord r2 = record(index.row());
        return r2.value(6).toString();
    }

    if (role == Qt::UserRole + 8){
        QSqlRecord r2 = record(index.row());
        return r2.value(7).toString();
    }

    if (role == Qt::UserRole + 9){
        QSqlRecord r2 = record(index.row());
        return r2.value(8).toString();
    }


}


QVariantMap Checkout_model::getRow(int row)
{

    QHash<int,QByteArray> names = roleNames();
    QHashIterator<int, QByteArray> i(names);
    QVariantMap res;
    while (i.hasNext()) {
        i.next();
        QModelIndex idx = index(row, 0);
        QVariant data = idx.data(i.key());
        res[i.value()] = data;
        //qDebug() << i.key() << ": " << i.value() << endl;
    }
    return res;

}

void Checkout_model::addCheckout()
{
    QSqlRecord record;
    record.append(QSqlField("ID_CHECKOUT", QVariant::Int));
    record.append(QSqlField("DATA", QVariant::String));
    record.append(QSqlField("TITLE", QVariant::String));
    record.append(QSqlField("TYPE", QVariant::String));
    record.append(QSqlField("CUSTOMER", QVariant::String));
    record.append(QSqlField("PAYVALUE", QVariant::String));
    record.append(QSqlField("PAYTYPE", QVariant::String));
    record.append(QSqlField("PAYSTATUS", QVariant::String));
    record.append(QSqlField("STATUS", QVariant::String));
    //record.setValue("ID_CHECKOUT",2);
    record.setValue("TITLE","5");
    record.setValue("DATA","5");


   // qDebug() << "ADD CHECKOUT MODEL";
   // this->setData(this->createIndex(1, 1), QVariant("ttttttt"), Qt::EditRole);
  //  this->submitAll();

        this->insertRecord(-1, record);

        if (this->submitAll()){
            qDebug("SUBMITTED CORRECTLY");
        }

        qDebug() << "ADDCHECKOUT";

}

void Checkout_model::editCheckout(int row, QString title, QString type, QString customer, QString status)
{
    this->setData(this->createIndex(row, 2), QVariant(title), Qt::EditRole);
    this->submitAll();

}
