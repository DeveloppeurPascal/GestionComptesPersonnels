object db: Tdb
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 361
  Width = 572
  object dbc: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\olfso\Documents\Embarcadero\Studio\Projets\Twi' +
        'tch-GestionComptesPersonnels\src\devdb.db'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    AfterConnect = dbcAfterConnect
    BeforeConnect = dbcBeforeConnect
    Left = 128
    Top = 96
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 432
    Top = 128
  end
  object FDScript1: TFDScript
    SQLScripts = <
      item
        Name = 'version 1'
        SQL.Strings = (
          'CREATE TABLE ecritures ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  libelle VARCHAR(255) NOT NULL,'
          '  montant NUMERIC(10,2) NOT NULL,'
          '  sens CHAR(1) NOT NULL,'
          '  date CHAR(8) NOT NULL,'
          '  categorie_id INTEGER NOT NULL,'
          '  compte_id INTEGER NOT NULL'
          ');'
          ''
          'CREATE TABLE categories ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  libelle VARCHAR(255) NOT NULL'
          ');'
          ''
          'CREATE TABLE comptes ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  libelle VARCHAR(255) NOT NULL'
          ');'
          ''
          'CREATE UNIQUE INDEX ecritures_par_categorie ON ecritures'
          '  (categorie_id,date,id);'
          ''
          'CREATE UNIQUE INDEX categories_par_libelle ON categories'
          '  (libelle,id);'
          ''
          'CREATE UNIQUE INDEX comptes_par_libelle ON comptes'
          '  (libelle,id);'
          ''
          'CREATE UNIQUE INDEX ecritures_par_date ON ecritures'
          '  (date,id);'
          ''
          'CREATE UNIQUE INDEX ecritures_par_compte ON ecritures'
          '  (compte_id,date,id);')
      end>
    Connection = dbc
    Params = <>
    Macros = <>
    Left = 264
    Top = 96
  end
  object tabComptes: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dbc
    UpdateOptions.UpdateTableName = 'comptes'
    TableName = 'comptes'
    Left = 96
    Top = 248
    object tabComptesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tabCompteslibelle: TStringField
      DisplayLabel = 'Libell'#233
      DisplayWidth = 70
      FieldName = 'libelle'
      Origin = 'libelle'
      Required = True
      Size = 255
    end
  end
  object tabEcritures: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dbc
    UpdateOptions.UpdateTableName = 'ecritures'
    TableName = 'ecritures'
    Left = 192
    Top = 248
    object tabEcrituresid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tabEcritureslibelle: TStringField
      DisplayLabel = 'Libell'#233
      DisplayWidth = 70
      FieldName = 'libelle'
      Origin = 'libelle'
      Required = True
      Size = 255
    end
    object tabEcrituresmontant: TBCDField
      DisplayLabel = 'Montant'
      FieldName = 'montant'
      Origin = 'montant'
      Required = True
      Precision = 10
      Size = 2
    end
    object tabEcrituressens: TStringField
      FieldName = 'sens'
      Origin = 'sens'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tabEcrituresdate: TStringField
      DisplayLabel = 'Date'
      FieldName = 'date'
      Origin = 'date'
      Required = True
      FixedChar = True
      Size = 8
    end
    object tabEcriturescategorie_id: TIntegerField
      FieldName = 'categorie_id'
      Origin = 'categorie_id'
      Required = True
    end
    object tabEcriturescompte_id: TIntegerField
      FieldName = 'compte_id'
      Origin = 'compte_id'
      Required = True
    end
  end
  object tabCategories: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dbc
    UpdateOptions.UpdateTableName = 'categories'
    TableName = 'categories'
    Left = 304
    Top = 248
    object tabCategoriesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tabCategorieslibelle: TStringField
      DisplayLabel = 'Libell'#233
      DisplayWidth = 70
      FieldName = 'libelle'
      Origin = 'libelle'
      Required = True
      Size = 255
    end
  end
end
