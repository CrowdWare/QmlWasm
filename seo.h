#ifndef SEO_H
#define SEO_H

#include <QObject>
#include <QString>

class Seo : public QObject
{
    Q_OBJECT
public:
    explicit Seo (QObject* parent = 0);
    Q_INVOKABLE void setDescription(QString desc);
    Q_INVOKABLE void setKeywords(QString keys);
    Q_INVOKABLE void setTitle(QString title);
    Q_INVOKABLE void setUrl(QString url);
};

#endif // SEO_H
