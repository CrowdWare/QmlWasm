#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QDebug>
#include "seo.h"

QQmlApplicationEngine *eng;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    eng = &engine;

    qmlRegisterType<Seo>("at.crowdware.wasm", 1, 0, "Seo");

    const QUrl url(u"qrc:/qmlwasm/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl) 
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

extern "C" {
    void hashchanged(char *hash)
    {
        QString url = "https://raw.githubusercontent.com/CrowdWare/QmlWasm/web/content/" + QString::fromUtf8(hash) + ".qml";
        qDebug() << url << "will be loaded";

        QObject *win = eng->rootObjects().constFirst();
        QMetaObject::invokeMethod(win, "loadPage", Q_ARG(QString, url));
    }
}

