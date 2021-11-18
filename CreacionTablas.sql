/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     16/11/2021 1:29:48                           */
/*==============================================================*/


/*==============================================================*/
/* Table: INGRESO                                               */
/*==============================================================*/
create table INGRESO (
   ID_INGRESO           INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   FECHA_INGRESO        DATE                 not null,
   FECHA_SALIDA         DATE                 not null,
   FECHA_CEREMONIADESALIDA DATE                 not null,
   CANTIDAD_INGRESOS    INT4                 not null,
   CANTIDADSALIDAS_CORRECTAS INT4                 not null,
   CANTIDADSALIDAS_INCORRECTAS INT4                 not null,
   INCIDENTE_VIOLENTO   INT4                 not null,
   constraint PK_INGRESO primary key (ID_INGRESO)
);

/*==============================================================*/
/* Index: INGRESO_PK                                            */
/*==============================================================*/
create unique index INGRESO_PK on INGRESO (
ID_INGRESO
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on INGRESO (
ID_PACIENTE
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   ID_PACIENTE          INT4                 not null,
   ID_PROFESIONAL       INT4                 not null,
   NOMBRE_PACIENTE      VARCHAR(30)          not null,
   APELLIDO_PACIENTE    VARCHAR(30)          not null,
   CI_PACIENTE          VARCHAR(30)          not null,
   SEXO_PACIENTE        VARCHAR(20)          not null,
   RAZA_PACIENTE        VARCHAR(20)          not null,
   FECHA_NACIMIENTO     DATE                 not null,
   constraint PK_PACIENTE primary key (ID_PACIENTE)
);

/*==============================================================*/
/* Index: PACIENTE_PK                                           */
/*==============================================================*/
create unique index PACIENTE_PK on PACIENTE (
ID_PACIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on PACIENTE (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_PLAN              INT4                 not null,
   ID_INGRESO           INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   FECHA_PAGO           DATE                 not null,
   METODO_PAGO          VARCHAR(50)          not null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
ID_PAGO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on PAGO (
ID_PLAN
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on PAGO (
ID_INGRESO
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on PAGO (
ID_SERVICIO
);

/*==============================================================*/
/* Table: PATOLOGIA                                             */
/*==============================================================*/
create table PATOLOGIA (
   ID_PATOLOGIA         INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   TIPO_PATOLOGIA       VARCHAR(30)          not null,
   FECHA_ESTIMADAPATOLOGIA DATE                 not null,
   OBSERVACIONES_PATOLOGIA VARCHAR(50)          not null,
   CANTIDAD_PATOLOGIA   INT4                 not null,
   constraint PK_PATOLOGIA primary key (ID_PATOLOGIA)
);

/*==============================================================*/
/* Index: PATOLOGIA_PK                                          */
/*==============================================================*/
create unique index PATOLOGIA_PK on PATOLOGIA (
ID_PATOLOGIA
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on PATOLOGIA (
ID_PACIENTE
);

/*==============================================================*/
/* Table: PLAN                                                  */
/*==============================================================*/
create table PLAN (
   ID_PLAN              INT4                 not null,
   TIPO_PLAN            VARCHAR(30)          not null,
   PRECIO_PLAN          MONEY                not null,
   DURACION_PLAN        VARCHAR(30)          not null,
   constraint PK_PLAN primary key (ID_PLAN)
);

/*==============================================================*/
/* Index: PLAN_PK                                               */
/*==============================================================*/
create unique index PLAN_PK on PLAN (
ID_PLAN
);

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL (
   ID_PROFESIONAL       INT4                 not null,
   NOMBRE_PROFESIONAL   VARCHAR(30)          not null,
   APELLIDO_PROFESIONAL VARCHAR(30)          not null,
   CI_PROFESIONAL       VARCHAR(30)          not null,
   TIPO_PROFESIONAL     VARCHAR(30)          not null,
   ESPECIALIDAD_PROFESIONAL VARCHAR(30)          not null,
   constraint PK_PROFESIONAL primary key (ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: PROFESIONAL_PK                                        */
/*==============================================================*/
create unique index PROFESIONAL_PK on PROFESIONAL (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: RELATIONSHIP_10                                       */
/*==============================================================*/
create table RELATIONSHIP_10 (
   ID_SERVICIO          INT4                 not null,
   ID_PROFESIONAL       INT4                 not null,
   constraint PK_RELATIONSHIP_10 primary key (ID_SERVICIO, ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_PK                                    */
/*==============================================================*/
create unique index RELATIONSHIP_10_PK on RELATIONSHIP_10 (
ID_SERVICIO,
ID_PROFESIONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on RELATIONSHIP_10 (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on RELATIONSHIP_10 (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: RELATIONSHIP_7                                        */
/*==============================================================*/
create table RELATIONSHIP_7 (
   ID_TRATAMIENTO       INT4                 not null,
   ID_PROFESIONAL       INT4                 not null,
   constraint PK_RELATIONSHIP_7 primary key (ID_TRATAMIENTO, ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_7_PK on RELATIONSHIP_7 (
ID_TRATAMIENTO,
ID_PROFESIONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on RELATIONSHIP_7 (
ID_TRATAMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on RELATIONSHIP_7 (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   TIPO_SERVICIO        VARCHAR(30)          not null,
   CANTIDAD_SERVICIO    INT4                 not null,
   OBSERVACIONES_SERVICIO VARCHAR(50)          not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on SERVICIO (
ID_PACIENTE
);

/*==============================================================*/
/* Table: TRATAMIENTO                                           */
/*==============================================================*/
create table TRATAMIENTO (
   ID_TRATAMIENTO       INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   TIPO_TRATAMIENTO     VARCHAR(30)          not null,
   FECHA_TRATAMIENTO    DATE                 not null,
   NOMBRE_TRATAMIENTO   VARCHAR(30)          not null,
   CANTIDAD_TRATAMIENTOS INT4                 not null,
   constraint PK_TRATAMIENTO primary key (ID_TRATAMIENTO)
);

/*==============================================================*/
/* Index: TRATAMIENTO_PK                                        */
/*==============================================================*/
create unique index TRATAMIENTO_PK on TRATAMIENTO (
ID_TRATAMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on TRATAMIENTO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on TRATAMIENTO (
ID_PACIENTE
);

alter table INGRESO
   add constraint FK_INGRESO_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table PACIENTE
   add constraint FK_PACIENTE_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_INGRESO foreign key (ID_INGRESO)
      references INGRESO (ID_INGRESO)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_PLAN foreign key (ID_PLAN)
      references PLAN (ID_PLAN)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table PATOLOGIA
   add constraint FK_PATOLOGI_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_TRATAMIE foreign key (ID_TRATAMIENTO)
      references TRATAMIENTO (ID_TRATAMIENTO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table TRATAMIENTO
   add constraint FK_TRATAMIE_RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table TRATAMIENTO
   add constraint FK_TRATAMIE_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;