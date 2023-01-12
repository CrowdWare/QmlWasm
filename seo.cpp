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

