-- ------------------------------------------------------------------------------- 
--   Génération des triggers de la base 
--   de données : Sous_modèle1
--   (21/1/2015 12:28:23)
-- ------------------------------------------------------------------------------- 

/* -----------------------------------------------------------------------------
      OUVERTURE DE LA BASE Sous_modèle1
----------------------------------------------------------------------------- */

use Sous_modèle1
go

-- ------------------------------------------------------------------------------- 
--   Table : COMPETITION
-- ------------------------------------------------------------------------------- 

create trigger TD_COMPETITION
on COMPETITION for delete as
begin
     declare  @errno   int,
                @errmsg  varchar(255)

     /* Interdire la suppression d'une occurrence de COMPETITION s'il existe des */
     /* occurrences correspondantes de la table ETRE_RESPONSABLE. */
     if exists
          (
          select * from deleted,ETRE_RESPONSABLE
          where
               ETRE_RESPONSABLE.CODECOMPET = deleted.CODECOMPET
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer COMPETITION car ETRE_RESPONSABLE existe.'
          goto error
     end
     /* Interdire la suppression d'une occurrence de COMPETITION s'il existe des */
     /* occurrences correspondantes de la table ARBITRER. */
     if exists
          (
          select * from deleted,ARBITRER
          where
               ARBITRER.CODECOMPET = deleted.CODECOMPET
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer COMPETITION car ARBITRER existe.'
          goto error
     end

     return
     error:
          raiserror @errno @errmsg
          rollback transaction
end
go


create trigger TU_COMPETITION
on COMPETITION
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la modification de la clé étrangère de la table COMPETITION s'il */
     /* n'existe pas d'occurrence correspondante de la table CLUB. */
     if
          update(NUMCLUB)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,CLUB
          where
               inserted.NUMCLUB = CLUB.NUMCLUB
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30007,
                  @errmsg = 'Impossible de mettre à jour COMPETITION car CLUB n''existe pas.'
               goto error
         end
     end
     /* Interdire la modification de la clé étrangère de la table COMPETITION s'il */
     /* n'existe pas d'occurrence correspondante de la table CATEGORIE. */
     if
          update(CODECATEG)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,CATEGORIE
          where
               inserted.CODECATEG = CATEGORIE.CODECATEG
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30007,
                  @errmsg = 'Impossible de mettre à jour COMPETITION car CATEGORIE n''existe pas.'
               goto error
         end
     end
     /* Interdire la modification de la clé étrangère de la table COMPETITION s'il */
     /* n'existe pas d'occurrence correspondante de la table ARME. */
     if
          update(CODEARME)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,ARME
          where
               inserted.CODEARME = ARME.CODEARME
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30007,
                  @errmsg = 'Impossible de mettre à jour COMPETITION car ARME n''existe pas.'
               goto error
         end
     end
     /* Ne pas modifier la clé primaire de la table COMPETITION s'il existe des */
     /* occurrences correspondantes dans la table ETRE_RESPONSABLE. */
     if
          update(CODECOMPET)
     begin
          if exists
               (
               select * from deleted,ETRE_RESPONSABLE
               where
                    ETRE_RESPONSABLE.CODECOMPET = deleted.CODECOMPET
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier COMPETITION car ETRE_RESPONSABLE existe.'
               goto error
          end
     end
     /* Ne pas modifier la clé primaire de la table COMPETITION s'il existe des */
     /* occurrences correspondantes dans la table ARBITRER. */
     if
          update(CODECOMPET)
     begin
          if exists
               (
               select * from deleted,ARBITRER
               where
                    ARBITRER.CODECOMPET = deleted.CODECOMPET
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier COMPETITION car ARBITRER existe.'
               goto error
          end
     end

     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


create trigger TI_COMPETITION
on COMPETITION 
for insert as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la création d'une occurrence de COMPETITION s'il n'existe pas */
     /* d'occurrence correspondante dans la table CLUB. */
     if
          update(NUMCLUB)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,CLUB
          where
               inserted.NUMCLUB = CLUB.NUMCLUB
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer COMPETITION car CLUB n''existe pas.'
               goto error
          end
     end
     /* Interdire la création d'une occurrence de COMPETITION s'il n'existe pas */
     /* d'occurrence correspondante dans la table CATEGORIE. */
     if
          update(CODECATEG)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,CATEGORIE
          where
               inserted.CODECATEG = CATEGORIE.CODECATEG
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer COMPETITION car CATEGORIE n''existe pas.'
               goto error
          end
     end
     /* Interdire la création d'une occurrence de COMPETITION s'il n'existe pas */
     /* d'occurrence correspondante dans la table ARME. */
     if
          update(CODEARME)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,ARME
          where
               inserted.CODEARME = ARME.CODEARME
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer COMPETITION car ARME n''existe pas.'
               goto error
          end
     end


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


-- ------------------------------------------------------------------------------- 
--   Table : CATEGORIE
-- ------------------------------------------------------------------------------- 

create trigger TD_CATEGORIE
on CATEGORIE for delete as
begin
     declare  @errno   int,
                @errmsg  varchar(255)

     /* Interdire la suppression d'une occurrence de CATEGORIE s'il existe des */
     /* occurrences correspondantes de la table COMPETITION. */
     if exists
          (
          select * from deleted,COMPETITION
          where
               COMPETITION.CODECATEG = deleted.CODECATEG
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer CATEGORIE car COMPETITION existe.'
          goto error
     end

     return
     error:
          raiserror @errno @errmsg
          rollback transaction
end
go


create trigger TU_CATEGORIE
on CATEGORIE
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Ne pas modifier la clé primaire de la table CATEGORIE s'il existe des */
     /* occurrences correspondantes dans la table COMPETITION. */
     if
          update(CODECATEG)
     begin
          if exists
               (
               select * from deleted,COMPETITION
               where
                    COMPETITION.CODECATEG = deleted.CODECATEG
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier CATEGORIE car COMPETITION existe.'
               goto error
          end
     end

     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


-- ------------------------------------------------------------------------------- 
--   Table : CLUB
-- ------------------------------------------------------------------------------- 

create trigger TD_CLUB
on CLUB for delete as
begin
     declare  @errno   int,
                @errmsg  varchar(255)

     /* Interdire la suppression d'une occurrence de CLUB s'il existe des */
     /* occurrences correspondantes de la table COMPETITION. */
     if exists
          (
          select * from deleted,COMPETITION
          where
               COMPETITION.NUMCLUB = deleted.NUMCLUB
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer CLUB car COMPETITION existe.'
          goto error
     end
     /* Interdire la suppression d'une occurrence de CLUB s'il existe des */
     /* occurrences correspondantes de la table MAITREDARME. */
     if exists
          (
          select * from deleted,MAITREDARME
          where
               MAITREDARME.NUMCLUB = deleted.NUMCLUB
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer CLUB car MAITREDARME existe.'
          goto error
     end

     return
     error:
          raiserror @errno @errmsg
          rollback transaction
end
go


create trigger TU_CLUB
on CLUB
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Ne pas modifier la clé primaire de la table CLUB s'il existe des */
     /* occurrences correspondantes dans la table COMPETITION. */
     if
          update(NUMCLUB)
     begin
          if exists
               (
               select * from deleted,COMPETITION
               where
                    COMPETITION.NUMCLUB = deleted.NUMCLUB
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier CLUB car COMPETITION existe.'
               goto error
          end
     end
     /* Ne pas modifier la clé primaire de la table CLUB s'il existe des */
     /* occurrences correspondantes dans la table MAITREDARME. */
     if
          update(NUMCLUB)
     begin
          if exists
               (
               select * from deleted,MAITREDARME
               where
                    MAITREDARME.NUMCLUB = deleted.NUMCLUB
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier CLUB car MAITREDARME existe.'
               goto error
          end
     end

     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


-- ------------------------------------------------------------------------------- 
--   Table : ARME
-- ------------------------------------------------------------------------------- 

create trigger TD_ARME
on ARME for delete as
begin
     declare  @errno   int,
                @errmsg  varchar(255)

     /* Interdire la suppression d'une occurrence de ARME s'il existe des */
     /* occurrences correspondantes de la table SE_SPECIALISER. */
     if exists
          (
          select * from deleted,SE_SPECIALISER
          where
               SE_SPECIALISER.CODEARME = deleted.CODEARME
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer ARME car SE_SPECIALISER existe.'
          goto error
     end
     /* Interdire la suppression d'une occurrence de ARME s'il existe des */
     /* occurrences correspondantes de la table COMPETITION. */
     if exists
          (
          select * from deleted,COMPETITION
          where
               COMPETITION.CODEARME = deleted.CODEARME
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer ARME car COMPETITION existe.'
          goto error
     end

     return
     error:
          raiserror @errno @errmsg
          rollback transaction
end
go


create trigger TU_ARME
on ARME
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Ne pas modifier la clé primaire de la table ARME s'il existe des */
     /* occurrences correspondantes dans la table SE_SPECIALISER. */
     if
          update(CODEARME)
     begin
          if exists
               (
               select * from deleted,SE_SPECIALISER
               where
                    SE_SPECIALISER.CODEARME = deleted.CODEARME
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier ARME car SE_SPECIALISER existe.'
               goto error
          end
     end
     /* Ne pas modifier la clé primaire de la table ARME s'il existe des */
     /* occurrences correspondantes dans la table COMPETITION. */
     if
          update(CODEARME)
     begin
          if exists
               (
               select * from deleted,COMPETITION
               where
                    COMPETITION.CODEARME = deleted.CODEARME
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier ARME car COMPETITION existe.'
               goto error
          end
     end

     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


-- ------------------------------------------------------------------------------- 
--   Table : MAITREDARME
-- ------------------------------------------------------------------------------- 

create trigger TD_MAITREDARME
on MAITREDARME for delete as
begin
     declare  @errno   int,
                @errmsg  varchar(255)

     /* Interdire la suppression d'une occurrence de MAITREDARME s'il existe des */
     /* occurrences correspondantes de la table ETRE_RESPONSABLE. */
     if exists
          (
          select * from deleted,ETRE_RESPONSABLE
          where
               ETRE_RESPONSABLE.NUMLICENCEMAITRE = deleted.NUMLICENCEMAITRE
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer MAITREDARME car ETRE_RESPONSABLE existe.'
          goto error
     end
     /* Interdire la suppression d'une occurrence de MAITREDARME s'il existe des */
     /* occurrences correspondantes de la table ARBITRER. */
     if exists
          (
          select * from deleted,ARBITRER
          where
               ARBITRER.NUMLICENCEMAITRE = deleted.NUMLICENCEMAITRE
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer MAITREDARME car ARBITRER existe.'
          goto error
     end
     /* Interdire la suppression d'une occurrence de MAITREDARME s'il existe des */
     /* occurrences correspondantes de la table SE_SPECIALISER. */
     if exists
          (
          select * from deleted,SE_SPECIALISER
          where
               SE_SPECIALISER.NUMLICENCEMAITRE = deleted.NUMLICENCEMAITRE
          )
     begin
          select @errno  = 30001,
                @errmsg = 'Impossible de supprimer MAITREDARME car SE_SPECIALISER existe.'
          goto error
     end

     return
     error:
          raiserror @errno @errmsg
          rollback transaction
end
go


create trigger TU_MAITREDARME
on MAITREDARME
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la modification de la clé étrangère de la table MAITREDARME s'il */
     /* n'existe pas d'occurrence correspondante de la table CLUB. */
     if
          update(NUMCLUB)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,CLUB
          where
               inserted.NUMCLUB = CLUB.NUMCLUB
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30007,
                  @errmsg = 'Impossible de mettre à jour MAITREDARME car CLUB n''existe pas.'
               goto error
         end
     end
     /* Ne pas modifier la clé primaire de la table MAITREDARME s'il existe des */
     /* occurrences correspondantes dans la table ETRE_RESPONSABLE. */
     if
          update(NUMLICENCEMAITRE)
     begin
          if exists
               (
               select * from deleted,ETRE_RESPONSABLE
               where
                    ETRE_RESPONSABLE.NUMLICENCEMAITRE = deleted.NUMLICENCEMAITRE
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier MAITREDARME car ETRE_RESPONSABLE existe.'
               goto error
          end
     end
     /* Ne pas modifier la clé primaire de la table MAITREDARME s'il existe des */
     /* occurrences correspondantes dans la table ARBITRER. */
     if
          update(NUMLICENCEMAITRE)
     begin
          if exists
               (
               select * from deleted,ARBITRER
               where
                    ARBITRER.NUMLICENCEMAITRE = deleted.NUMLICENCEMAITRE
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier MAITREDARME car ARBITRER existe.'
               goto error
          end
     end
     /* Ne pas modifier la clé primaire de la table MAITREDARME s'il existe des */
     /* occurrences correspondantes dans la table SE_SPECIALISER. */
     if
          update(NUMLICENCEMAITRE)
     begin
          if exists
               (
               select * from deleted,SE_SPECIALISER
               where
                    SE_SPECIALISER.NUMLICENCEMAITRE = deleted.NUMLICENCEMAITRE
               )
          begin
               select @errno  = 30005,
                  @errmsg = 'Impossible de modifier MAITREDARME car SE_SPECIALISER existe.'
               goto error
          end
     end

     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


create trigger TI_MAITREDARME
on MAITREDARME 
for insert as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la création d'une occurrence de MAITREDARME s'il n'existe pas */
     /* d'occurrence correspondante dans la table CLUB. */
     if
          update(NUMCLUB)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,CLUB
          where
               inserted.NUMCLUB = CLUB.NUMCLUB
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer MAITREDARME car CLUB n''existe pas.'
               goto error
          end
     end


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


-- ------------------------------------------------------------------------------- 
--   Table : ETRE_RESPONSABLE
-- ------------------------------------------------------------------------------- 

create trigger TU_ETRE_RESPONSABLE
on ETRE_RESPONSABLE
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la modification de la clé étrangère référençant la table */
     /* COMPETITION. */

     /* Interdire la modification de la clé étrangère référençant la table */
     /* MAITREDARME. */


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


create trigger TI_ETRE_RESPONSABLE
on ETRE_RESPONSABLE 
for insert as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la création d'une occurrence de ETRE_RESPONSABLE s'il n'existe pas */
     /* d'occurrence correspondante dans la table COMPETITION. */
     if
          update(CODECOMPET)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,COMPETITION
          where
               inserted.CODECOMPET = COMPETITION.CODECOMPET
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer ETRE_RESPONSABLE car COMPETITION n''existe pas.'
               goto error
          end
     end
     /* Interdire la création d'une occurrence de ETRE_RESPONSABLE s'il n'existe pas */
     /* d'occurrence correspondante dans la table MAITREDARME. */
     if
          update(NUMLICENCEMAITRE)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,MAITREDARME
          where
               inserted.NUMLICENCEMAITRE = MAITREDARME.NUMLICENCEMAITRE
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer ETRE_RESPONSABLE car MAITREDARME n''existe pas.'
               goto error
          end
     end


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


-- ------------------------------------------------------------------------------- 
--   Table : ARBITRER
-- ------------------------------------------------------------------------------- 

create trigger TU_ARBITRER
on ARBITRER
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la modification de la clé étrangère référençant la table */
     /* COMPETITION. */

     /* Interdire la modification de la clé étrangère référençant la table */
     /* MAITREDARME. */


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


create trigger TI_ARBITRER
on ARBITRER 
for insert as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la création d'une occurrence de ARBITRER s'il n'existe pas */
     /* d'occurrence correspondante dans la table COMPETITION. */
     if
          update(CODECOMPET)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,COMPETITION
          where
               inserted.CODECOMPET = COMPETITION.CODECOMPET
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer ARBITRER car COMPETITION n''existe pas.'
               goto error
          end
     end
     /* Interdire la création d'une occurrence de ARBITRER s'il n'existe pas */
     /* d'occurrence correspondante dans la table MAITREDARME. */
     if
          update(NUMLICENCEMAITRE)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,MAITREDARME
          where
               inserted.NUMLICENCEMAITRE = MAITREDARME.NUMLICENCEMAITRE
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer ARBITRER car MAITREDARME n''existe pas.'
               goto error
          end
     end


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


-- ------------------------------------------------------------------------------- 
--   Table : SE_SPECIALISER
-- ------------------------------------------------------------------------------- 

create trigger TU_SE_SPECIALISER
on SE_SPECIALISER
for update as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                ,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la modification de la clé étrangère référençant la table */
     /* ARME. */

     /* Interdire la modification de la clé étrangère référençant la table */
     /* MAITREDARME. */


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


create trigger TI_SE_SPECIALISER
on SE_SPECIALISER 
for insert as
begin
     declare  @numrows int,
                @nullcnt int,
                @validcnt int,
                @errno   int,
                @errmsg  varchar(255)

     select @numrows = @@rowcount

     /* Interdire la création d'une occurrence de SE_SPECIALISER s'il n'existe pas */
     /* d'occurrence correspondante dans la table ARME. */
     if
          update(CODEARME)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,ARME
          where
               inserted.CODEARME = ARME.CODEARME
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer SE_SPECIALISER car ARME n''existe pas.'
               goto error
          end
     end
     /* Interdire la création d'une occurrence de SE_SPECIALISER s'il n'existe pas */
     /* d'occurrence correspondante dans la table MAITREDARME. */
     if
          update(NUMLICENCEMAITRE)
     begin
          select @nullcnt = 0
          select @validcnt = count(*)
          from inserted,MAITREDARME
          where
               inserted.NUMLICENCEMAITRE = MAITREDARME.NUMLICENCEMAITRE
               
          if @validcnt + @nullcnt != @numrows
          begin
               select @errno  = 30002,
                  @errmsg = 'Impossible d''insérer SE_SPECIALISER car MAITREDARME n''existe pas.'
               goto error
          end
     end


     return
     error:
         raiserror @errno @errmsg
         rollback transaction
end
go


