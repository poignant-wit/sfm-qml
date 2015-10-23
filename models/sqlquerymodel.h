#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H

#include "QSqlQueryModel"
#include "QSqlRecord"



class SqlQueryModel: public QSqlQueryModel
{
    Q_OBJECT

public:
    SqlQueryModel(QObject *parent);
    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE QVariant getRow(int row, QString fieldName) {return QSqlQueryModel::record(row).value(fieldName);}


private:
    QHash<int, QByteArray> m_roleNames;
    void generateRoleNames();
};

#endif // SQLQUERYMODEL_H
