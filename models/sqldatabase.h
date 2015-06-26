#ifndef SQLDATABASE_H
#define SQLDATABASE_H

#include <QSqlDatabase>
#include <QObject>

class SqlDatabase : public QObject
{

   //Q_OBJECT


public:
    explicit SqlDatabase(QObject *parent = 0);
    QSqlDatabase getMydb() const;

private:
    QSqlDatabase mydb;


};

#endif // SQLDATABASE_H
