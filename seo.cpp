#include "seo.h"
#include <emscripten/emscripten.h>
#include <qdebug.h>

Seo::Seo(QObject* parent) : QObject(parent)
{

}

void Seo::setDescription(QString desc)
{
    QString cmd = "document.querySelector('meta[name=\"description\"]').setAttribute(\"content\",\"" + desc + "\")";
    emscripten_run_script(cmd.toUtf8().data());
}

void Seo::setKeywords(QString keys)
{
    QString cmd = "document.querySelector('meta[name=\"keywords\"]').setAttribute(\"content\",\"" + keys + "\")";
    emscripten_run_script(cmd.toUtf8().data());
}

void Seo::setUrl(QString url)
{
    QString cmd = "window.history.replaceState({}, \"\", \"#" + url + "\");";
    emscripten_run_script(cmd.toUtf8().data());
}

void Seo::setTitle(QString title)
{
    QString cmd = "document.title = \"" + title + "\";";
    emscripten_run_script(cmd.toUtf8().data());
}

