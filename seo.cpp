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

void Seo::setTitle(QString title)
{
    QString cmd = "document.title = \"" + title + "\";";
    emscripten_run_script(cmd.toUtf8().data());
}

void Seo::runScript(QString cmd)
{
    emscripten_run_script(cmd.toUtf8().data());
}

