/*#############################################################################
# Copyright (C) 2023 CrowdWare
#
# This file is part of QmlWasm.
#
#  QmlWasm is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  QmlWasm is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with QmlWasm.  If not, see <http://www.gnu.org/licenses/>.
#
#############################################################################*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQuickStyle>
#include <QDebug>
#include "seo.h"

QQmlApplicationEngine *eng;
QGuiApplication *app;

extern "C" {
    void hashchanged(char *hash)
    {
        QString page = QString::fromUtf8(hash);
        if(page == "")
            page = "main";
        QObject *win = eng->rootObjects().constFirst();
        QMetaObject::invokeMethod(win, "loadPage", Q_ARG(QString, page));
    }
}

int main(int argc, char *argv[])
{
    QGuiApplication application(argc, argv);
    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Material");

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
            QStringList args = app->arguments();
            QString url = args[args.count() - 7];
            QString hash = args[args.count() - 6];
            QString theme = args[args.count() - 5];
            QString foreground = args[args.count() - 4];
            QString background = args[args.count() - 3];
            QString primary = args[args.count() - 2];
            QString accent = args[args.count() - 1];
            QObject *win = eng->rootObjects().constFirst();
            QMetaObject::invokeMethod(win, "setProperties",
                                      Q_ARG(QString, url),
                                      Q_ARG(QString, theme),
                                      Q_ARG(QString, foreground),
                                      Q_ARG(QString, background),
                                      Q_ARG(QString, primary),
                                      Q_ARG(QString, accent));
            if(hash.length() > 1)
                hashchanged((char*)hash.mid(1).toUtf8().constData());
            else
                hashchanged((char*)"");
        }
    }, Qt::QueuedConnection);
    engine.load(url);

    return app->exec();
}
