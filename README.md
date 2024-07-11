"# MYSQL-Task2" 
# Zen Class Database

The `zen_class` database is designed to efficiently manage and track various aspects of an educational system. This includes tasks, courses, mentors, batches, marks, students, dashboards, leaderboards, queries, and feedback.

## Overview of Tables

### Tasks Table
- **id**: Unique identifier for each task (Primary Key).
- **taskname**: Name of the task.
- **tasklink**: URL link to the task.
- **tags**: Tags associated with the task.
- **batch_id**: Identifier linking the task to a specific batch.

### Courses Table
- **id**: Unique identifier for each course (Primary Key).
- **course_name**: Name of the course.
- **course_price**: Price of the course.
- **course_type**: Type/category of the course.

### Mentors Table
- **id**: Unique identifier for each mentor (Primary Key).
- **mentor_name**: Name of the mentor.
- **instructed_course_id**: Identifier for the course the mentor is instructing (Foreign Key to `courses`).
- **mentor_rating**: Rating of the mentor.

### Batches Table
- **id**: Unique identifier for each batch (Primary Key).
- **batch_name**: Name of the batch.
- **batch_language**: Language of instruction for the batch.
- **mentor_id**: Identifier for the mentor assigned to the batch (Foreign Key to `mentors`).
- **course_id**: Identifier for the course the batch is associated with (Foreign Key to `courses`).

### Marks Table
- **id**: Unique identifier for each mark entry (Primary Key).
- **student_id**: Identifier for the student (Foreign Key to `students`).
- **task_id**: Identifier for the task (Foreign Key to `tasks`).
- **mark**: Mark obtained by the student.
- **eval_mentor_id**: Identifier for the mentor who evaluated the task (Foreign Key to `mentors`).

### Students Table
- **id**: Unique identifier for each student (Primary Key).
- **student_name**: Name of the student.
- **course_id**: Identifier for the course the student is enrolled in (Foreign Key to `courses`).
- **batch_id**: Identifier for the batch the student is part of (Foreign Key to `batches`).
- **tasks_completed**: Number of tasks completed by the student.

### Dashboard Table
- **id**: Unique identifier for each dashboard entry (Primary Key).
- **student_id**: Identifier for the student (Foreign Key to `students`).
- **tasks_completed**: Number of tasks completed by the student.
- **marks_totals**: Total marks obtained by the student.

### Leaderboard Table
- **id**: Unique identifier for each leaderboard entry (Primary Key).
- **student_id**: Identifier for the student (Foreign Key to `students`).
- **student_rank**: Rank of the student.

### Queries Table
- **id**: Unique identifier for each query (Primary Key).
- **student_id**: Identifier for the student who raised the query (Foreign Key to `students`).
- **assigned_mentor_id**: Identifier for the mentor assigned to the query (Foreign Key to `mentors`).
- **query_tag**: Tag associated with the query.
- **query_status**: Status of the query (0 for open, 1 for closed).

### Feedbacks Table
- **id**: Unique identifier for each feedback entry (Primary Key).
- **batch_id**: Identifier for the batch (Foreign Key to `batches`).
- **student_id**: Identifier for the student providing feedback (Foreign Key to `students`).
- **mentor_id**: Identifier for the mentor being reviewed (Foreign Key to `mentors`).
- **session_rating**: Rating of the session.
- **session_feedback**: Feedback text for the session.
- **mentor_rating**: Rating of the mentor.
- **mentor_feedback**: Feedback text for the mentor.

---

