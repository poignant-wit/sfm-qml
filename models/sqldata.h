#ifndef SQLDATA_H
#define SQLDATA_H

#include <QObject>

#include <QSqlDatabase>

class SqlData : public QObject
{

    Q_OBJECT

public:
    explicit SqlData(QObject *parent = 0);
    QSqlDatabase getMydb() const;

private:
    QSqlDatabase mydb;

signals:

public slots:
};

#endif // SQLDATA_H
