/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     13/01/2022 9:25:52 p. m.                     */
/*==============================================================*/


alter table CARRERA
   drop constraint FK_CARRERA_ES_EDUCACIO;

alter table DEPARTAMENTO
   drop constraint FK_DEPARTAM_SE_UBICA_PAIS;

alter table EXPERIENCIA
   drop constraint FK_EXPERIEN_EXPERIENC_SUJETO;

alter table EXPERIENCIA
   drop constraint FK_EXPERIEN_EXPERIENC_EMPRESA;

alter table FORMA
   drop constraint FK_FORMA_POSEE_IDIOMA;

alter table IDIOMA
   drop constraint FK_IDIOMA_SABE_SUJETO;

alter table MUNICIPIO
   drop constraint FK_MUNICIPI_PERTENECE_DEPARTAM;

alter table MUNICIPIO
   drop constraint FK_MUNICIPI_RELATIONS_EMPRESA;

alter table SUJETO
   drop constraint FK_SUJETO_CURSA_EDUCACIO;

alter table SUJETO
   drop constraint FK_SUJETO_CURSO_EDUCACIO;

alter table SUJETO
   drop constraint FK_SUJETO_NACE_MUNICIPI;

alter table SUJETO
   drop constraint FK_SUJETO_RECIDE_MUNICIPI;

drop index ES_FK;

drop table CARRERA cascade constraints;

drop index SE_UBICA_FK;

drop table DEPARTAMENTO cascade constraints;

drop table EDUCACIONBASICA cascade constraints;

drop table EDUCACIONSUPERIOR cascade constraints;

drop table EMPRESA cascade constraints;

drop index EXPERIENCIIA_FK;

drop index EXPERIENCIA_FK;

drop table EXPERIENCIA cascade constraints;

drop index POSEE_FK;

drop table FORMA cascade constraints;

drop index SABE_FK;

drop table IDIOMA cascade constraints;

drop index RELATIONSHIP_10_FK;

drop index PERTENECE_FK;

drop table MUNICIPIO cascade constraints;

drop table PAIS cascade constraints;

drop index CURSA_FK;

drop index CURSO_FK;

drop index NACE_FK;

drop index RECIDE_FK;

drop table SUJETO cascade constraints;

drop sequence S_CARRERA;

drop sequence S_EDUCACIONBASICA;

drop sequence S_EDUCACIONSUPERIOR;

create sequence S_CARRERA;

create sequence S_EDUCACIONBASICA;

create sequence S_EDUCACIONSUPERIOR;

/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
create table CARRERA 
(
   CAR_NUMERO_TARJETA_PROFESIONAL NUMBER(6)            not null,
   EDS_CODIGO           INTEGER,
   CAR_NOMBRE           VARCHAR2(20)         not null,
   constraint PK_CARRERA primary key (CAR_NUMERO_TARJETA_PROFESIONAL)
);

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/
create index ES_FK on CARRERA (
   EDS_CODIGO ASC
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   DEP_CODIGO           VARCHAR2(10)         not null,
   DEP_NOMBRE           VARCHAR2(15)         not null,
   PAIS_CODIGO          VARCHAR2(10)         not null,
   constraint PK_DEPARTAMENTO primary key (DEP_CODIGO)
);

/*==============================================================*/
/* Index: SE_UBICA_FK                                           */
/*==============================================================*/
create index SE_UBICA_FK on DEPARTAMENTO (
   PAIS_CODIGO ASC
);

/*==============================================================*/
/* Table: EDUCACIONBASICA                                       */
/*==============================================================*/
create table EDUCACIONBASICA 
(
   EDU_NIVEL_BASICO     NUMBER               not null,
   EDU_CODIGO           NUMBER(6)            not null,
   EDU_TITULACION       VARCHAR2(20)         not null,
   EDU_FECHA_GRADUACION DATE                 not null,
   constraint PK_EDUCACIONBASICA primary key (EDU_CODIGO)
);

/*==============================================================*/
/* Table: EDUCACIONSUPERIOR                                     */
/*==============================================================*/
create table EDUCACIONSUPERIOR 
(
   EDS_CODIGO           NUMBER(6)            not null,
   EDS_NSEMESTRES_APROVADOS NUMBER               not null,
   EDS_GRADUADO         VARCHAR2(15)         not null,
   EDS_FECHA_GRADUACION DATE                 not null,
   constraint PK_EDUCACIONSUPERIOR primary key (EDS_CODIGO)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   EMP_CODIGO           NUMBER               not null,
   EMP_NOMBRE           VARCHAR2(15)         not null,
   EMP_CORREO           VARCHAR2(15)         not null,
   EMP_DIRECCION        VARCHAR2(15)         not null,
   EMP_TELEFONO         NUMBER               not null,
   EMP_CLASIFICACION    VARCHAR2(15)         not null,
   constraint PK_EMPRESA primary key (EMP_CODIGO)
);

/*==============================================================*/
/* Table: EXPERIENCIA                                           */
/*==============================================================*/
create table EXPERIENCIA 
(
   EMP_CODIGO           NUMBER               not null,
   SUJ_IDENTIFICACION   VARCHAR2(15)         not null,
   EXP_FECHA_INGRESO    DATE                 not null,
   EXP_FECHA_SALIDA     DATE                 not null,
   EXP_OCUPACION        VARCHAR2(15)         not null,
   EXP_CARGO            VARCHAR2(15)         not null,
   EXP_DEPENDENCIA      VARCHAR2(15)         not null,
   constraint PK_EXPERIENCIA primary key (EMP_CODIGO, SUJ_IDENTIFICACION)
);

/*==============================================================*/
/* Index: EXPERIENCIA_FK                                        */
/*==============================================================*/
create index EXPERIENCIA_FK on EXPERIENCIA (
   SUJ_IDENTIFICACION ASC
);

/*==============================================================*/
/* Index: EXPERIENCIIA_FK                                       */
/*==============================================================*/
create index EXPERIENCIIA_FK on EXPERIENCIA (
   EMP_CODIGO ASC
);

/*==============================================================*/
/* Table: FORMA                                                 */
/*==============================================================*/
create table FORMA 
(
   FOR_CODIGO           NUMBER               not null,
   IDI_CODIGO           NUMBER,
   FOR_ORAL             VARCHAR2(10)         not null,
   FOR_ESCRITA          VARCHAR2(10)         not null,
   FOR_LECTURA          VARCHAR2(10)         not null,
   constraint PK_FORMA primary key (FOR_CODIGO)
);

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create index POSEE_FK on FORMA (
   IDI_CODIGO ASC
);

/*==============================================================*/
/* Table: IDIOMA                                                */
/*==============================================================*/
create table IDIOMA 
(
   IDI_CODIGO           NUMBER               not null,
   SUJ_IDENTIFICACION   VARCHAR2(15),
   IDI_NOMBRE           VARCHAR2(10)         not null,
   constraint PK_IDIOMA primary key (IDI_CODIGO)
);

/*==============================================================*/
/* Index: SABE_FK                                               */
/*==============================================================*/
create index SABE_FK on IDIOMA (
   SUJ_IDENTIFICACION ASC
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO 
(
   MUN_CODIGO           VARCHAR2(10)         not null,
   MUN_NOMBRE           VARCHAR2(15)         not null,
   DEP_CODIGO           VARCHAR2(10)         not null,
   EMP_CODIGO           NUMBER,
   constraint PK_MUNICIPIO primary key (MUN_CODIGO)
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on MUNICIPIO (
   DEP_CODIGO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on MUNICIPIO (
   EMP_CODIGO ASC
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS 
(
   PAIS_CODIGO          VARCHAR2(10)         not null,
   PAIS_NOMBRE          VARCHAR2(15)         not null,
   constraint PK_PAIS primary key (PAIS_CODIGO)
);

/*==============================================================*/
/* Table: SUJETO                                                */
/*==============================================================*/
create table SUJETO 
(
   SUJ_IDENTIFICACION   VARCHAR2(15)         not null,
   MUN_CODIGO           VARCHAR2(10),
   MUN_MUN_CODIGO       VARCHAR2(10),
   EDU_CODIGO           INTEGER,
   EDS_CODIGO           INTEGER              not null,
   SUJ_PRIMER_NOMBRE    VARCHAR2(15)         not null,
   SUJ_SEGUNDO_NOMBRE   VARCHAR2(15),
   SUJ_PRIMER_APELLIDO  VARCHAR2(15)         not null,
   SUJ_SEGUNDO_APELLIDO VARCHAR2(15),
   SUJ_SEXO             VARCHAR2(15)         not null,
   SUJ_FECHA_NAC        DATE                 not null,
   SUJ_NUMERO_LIBRETA_MILITAR NUMBER               not null,
   SUJ_CLASE_LIBRETA_MILITAR VARCHAR2(15)         not null,
   SUJ_DM_LIBRETA_MILITAR VARCHAR2(15)         not null,
   SUJ_TELEFONO         VARCHAR2(10)         not null,
   SUJ_EMAIL            VARCHAR2(15)         not null,
   constraint PK_SUJETO primary key (SUJ_IDENTIFICACION)
);

/*==============================================================*/
/* Index: RECIDE_FK                                             */
/*==============================================================*/
create index RECIDE_FK on SUJETO (
   MUN_MUN_CODIGO ASC
);

/*==============================================================*/
/* Index: NACE_FK                                               */
/*==============================================================*/
create index NACE_FK on SUJETO (
   MUN_CODIGO ASC
);

/*==============================================================*/
/* Index: CURSO_FK                                              */
/*==============================================================*/
create index CURSO_FK on SUJETO (
   EDU_CODIGO ASC
);

/*==============================================================*/
/* Index: CURSA_FK                                              */
/*==============================================================*/
create index CURSA_FK on SUJETO (
   EDS_CODIGO ASC
);

alter table CARRERA
   add constraint FK_CARRERA_ES_EDUCACIO foreign key (EDS_CODIGO)
      references EDUCACIONSUPERIOR (EDS_CODIGO);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_SE_UBICA_PAIS foreign key (PAIS_CODIGO)
      references PAIS (PAIS_CODIGO);

alter table EXPERIENCIA
   add constraint FK_EXPERIEN_EXPERIENC_SUJETO foreign key (SUJ_IDENTIFICACION)
      references SUJETO (SUJ_IDENTIFICACION);

alter table EXPERIENCIA
   add constraint FK_EXPERIEN_EXPERIENC_EMPRESA foreign key (EMP_CODIGO)
      references EMPRESA (EMP_CODIGO);

alter table FORMA
   add constraint FK_FORMA_POSEE_IDIOMA foreign key (IDI_CODIGO)
      references IDIOMA (IDI_CODIGO);

alter table IDIOMA
   add constraint FK_IDIOMA_SABE_SUJETO foreign key (SUJ_IDENTIFICACION)
      references SUJETO (SUJ_IDENTIFICACION);

alter table MUNICIPIO
   add constraint FK_MUNICIPI_PERTENECE_DEPARTAM foreign key (DEP_CODIGO)
      references DEPARTAMENTO (DEP_CODIGO);

alter table MUNICIPIO
   add constraint FK_MUNICIPI_RELATIONS_EMPRESA foreign key (EMP_CODIGO)
      references EMPRESA (EMP_CODIGO);

alter table SUJETO
   add constraint FK_SUJETO_CURSA_EDUCACIO foreign key (EDS_CODIGO)
      references EDUCACIONSUPERIOR (EDS_CODIGO);

alter table SUJETO
   add constraint FK_SUJETO_CURSO_EDUCACIO foreign key (EDU_CODIGO)
      references EDUCACIONBASICA (EDU_CODIGO);

alter table SUJETO
   add constraint FK_SUJETO_NACE_MUNICIPI foreign key (MUN_CODIGO)
      references MUNICIPIO (MUN_CODIGO);

alter table SUJETO
   add constraint FK_SUJETO_RECIDE_MUNICIPI foreign key (MUN_MUN_CODIGO)
      references MUNICIPIO (MUN_CODIGO);

