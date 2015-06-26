#include "sqldatabase.h"

SqlDatabase::SqlDatabase(QObject *parent) : QObject(parent)
{



    //mydb = new QSqlDatabase();
    mydb = QSqlDatabase::addDatabase("QSQLITE");
   // mydb->addDatabase("QSQLITE");
    mydb.setDatabaseName("/Users/silafm/Documents/_sync folder/_dev projects/_python/SFManager/Sila.db");
    mydb.open();



}
QSqlDatabase SqlDatabase::getMydb() const
{
    return mydb;
}


