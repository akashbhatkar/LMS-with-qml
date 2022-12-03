#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QSqlDatabase>
#include "logindata.h"
#include<QQmlContext>

const QString signupdata= "logindata.db";
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    logindata data(signupdata);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    logindata ld;
    engine.rootContext()->setContextProperty("testing", &ld);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
