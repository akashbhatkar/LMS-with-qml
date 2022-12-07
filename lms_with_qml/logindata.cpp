#include "logindata.h"
#include<QDebug>
#include<QSqlQuery>
#include<QSqlError>
#include<QSqlRecord>
#include<string>
#include<QVector>

logindata::logindata(QObject *parent) : QObject(parent)
{

}
logindata::logindata(QString parent)
{
    m_db= QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(parent);
    if(!m_db.open())
    {
        qDebug()<<"Error! connection with database failed";
    }
    else
    {
        qDebug()<<"database commection is ok";
    }

}
bool logindata::createTable()
{
    bool success = false;

    QSqlQuery query;
    query.prepare("CREATE TABLE signupdatatable(id INTEGER PRIMARY KEY, username TEXT, password TEXT);");

    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'people': one might already exist.";
        success = false;
    }

    return success;
}

void logindata::adduser(QString username, QString password)
{
    qInfo()<<username<<"\t"<<password;

    if (!username.isEmpty()||!password.isEmpty())
    {
        qInfo()<<username<<"\t"<<password;
        QSqlQuery queryAdd;

        queryAdd.prepare("INSERT INTO signupdatatable (username,password) VALUES (:username,:password)");
        //        queryAdd.prepare("INSERT INTO signupdatatable (password) VALUES (:password)");
        queryAdd.bindValue(":username", username);
        queryAdd.bindValue(":password",password);

        if(queryAdd.exec())
        {
            qDebug()<< "add success";
        }
        else
        {
            qDebug() << "add user failed: " << queryAdd.lastError();
        }
    }
    else
    {
        qDebug() << "add user failed: name cannot be empty";
    }

}



int logindata::login(QString user,QString pass) const
{
    if((user=="")&&(pass==""))
    {
        return 2;
    }
    else
    {


        QSqlQuery checkQuery;

        checkQuery.bindValue(":username", user);

        if (checkQuery.exec("SELECT username,password FROM signupdatatable WHERE username =\'"+ user +"\' AND password='"+pass+"\'"))
        {
            if (checkQuery.next())
            {

                return 1;
            }
            else
            {
                return 4;
            }


        }
    }
    return 0;
}



int logindata::signup(QString username, QString pass, QString repass)
{

    if(pass!=repass)
        return 2;
    else if((username=="")||(pass=="")||(repass==""))
    {
        return 3;
    }
    else if(checkrepeateentry(username))
    {
        return 4;
    }
    else
    {

        createTable();
        adduser(username,pass);


        return 0;
    }
}
/***********************************************************************************      ADDBOOK FUNCTIONS      ***************************************************************************************************/
bool logindata::createbookTable()
{
    bool success = false;

    QSqlQuery query;
    query.prepare("CREATE TABLE bookdatatable(id INTEGER PRIMARY KEY, Books TEXT, Quantity INTEGER);");

    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'bookdatatable': one might already exist.";
        success = false;
    }

    return success;
}

void logindata::addbookdata(QString Books, int Quantity)
{
    QSqlQuery queryAdd;
    if(checkbooks(Books))
    {
        qDebug("Book is available already ");
        switch (Quantity) {

        case 1:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+1 WHERE Books=\'"+ Books +"\'" );
            break;
        case 2:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+2 WHERE Books=\'"+ Books +"\'" );
            break;
        case 3:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+3 WHERE Books=\'"+ Books +"\'" );
            break;
        case 4:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+4 WHERE Books=\'"+ Books +"\'" );
            break;
        case 5:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+5 WHERE Books=\'"+ Books +"\'" );
            break;
        case 6:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+6 WHERE Books=\'"+ Books +"\'" );
            break;
        case 7:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+7 WHERE Books=\'"+ Books +"\'" );
            break;
        case 8:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+8 WHERE Books=\'"+ Books +"\'" );
            break;
        case 9:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+9 WHERE Books=\'"+ Books +"\'" );
            break;
        case 10:queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+10 WHERE Books=\'"+ Books +"\'" );
            break;


        }

        queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Books +"\')+'+ Quan +' WHERE Books=\'"+ Books +"\'" );


    }

    else //if (!Books.isEmpty()||Quantity==0)
    {
        queryAdd.prepare("INSERT INTO bookdatatable (Books,Quantity) VALUES (:Books,:Quantity)");
        queryAdd.bindValue(":Books", Books);
        queryAdd.bindValue(":Quantity",Quantity);

        if(queryAdd.exec())
        {
            qDebug()<< "add success";
        }
        else
        {
            qDebug() << "add book failed: " << queryAdd.lastError();
        }
    }
    int q=queryAdd.prepare("SELECT Count(*) FROM bookdatatable");
    qDebug()<<q;
}

int logindata::checkbooks(QString Books)
{
    QSqlQuery checkQuery;

    checkQuery.bindValue(":Books", Books);

    if (checkQuery.exec("SELECT Books FROM bookdatatable WHERE Books =\'"+ Books +"\'"))
    {

        if (checkQuery.next())
        {


            return 1;
        }

    }
    return 0;
}


int logindata::checkvalidbooks(QString books , int quantity)
{
    if((books=="")||(quantity==0))
    {
        return 1;
    }

    else
    {
        createbookTable();
        addbookdata(books,quantity);


    }
    return 0;
}
/**************************************************************************************       View Book     *********************************************************************************************************/
QList<QString> logindata::bookpass()
{

    QList<QString> v;
    QSqlQuery query("SELECT * FROM bookdatatable");
    int id=query.record().indexOf("Books");
    QString Book;
    while (query.next())
    {
        Book=query.value(id).toString();
        v.append(Book);
    }
    return v;
}

QList<QString> logindata::quantitypass()
{
    QList<QString> v;
    QSqlQuery query("SELECT * FROM bookdatatable");
    int id=query.record().indexOf("Quantity");
    QString Book;
    while (query.next())
    {
        Book=query.value(id).toString();
        v.append(Book);
    }
    return v;
}

QList<QString> logindata::getstudent()
{
    QList<QString> v;
    QSqlQuery query("SELECT * FROM studentdata");
    int id=query.record().indexOf("Student");
    QString Book;
    while (query.next())
    {
        Book=query.value(id).toString();
        v.append(Book);
    }
    return v;
}

QList<QString> logindata::getemail()
{
    QList<QString> v;
    QSqlQuery query("SELECT * FROM studentdata");
    int id=query.record().indexOf("Email");
    QString Book;
    while (query.next())
    {
        Book=query.value(id).toString();
        v.append(Book);
    }
    return v;

}

int logindata::issuedbooks(QString Student,QString Book)
{
    QSqlQuery checkQuery;

    checkQuery.bindValue(":Student", Student);
    checkQuery.bindValue(":Book", Book);

    if (checkQuery.exec("SELECT Student,Book FROM issuetable WHERE Student =\'"+ Student +"\' AND Book='"+Book+"\'"))
    {
        if (checkQuery.next())
        {
           qDebug()<<"found";
            deleteentry(Student,Book);
//           checkQuery.prepare("DELETE FROM issuetable WHERE condition Student =\'"+ Student +"\' AND Book='"+Book+"\'");

            return 1;
        }
        else
        {
            return 4;
        }

    }
    qDebug()<<"Not found";
    return 0;
}
void logindata::deleteentry(QString Student, QString Book)
{
    QSqlQuery checkQuery;
    checkQuery.bindValue(":Student", Student);
    checkQuery.bindValue(":Book", Book);
    if(checkQuery.exec("DELETE FROM issuetable WHERE Student =\'"+ Student +"\' AND Book='"+Book+"\'"))
        checkQuery.next();
    QSqlQuery queryAdd;
    queryAdd.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ Book +"\')+1 WHERE Books=\'"+ Book +"\'" );

//    checkQuery.exec;

}

int logindata::checkrepeatissue(QString Book, QString Student)
{
    QSqlQuery checkQuery;

    checkQuery.bindValue(":Book", Book);
    checkQuery.bindValue(":Student", Student);

    if (checkQuery.exec("SELECT Student,Book FROM issuetable WHERE Student =\'"+Student +"\' AND Book='"+ Book+"\'"))
    {
        if (checkQuery.next())
        {

            return 1;
        }
        else
        {
            return 4;
        }
    }
    return 0;

}


/*****************************************************************************************     ADD-USER       *******************************************************************************************************/
bool logindata::createstudentTable()
{
    bool success = false;

    QSqlQuery query;
    query.prepare("CREATE TABLE studentdata(id INTEGER PRIMARY KEY, Student TEXT, Email TEXT);");

    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'stddatatable': one might already exist.";
        success = false;
    }

    return success;
}

void logindata::addbookstudent(QString studentname, QString emailid)
{
    if(checkstudent(studentname))
    {
        qDebug()<<"Student already added";
    }
    else
    {
        QSqlQuery qstdadd;
        qstdadd.prepare("INSERT INTO studentdata(Student,Email) VALUES (:Student,:Email)");
        qstdadd.bindValue(":Student",studentname);
        qstdadd.bindValue(":Email",emailid);

        if(qstdadd.exec())
        {
            qDebug()<< "add student success";
        }
        else
        {
            qDebug() << "add student  failed: " << qstdadd.lastError();
        }
    }


}

int logindata::checkstudent(QString studentname)
{
    QSqlQuery checkQuery;

    checkQuery.bindValue(":Student", studentname);

    if (checkQuery.exec("SELECT Student FROM studentdata WHERE Student =\'"+ studentname +"\'"))
    {
        if (checkQuery.next())
        {

            return 1;
        }

    }
    return 0;
}

int logindata::checkrepeateentry(QString username)
{
    QSqlQuery checkQuery;

    checkQuery.bindValue(":username", username);

    if (checkQuery.exec("SELECT username FROM signupdatatable WHERE username =\'"+ username +"\'"))
    {
        if (checkQuery.next())
        {

            return 1;
        }

    }
    return 0;
}


int logindata::checkvalidstudent(QString studentname, QString email)
{
    qDebug()<<studentname<<email;
    if((studentname=="")||(email==""))
    {
        return 1;
    }
    else if(!email.contains("@gmail.com"))
    {
        return 2;
    }
    else if(checkstudent(studentname))
    {
        return 4;
    }
    else
    {
        qDebug()<<createstudentTable();
        addbookstudent(studentname,email);


    }
    return 0;
}

/*******************************************************************************    ISSUE BOOK  ***********************************************************************************************/
bool logindata::issuetable()
{
    bool success = false;

    QSqlQuery query;
    query.prepare("CREATE TABLE issuetable(id INTEGER PRIMARY KEY, Student TEXT, Book TEXT);");

    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'issuetable': one might already exist.";
        success = false;
    }

    return success;
}

int logindata::existbookstudent(QString student , QString book)
{
    QSqlQuery checkQuery;

    checkQuery.bindValue(":Student", student);

    if (checkQuery.exec("SELECT Student,Book FROM issuetable WHERE Student =\'"+ student +"\' AND Book='"+book+"\'"))
    {
        if (checkQuery.next())
        {

            return 1;
        }
        else
        {
            return 4;
        }


    }
    return 0;
}





int logindata::validbook(QString bookname,QString student)
{
    issuetable();

    if(checkstudent(student)==0)
    {
        qDebug()<<student;
        return 1;
    }

    else if(checkbooks(bookname)==0)
    {
        return 1;
    }
    else if(checkrepeatissue(bookname,student)==1)
    {
        return 4;
    }

    else
    {
        if(existbookstudent(bookname,student))
        {
            QSqlQuery queryAdd;

            queryAdd.prepare("INSERT INTO issuetable(Student,Book) VALUES (:student,:bookname)");
            queryAdd.bindValue(":student",student );
            queryAdd.bindValue(":bookname",bookname);
            queryAdd.exec();
            QSqlQuery query;
            query.exec("UPDATE bookdatatable SET Quantity =(SELECT Quantity FROM bookdatatable WHERE Books=\'"+ bookname +"\')-1 WHERE Books=\'"+ bookname +"\'" );


            return 0;
        }
    }
    return 0;
}

/*****************************************************************************    RETURN BOOK   **********************************************************************************************/
int logindata::returnbooks(QString studentname)
{
    if(checkstudent(studentname)==0)
    {
        return 1;
    }
    return 0;
}






