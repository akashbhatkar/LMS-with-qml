#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>

class login : public QObject
{
    Q_OBJECT
public:
    explicit login(QObject *parent = nullptr);

signals:

};

#endif // LOGIN_H
