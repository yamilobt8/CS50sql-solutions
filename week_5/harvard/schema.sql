CREATE TABLE IF NOT EXISTS "students" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "enrollments" (
    "id" INTEGER,
    "student_id" INTEGER,
    "course_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("student_id") REFERENCES "students"("id"),
    FOREIGN KEY("course_id") REFERENCES "courses"("id")
);
CREATE TABLE IF NOT EXISTS "courses" (
    "id" INTEGER,
    "department" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "semester" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "satisfies" (
    "id" INTEGER,
    "course_id" INTEGER,
    "requirement_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("course_id") REFERENCES "courses"("id"),
    FOREIGN KEY("requirement_id") REFERENCES "requirements"("id")
);
CREATE TABLE IF NOT EXISTS "requirements" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE INDEX courses_history on enrollments(student_id, course_id);

CREATE INDEX cs_enrolled on courses(department, semester, number)
where department = 'Computer Science'
and number = 50
and semester = 'Fall 2023';

CREATE INDEX courses_sort on courses(id, semester)
where semester = 'Fall 2023';

CREATE INDEX cs_spring on courses(department, semester)
where department = 'Computer Science'
and semester = 'Spring 2024';

CREATE INDEX req_satisfied on courses (title, semester)
where title = 'Advanced Databases'
and semester = 'Fall 2023';

CREATE INDEX student_satisfied on satisfies(course_id);

CREATE INDEX courses_search on courses(title, semester);
