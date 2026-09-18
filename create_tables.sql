-- ============================================================
-- Нормализация StudentGrades до 3NF
-- Уроки 3-4. Типы данных и параметры
-- ============================================================

-- 1. Таблица групп
CREATE TABLE groups (
    group_id    VARCHAR(10)  NOT NULL,
    group_name  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (group_id)
);

-- 2. Таблица студентов
CREATE TABLE students (
    student_id    INT           NOT NULL,
    student_name  VARCHAR(100)  NOT NULL,
    group_id      VARCHAR(10)   NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

-- 3. Таблица преподавателей
CREATE TABLE teachers (
    teacher_id    INT           NOT NULL,
    teacher_name  VARCHAR(100)  NOT NULL,
    PRIMARY KEY (teacher_id)
);

-- 4. Таблица предметов (с привязкой к преподавателю)
CREATE TABLE subjects (
    subject_id    INT           NOT NULL,
    subject_name  VARCHAR(100)  NOT NULL,
    teacher_id    INT           NOT NULL,
    PRIMARY KEY (subject_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

-- 5. Таблица оценок (результаты тестирования)
CREATE TABLE grades (
    student_id  INT   NOT NULL,
    subject_id  INT   NOT NULL,
    exam_date   DATE  NOT NULL,
    grade       INT   NOT NULL,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
    -- При желании можно добавить CHECK (grade BETWEEN 2 AND 5)
);
