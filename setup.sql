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

INSERT INTO BienImmobilier (nom, reference, adrosso, adresse_complement, ville, code_postal, pays, description, date_achat, superficie, nombre_de_pieces, etage, montant_acquisition, titre_propriete, document)
VALUES ('Appartement Paris', 'Ref001', '12 Rue de Paris', 'Apt 5', 'Paris', '75001', 'France', 'Un bel appartement', '2023-09-17 12:00:00', 45, 3, 2, 300000.00, 'Titre001', 'Doc001');

INSERT INTO Projet (bien_id_fk, date_mise_en_ligne, date_fin_financement, montant_finance, montant_projet, frais_shareimmo, frais_notaire, frais_administratifs, frais_gestion, frais_operationnels, taxe_d_etat, revenus_locatifs, revenus_nets, revenus_nets_reverses)
VALUES (1, '2023-09-18 12:00:00', '2023-10-18 12:00:00', 50000.00, 100000.00, 2000.00, 3000.00, 1500.00, 1000.00, 2000.00, 5000.00, 4000.00, 2500.00, 2200.00);

INSERT INTO Location (bien_id_fk, description, date_mise_en_location, contrat_location)
VALUES (1, 'Appartement en location', '2023-09-19 12:00:00', 'Contrat001');

INSERT INTO Token (projet_id_fk, prix_token, detenteur_id_tk, statut_token)
VALUES (1, 50.00, 1, 'Disponible');

INSERT INTO Dividende (projet_id_fk, montant, date_paiement)
VALUES (1, 1000.00, '2023-09-20 12:00:00');

INSERT INTO Wallet (user_id_fk, balance)
VALUES (1, 2000.00);

INSERT INTO Transaction (emetteur_id_fk, recepteur_id_fk, montant_transaction, type_transaction, date_transaction, statut_transaction)
VALUES (1, 2, 200.00, 'Achat', '2023-09-20 12:00:00', 'Réussi');

INSERT INTO User (nom, prenom, email, mot_de_passe, telephone, carte_identite, role, date_dernier_login)
VALUES ('Doe', 'John', 'john.doe@example.com', 'password', 123456789, 'ID001', 'Investisseur', '2023-09-17 12:00:00');

INSERT INTO Investissement (investisseur_id_tk, projet_id_fk, montant, nombre_tokens, date_investissement, statut_investissement)
VALUES (1, 1, 1000.00, 20, '2023-09-18 12:00:00', 'Réussi');

INSERT INTO Photo (bien_id_fk, photo_bien)
VALUES (1, 'photo1.jpg');


