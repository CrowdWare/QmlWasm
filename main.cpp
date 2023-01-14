#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QDebug>
#include "seo.h"

QQmlApplicationEngine *eng;
QGuiApplication *app;

extern "C" {
    void hashchanged(char *hash)
    {
        QString url;
        if(strlen(hash))
            url = "https://raw.githubusercontent.com/CrowdWare/QmlWasm/web/content/" + QString::fromUtf8(hash) + ".qml";
        else
            url = "";
        QObject *win = eng->rootObjects().constFirst();
        QMetaObject::invokeMethod(win, "loadPage", Q_ARG(QString, url));
    }
}

int main(int argc, char *argv[])
{
    QGuiApplication application(argc, argv);
    QQmlApplicationEngine engine;
    eng = &engine;
    app = &application;

    qmlRegisterType<Seo>("at.crowdware.wasm", 1, 0, "Seo");

    const QUrl url(u"qrc:/qmlwasm/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, app, [url](QObject *obj, const QUrl &objUrl)
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
        else
        {
            QString hash = app->arguments().constLast();
            if(hash.length() > 1)
                hashchanged((char*)hash.mid(1).toUtf8().constData());
        }
    }, Qt::QueuedConnection);
    engine.load(url);

    return app->exec();
}
