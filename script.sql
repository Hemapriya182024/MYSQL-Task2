 USE zen_class;
 
CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    taskname VARCHAR(255),
    tasklink VARCHAR(255),
    tags VARCHAR(255),
    batch_id INT
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255),
    course_price FLOAT,
    course_type VARCHAR(30)
);

CREATE TABLE mentors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mentor_name VARCHAR(255),
    instructed_course_id INT,
    mentor_rating FLOAT,
    FOREIGN KEY (instructed_course_id) REFERENCES courses(id)
);

CREATE TABLE batches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    batch_name VARCHAR(255),
    batch_language VARCHAR(30),
    mentor_id INT,
    course_id INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE marks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    task_id INT,
    mark FLOAT,
    eval_mentor_id INT,
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (eval_mentor_id) REFERENCES mentors(id)
);

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255),
    course_id INT,
    batch_id INT,
    tasks_completed INT,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (batch_id) REFERENCES batches(id)
);

ALTER TABLE marks ADD FOREIGN KEY (student_id) REFERENCES students(id);

CREATE TABLE dashboard (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    tasks_completed INT,
    marks_totals FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE leaderboard (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    student_rank INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE queries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    assigned_mentor_id INT,
    query_tag VARCHAR(255),
    query_status TINYINT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (assigned_mentor_id) REFERENCES mentors(id)
);

CREATE TABLE feedbacks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    batch_id INT,
    student_id INT,
    mentor_id INT,
    session_rating FLOAT,
    session_feedback VARCHAR(255),
    mentor_rating FLOAT,
    mentor_feedback VARCHAR(255),
    FOREIGN KEY (batch_id) REFERENCES batches(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (mentor_id) REFERENCES mentors(id)
);
SHOW TABLES FROM zen_class;
