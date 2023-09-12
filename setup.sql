CREATE TABLE BienImmobilier (
  bien_id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255),
  reference VARCHAR(255),
  adrosso VARCHAR(255),
  adresse_complement VARCHAR(255),
  ville VARCHAR(255),
  code_postal VARCHAR(255),
  pays VARCHAR(255),
  description VARCHAR(255),
  date_achat DATETIME,
  superficie INT,
  nombre_de_pieces INT,
  etage INT,
  montant_acquisition DECIMAL(15, 2),
  titre_propriete VARCHAR(255),
  document VARCHAR(255)
);

CREATE TABLE Projet (
  projet_id INT PRIMARY KEY AUTO_INCREMENT,
  bien_id_fk INT,
  date_mise_en_ligne DATETIME,
  date_fin_financement DATETIME,
  montant_finance DECIMAL(15, 2),
  montant_projet DECIMAL(15, 2),
  frais_shareimmo DECIMAL(15, 2),
  frais_notaire DECIMAL(15, 2),
  frais_administratifs DECIMAL(15, 2),
  frais_gestion DECIMAL(15, 2),
  frais_operationnels DECIMAL(15, 2),
  taxe_d_etat DECIMAL(15, 2),
  revenus_locatifs DECIMAL(15, 2),
  revenus_nets DECIMAL(15, 2),
  revenus_nets_reverses DECIMAL(15, 2),
  FOREIGN KEY (bien_id_fk) REFERENCES BienImmobilier(bien_id)
);

CREATE TABLE Location (
  location_id INT PRIMARY KEY AUTO_INCREMENT,
  bien_id_fk INT,
  description VARCHAR(255),
  date_mise_en_location DATETIME,
  contrat_location VARCHAR(255),
  FOREIGN KEY (bien_id_fk) REFERENCES BienImmobilier(bien_id)
);

CREATE TABLE Token (
  token_id INT PRIMARY KEY AUTO_INCREMENT,
  projet_id_fk INT,
  prix_token DECIMAL(15, 2),
  detenteur_id_tk INT,
  statut_token VARCHAR(255),
  FOREIGN KEY (projet_id_fk) REFERENCES Projet(projet_id)
);

CREATE TABLE Dividende (
  dividende_id INT PRIMARY KEY AUTO_INCREMENT,
  projet_id_fk INT,
  montant DECIMAL(15, 2),
  date_paiement DATETIME,
  FOREIGN KEY (projet_id_fk) REFERENCES Projet(projet_id)
);

CREATE TABLE Wallet (
  wallet_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id_fk INT,
  balance DECIMAL(15, 2),
  FOREIGN KEY (user_id_fk) REFERENCES User(user_id)
);

CREATE TABLE Transaction (
  transaction_id INT PRIMARY KEY AUTO_INCREMENT,
  emetteur_id_fk INT,
  recepteur_id_fk INT,
  montant_transaction DECIMAL(15, 2),
  type_transaction VARCHAR(255),
  date_transaction DATETIME,
  statut_transaction VARCHAR(255)
);

CREATE TABLE User (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  email VARCHAR(255),
  mot_de_passe VARCHAR(255),
  telephone INT,
  carte_identite VARCHAR(255),
  role VARCHAR(255),
  date_dernier_login DATETIME
);

CREATE TABLE Investissement (
  investissement_id INT PRIMARY KEY AUTO_INCREMENT,
  investisseur_id_tk INT,
  projet_id_fk INT,
  montant DECIMAL(15, 2),
  nombre_tokens INT,
  date_investissement DATETIME,
  statut_investissement VARCHAR(255),
  FOREIGN KEY (projet_id_fk) REFERENCES Projet(projet_id)
);

CREATE TABLE Photo (
  photo_id INT PRIMARY KEY AUTO_INCREMENT,
  bien_id_fk INT,
  photo_bien VARCHAR(255),
  FOREIGN KEY (bien_id_fk) REFERENCES BienImmobilier(bien_id)
);
