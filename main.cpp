#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include "seo.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QStringList args = app.arguments();
    QString hash = args.at(args.length()-1);
    qDebug() << hash;

    qmlRegisterType<Seo>("at.crowdware.wasm", 1, 0, "Seo");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qmlwasm/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl) 
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
