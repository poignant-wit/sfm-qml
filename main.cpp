#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtCore>
#include <QQuickView>
#include "models/checkout_model.h"
#include "models/customers_model.h"
#include <QtGui>
#include <QObject>
#include "models/sqldatabase.h"
#include "models/dictors_model.h"

//class MyClass : public QObject
//{
//    Q_OBJECT
//public slots:
//    void cppSlot() {
//        qDebug() << "Called the C++ slot with message:";
//    }
//};



//class Animal
//{
//public:
//    Animal(const QString &type, const QString &size);

//};


//class AnimalModel: public QAbstractListModel
//{
//    Q_OBJECT

//public:

//    enum AnimalRoles {
//            TypeRole = Qt::UserRole + 1,
//            SizeRole
//        };

//    AnimalModel(QObject *parent = 0);
//    QHash<int, QByteArray> roleNames() const;
//};


//QHash<int, QByteArray> AnimalModel::roleNames() const {
//    QHash<int, QByteArray> roles;
//    roles[TypeRole] = "type";
//    roles[SizeRole] = "size";
//    return roles;
//}



int main(int argc, char *argv[])
{

    SqlDatabase *myDb = new SqlDatabase();
    Checkout_model *checkout_model = new Checkout_model(0, myDb->getMydb());
    Customers_model *customer_model = new Customers_model(0, myDb->getMydb());
    Dictors_model *dictors_model = new Dictors_model(0, myDb->getMydb());
    //checkout_model->select();

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
   // engine.rootContext()->setContextProperty("tttot", ttt);
    engine.rootContext()->setContextProperty("check_model", checkout_model);
    engine.rootContext()->setContextProperty("customers_model", customer_model);
    engine.rootContext()->setContextProperty("dictors_model", dictors_model);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    //QQuickView view(QUrl::fromLocalFile("qrc:/main.qml"));


    //engine.rootObjects()

    //QObject *item = view.rootObject();
     //MyClass myClass;


    //QQuickView *view = new QQuickView;
    //view->setSource(QUrl::fromLocalFile("main.qml"));

   // QObject::connect(&engine, SIGNAL(addCheckout()), &checkout_model, SLOT(addCheckout()));


   // QQmlContext *con = engine.rootContext();
   // con->setContextProperty("tt", tt);





    //QQmlContext *ctxt = engine.rootContext();
    //ctxt->setContextProperty("myModel", model);

    return app.exec();
}
