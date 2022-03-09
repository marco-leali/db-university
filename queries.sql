/* 1. Selezionare tutti gli studenti nati nel 1990 */

SELECT * FROM `students` WHERE YEAR(date_of_birth) = 1990;

/* 2. Selezionare tutti i corsi che valgono più di 10 crediti */

SELECT * FROM `courses` WHERE `cfu` > 10;

/* 3. Selezionare tutti gli studenti che hanno più di 30 anni */

SELECT * 
FROM `students` 
WHERE NOW() > DATE_ADD(`date_of_birth`,INTERVAL 30 YEAR);

/* 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286) */

SELECT count(*) FROM `courses` WHERE `period` = 'I semestre' AND `year` = 1;

/* 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21) */

SELECT * FROM `exams` WHERE `date` = DATE('2020-06-20') AND `hour` > '14:00:00';


/* 6. Selezionare tutti i corsi di laurea magistrale (38) */

SELECT * FROM `degrees` WHERE `level` = 'magistrale';

/* 7. Da quanti dipartimenti è composta l'università? (12) */

SELECT COUNT(*) FROM `departments`;

/* 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50) */

SELECT COUNT(*) FROM `teachers` WHERE `phone` IS NOT NULL;


/* *************************************** GROUP BY ********************************************** */

/* 1. Contare quanti iscritti ci sono stati ogni anno */

SELECT COUNT(*) AS 'enrolment_number',YEAR(`enrolment_date`) AS 'enrolment_YEAR' FROM `students` GROUP BY `enrolment_YEAR` ASC;

/* 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio */

SELECT COUNT(*) AS 'numero insegnanti' ,`office_address` FROM `teachers` GROUP BY `office_address`;

/* 3. Calcolare la media dei voti di ogni appello d'esame */

SELECT ROUND(AVG(`vote`),1) AS 'media voti',`exam_id` FROM `exam_student` GROUP BY `exam_id`;