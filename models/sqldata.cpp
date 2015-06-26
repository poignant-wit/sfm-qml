#include "sqldata.h"

SqlData::SqlData(QObject *parent) : QObject(parent)
{

    mydb = QSqlDatabase::addDatabase("QSQLITE");
    mydb.setDatabaseName("/Users/silafm/Documents/_sync folder/_dev projects/_python/SFManager/Sila.db");
    mydb.open();

}
QSqlDatabase SqlData::getMydb() const
{
    return mydb;
}


