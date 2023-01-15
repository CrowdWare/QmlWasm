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

#ifndef SEO_H
#define SEO_H

#include <QObject>
#include <QString>

class Seo : public QObject
{
    Q_OBJECT
public:
    explicit Seo (QObject* parent = 0);
    Q_INVOKABLE void runScript(QString cmd);
    Q_INVOKABLE void setDescription(QString desc);
    Q_INVOKABLE void setKeywords(QString keys);
    Q_INVOKABLE void setTitle(QString title);
};

#endif // SEO_H
