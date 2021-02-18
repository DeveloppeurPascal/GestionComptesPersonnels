CREATE TABLE ecritures (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  libelle VARCHAR(255) NOT NULL,
  montant NUMERIC(10,2) NOT NULL,
  sens CHAR(1) NOT NULL,
  date CHAR(8) NOT NULL,
  categorie_id INTEGER NOT NULL,
  compte_id INTEGER NOT NULL
);

CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  libelle VARCHAR(255) NOT NULL
);

CREATE TABLE comptes (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  libelle VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX ecritures_par_categorie ON ecritures
  (categorie_id,date,id);

CREATE UNIQUE INDEX categories_par_libelle ON categories
  (libelle,id);

CREATE UNIQUE INDEX comptes_par_libelle ON comptes
  (libelle,id);

CREATE UNIQUE INDEX ecritures_par_date ON ecritures
  (date,id);

CREATE UNIQUE INDEX ecritures_par_compte ON ecritures
  (compte_id,date,id);
