#include "sdadx.h"

sdadx::sdadx(QObject *parent) : QObject(parent)
{

}
void sdadx::on_pushButton_clicked()
{



        QFile file("/home/dtiot08/DEL-ES1297/trying-QT/lmswith1window/SignInData.txt");
        if(!file.open(QFile::ReadOnly)){
            QMessageBox::warning(this," ","File not found");
        }
        else
        {
        QTextStream In(&file);
        username=ui->lineEdit->text();
        password=ui->lineEdit_2->text();
        QString text2=username+password;
//        while(In.atEnd())
//        {
//            text=In.readLine();
//        }
        if(fileread(text2))
            ui->stackedWidget->setCurrentIndex(1);
        else
            QMessageBox::warning(this,"warning","username or password is incrorrect");

        file.flush();
        file.close();
    }

}
