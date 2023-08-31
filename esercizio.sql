--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * FROM `students` WHERE degree_id = 53;
--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT * FROM `degrees` WHERE level = 'magistrale' AND department_id = '7';
--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * FROM `course_teacher` WHERE course_id = 44;
--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
    --sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
    --nome

SELECT * FROM `students`
INNER JOIN degrees
ON students.degree_id = degrees.id
INNER JOIN departments
ON degrees.department_id = departments.id
ORDER BY students.surname, students.name ;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT * FROM `courses` 
INNER JOIN course_teacher 
ON course_teacher.course_id = courses.id 
INNER JOIN teachers 
ON teachers.id = course_teacher.teacher_id;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di
--Matematica (54)

SELECT teachers.* FROM `teachers`
INNER JOIN course_teacher
ON course_teacher.teacher_id = teachers.id
INNER JOIN courses 
ON courses.id = course_teacher.course_id
INNER JOIN degrees
ON degrees.id = courses.degree_id
WHERE degrees.department_id = 5;

--7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
--per ogni esame, stampando anche il voto massimo. Successivamente,
--filtrare i tentativi con voto minimo 18.