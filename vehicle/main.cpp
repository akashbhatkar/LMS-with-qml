#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "VehicleLibrary.h"
#include <QQmlContext>

const QString Vehicledatabse ="vehicledatabse.db";
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    VehicleLibrary data(Vehicledatabse);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    VehicleLibrary vl;
    engine.rootContext()->setContextProperty("vehicletest",&vl);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
