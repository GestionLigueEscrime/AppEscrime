/*
 ----------------------------------------------------------------------------
             Génération d'une base de données pour
                        SQL Server 7.x
                       (21/1/2015 12:26:45)
 ----------------------------------------------------------------------------
     Nom de la base : BaseEscrime
     Projet : Espace de travail
     Auteur : MAURIN Arnaud
     Date de dernière modification : 21/1/2015 12:25:42
 ----------------------------------------------------------------------------
*/

/* -----------------------------------------------------------------------------
      OUVERTURE DE LA BASE BaseEscrime
----------------------------------------------------------------------------- */

create database BaseEscrime
go

use BaseEscrime
go



/* -----------------------------------------------------------------------------
      TABLE : COMPETITION
----------------------------------------------------------------------------- */

create table COMPETITION
  (
     CODECOMPET int  not null  ,
     NUMCLUB int  not null  ,
     CODECATEG int  not null  ,
     CODEARME int  not null  
     ,
     constraint PK_COMPETITION primary key (CODECOMPET)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : CATEGORIE
----------------------------------------------------------------------------- */

create table CATEGORIE
  (
     CODECATEG int  not null  ,
     NOMCATEG char(32)  null  
     ,
     constraint PK_CATEGORIE primary key (CODECATEG)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : CLUB
----------------------------------------------------------------------------- */

create table CLUB
  (
     NUMCLUB int  not null  ,
     NOMCLUB varchar(128)  null  ,
     VILLECLUB varchar(128)  null  
     ,
     constraint PK_CLUB primary key (NUMCLUB)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : ARME
----------------------------------------------------------------------------- */

create table ARME
  (
     CODEARME int  not null  ,
     NOMARME char(32)  null  
     ,
     constraint PK_ARME primary key (CODEARME)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : MAITREDARME
----------------------------------------------------------------------------- */

create table MAITREDARME
  (
     NUMLICENCEMAITRE int  not null  ,
     NUMCLUB int  not null  ,
     NOMMAITRE varchar(128)  null  ,
     PRENOMMAITRE varchar(128)  null  ,
     DATENAISSMAITRE datetime  null  
     ,
     constraint PK_MAITREDARME primary key (NUMLICENCEMAITRE)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : ETRE_RESPONSABLE
----------------------------------------------------------------------------- */

create table ETRE_RESPONSABLE
  (
     CODECOMPET int  not null  ,
     NUMLICENCEMAITRE int  not null  
     ,
     constraint PK_ETRE_RESPONSABLE primary key (CODECOMPET, NUMLICENCEMAITRE)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : ARBITRER
----------------------------------------------------------------------------- */

create table ARBITRER
  (
     CODECOMPET int  not null  ,
     NUMLICENCEMAITRE int  not null  
     ,
     constraint PK_ARBITRER primary key (CODECOMPET, NUMLICENCEMAITRE)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : SE_SPECIALISER
----------------------------------------------------------------------------- */

create table SE_SPECIALISER
  (
     CODEARME int  not null  ,
     NUMLICENCEMAITRE int  not null  
     ,
     constraint PK_SE_SPECIALISER primary key (CODEARME, NUMLICENCEMAITRE)
  ) 
go



/* -----------------------------------------------------------------------------
      REFERENCES SUR LES TABLES
----------------------------------------------------------------------------- */



alter table COMPETITION 
     add constraint FK_COMPETITION_CLUB foreign key (NUMCLUB) 
               references CLUB (NUMCLUB)
go




alter table COMPETITION 
     add constraint FK_COMPETITION_CATEGORIE foreign key (CODECATEG) 
               references CATEGORIE (CODECATEG)
go




alter table COMPETITION 
     add constraint FK_COMPETITION_ARME foreign key (CODEARME) 
               references ARME (CODEARME)
go




alter table MAITREDARME 
     add constraint FK_MAITREDARME_CLUB foreign key (NUMCLUB) 
               references CLUB (NUMCLUB)
go




alter table ETRE_RESPONSABLE 
     add constraint FK_ETRE_RESPONSABLE_COMPETITION foreign key (CODECOMPET) 
               references COMPETITION (CODECOMPET)
go




alter table ETRE_RESPONSABLE 
     add constraint FK_ETRE_RESPONSABLE_MAITREDARME foreign key (NUMLICENCEMAITRE) 
               references MAITREDARME (NUMLICENCEMAITRE)
go




alter table ARBITRER 
     add constraint FK_ARBITRER_COMPETITION foreign key (CODECOMPET) 
               references COMPETITION (CODECOMPET)
go




alter table ARBITRER 
     add constraint FK_ARBITRER_MAITREDARME foreign key (NUMLICENCEMAITRE) 
               references MAITREDARME (NUMLICENCEMAITRE)
go




alter table SE_SPECIALISER 
     add constraint FK_SE_SPECIALISER_ARME foreign key (CODEARME) 
               references ARME (CODEARME)
go




alter table SE_SPECIALISER 
     add constraint FK_SE_SPECIALISER_MAITREDARME foreign key (NUMLICENCEMAITRE) 
               references MAITREDARME (NUMLICENCEMAITRE)
go




/*
 -----------------------------------------------------------------------------
               FIN DE GENERATION
 -----------------------------------------------------------------------------
*/