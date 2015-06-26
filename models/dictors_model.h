#ifndef DICTORS_MODEL_H
#define DICTORS_MODEL_H

#include <QtSql>


class Dictors_model : public QSqlTableModel
{
    Q_OBJECT
public:
    Dictors_model(QObject *parent, QSqlDatabase db);
    QHash<int,QByteArray> *roles;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

};


#endif // DICTORS_MODEL_H
