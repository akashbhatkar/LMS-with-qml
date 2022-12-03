#ifndef LOGINDATA_H
#define LOGINDATA_H

#include <QObject>
#include<QSqlDatabase>
#include<string>



class logindata : public QObject
{
    Q_OBJECT
public:
    explicit logindata(QObject *parent = nullptr);
    logindata(QString );
    bool createTable();
    void adduser(QString,QString);
    bool createbookTable();
    void addbookdata(QString,int);
    int checkbooks(QString);
    bool createstudentTable();
    void addbookstudent(QString,QString);
    int checkstudent(QString);
    int checkrepeateentry(QString);
    bool issuetable();
    int existbookstudent(QString,QString);


signals:
public slots:

    int login(QString,QString) const;
    int signup(QString,QString,QString);
      int checkvalidbooks(QString,int);
      int checkvalidstudent(QString,QString);
      int validbook(QString,QString);
      QString printAllBooks();

private:
    QSqlDatabase m_db;
};

#endif // LOGINDATA_H
