insert into CENTRE (nomCentre, villeCentre) values ('Centre du Val d Auron', 'Bourges');
insert into CENTRE (nomCentre, villeCentre) values ('Centre du Font Romeu', 'Font Romeu');
insert into CENTRE (nomCentre, villeCentre) values ('Ecurie Lefèvre', 'Auvers');	
insert into CENTRE (nomCentre, villeCentre, specialisation) values('Ferme équestre de Graville', 'Graville', 'Cross');

insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values 
('Geslin','Manon',13,'Malabar',1);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values ('Arnoux','Justine',12,'Oscar',1);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values ('Jouanot','Phillipe',24,'Kami',1);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values ('Bichot','Emilie',18,'Princesse',2);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values ('Conrad','Sarah',27,'Lorie',2);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values ('Gérard','Maxime',12,'Coyote',2);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values ('Lamotte','Guy',36,'Urbino',3);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values('Lefèvre','Pierre',55,'Romantic',3);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values('Bourassin','Nicolas',21,'Kiri',NULL);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values
('Oulie','Thibault', 21, 'Zorro',NULL);
insert into CAVALIER (nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values ('Verbaere','Nicolas', 23, 'Joky', 4);

insert into COMPETITION (nomCompetition, jourCompet) values ('CSO du printemps','2013-05-25');
insert into COMPETITION (nomCompetition, jourCompet) values ('Complet de l été','2014-08-04');
insert into COMPETITION (nomCompetition, jourCompet) values ('Dressage des jaunes feuilles','2014-11-23');
insert into COMPETITION (nomCompetition, jourCompet) values ('Complet de la mer','2015-06-28');

insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (1,'CSO', 1);
insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (1,'CSO', 2);
insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (1, 'CSO', 4);
insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (2,'Dressage', 2);
insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (2,'Dressage', 3);
insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (2, 'Dressage', 4);
insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (3,'Cross', 2);
insert into ACTIVITE(idActivite, nomActivite, idCompetition) values (3, 'Cross', 4);

insert into JUGE(nomJuge, mdp) values ('Mc Bury', 'chocolat');
insert into JUGE(nomJuge, mdp) values ('Evans', 'rameses2');
insert into JUGE(nomJuge, mdp) values ('Lebreton', 'imag123');
insert into JUGE(nomJuge, mdp) values ('Martin','tr000');


insert into RANG(idActivite, idJuge, idCompetition, rang) values (1, 1, 1, 1);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (3, 1, 2, 1);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 2, 2, 1);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 2, 3, 1);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 3, 2, 2);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 3, 3, 2);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 4, 2, 3);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 4, 3, 3);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (1, 1, 4, 1);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 2, 4, 1);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (3, 1, 4, 1);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 3, 4, 2);
insert into RANG(idActivite, idJuge, idCompetition, rang) values (2, 4, 4, 3);

insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(1, 1, 1, 105,4, 101);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(2, 1, 1, 118,8, 110);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(3, 1, 2, 155,0, 155);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(3, 2, 2, 47, 50, 49, 146);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(3, 3, 2, 270,20 , 250);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(4, 1, 2, 167,0 , 167);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(4, 2, 2, 50, 51, 51 , 152);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(4, 3, 2, 247,0 , 247);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(5, 1, 2, 93,12 , 81);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(5, 2, 2, 45, 46, 44, 135);
insert into PARTICIPE(idCavalier, idActivite,  idCompetition, note1, penalite, total) values 
(5, 3, 2, 215, 40 , 175);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(6, 2, 3, 57, 58, 58, 173);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(7, 2, 3, 56, 57, 58, 171);
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(8, 2, 3, 57, 56, 58, 171); 
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(9, 2, 2, 40, 47, 50, 137); 
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(9, 3, 2, 200, 10, 190); 
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, note2, note3, total) values 
(10, 2, 2, 52, 55, 53, 160); 
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(10, 3, 2, 230 ,7 , 223); 
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(9, 1, 2, 160, 0, 130); 
insert into PARTICIPE(idCavalier, idActivite, idCompetition, note1, penalite, total) values 
(10, 1, 2, 150, 5, 145); 



