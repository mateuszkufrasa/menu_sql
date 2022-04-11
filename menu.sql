/*
Skrypt tworzy nową bazę danych 
oraz tabelę zawierającą listę dań 
podzielonych na mięsne, rybne i wegetariańskie.

*/

-- utworzenie nowej bazy danych o nazwie `menu`
drop schema IF EXISTS `menu`;
CREATE SCHEMA `menu`;
USE `menu`;

-- utworzenie nowej tabeli `obiady` z listą dań
DROP TABLE IF EXISTS `obiady`;
CREATE TABLE `obiady` (
    danie_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    danie_nazwa VARCHAR(255) NOT NULL,
    danie_typ ENUM('miesne', 'rybne', 'wegetarianskie', 'zupa') NOT NULL,
    data_dodania TIMESTAMP NOT NULL DEFAULT NOW()
);

-- uzupełnienie tabeli listą dań
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('ryba z warzywami i ryzem', 'rybne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('rosół', 'zupa');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('skrzydełka z surówką', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('burger z kotletem szpinakowym', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('tikka masala z ryzem', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('makaron sojowy z kurczakiem i warzywami', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('zupa pomidorowa', 'zupa');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('wege leczo', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('leczo', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('placki ziemniaczane', 'wegetarianskie');

INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('placki z cukinii', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('fritata ze szpinakiem, suszonymi pomidorami, kurczakiem i mozarella', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('zapiekanka z makaronem, pomidorami, pieczarkami i serem', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('makaron z kurczakiem i suszonymi pomidorami', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('zupa ogorkowa', 'zupa');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('udka panierowane z ziemniakami i surowka', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('spaghetti po bolonsku', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('zupa pieczarkowa', 'zupa');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('tortilla z kurczakiem', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('nalesniki ze szpinakiem', 'wegetarianskie');

INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('spaghetti ze szpinakiem', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('kebab', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('schabowe z ziemniakami i surowka', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('kurczak z kopytkami', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('krem z pomidorow i papryki', 'zupa');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('quiche', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('wege burger', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('makaron z feta, szpinakiem i pomidorami', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('paluszki rybne', 'rybne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('pulpety', 'miesne');

INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('devolaille', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('hot dog', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('butter chicken', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('pierogi', 'wegetarianskie');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('krupnik', 'zupa');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('tortilla z warzywami i miesem mielonym', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('kurczak z ryzem i warzywami', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('kotlety mielone', 'miesne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('ryba panierowana z frytkami', 'rybne');
INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('makaron z pieczarkami i suszonymi pomidorami', 'wegetarianskie');

INSERT INTO `obiady` (danie_nazwa, danie_typ) VALUES ('zupa jarzynowa', 'zupa');

-- kwerenda do wybierania pięciu dowolnych dań mięsnych i dwóch dowolnych dań pozostałych typów
(SELECT 
*
FROM
    menu.obiady
WHERE
    danie_typ = 'miesne'
ORDER BY RAND()
LIMIT 5) UNION (SELECT 
    *
FROM
    menu.obiady
WHERE
    danie_typ = 'zupa'
        OR danie_typ = 'rybne'
        OR danie_typ = 'wegetarianskie'
ORDER BY RAND()
LIMIT 2);

/*
select * from obiady;
*/
