-- Find a student’s historical course enrollments, based on their ID:
create index courses_history on enrollments(student_id, course_id);

-- Find all students who enrolled in Computer Science 50 in Fall 2023:
create index cs_enrolled on courses(department, semester, number)
where department = 'Computer Science'
and number = 50
and semester = 'Fall 2023';

-- Sort courses by most- to least-enrolled in Fall 2023:
create index courses_sort on courses(id, semester)
where semester = 'Fall 2023';

-- Find all computer science courses taught in Spring 2024:
create index cs_spring on courses(department, semester)
where department = 'Computer Science'
and semester = 'Spring 2024';

-- Find the requirement satisfied by “Advanced Databases” in Fall 2023:
create index req_satisfied on courses (title, semester)
where title = 'Advanced Databases'
and semester = 'Fall 2023';

-- Find how many courses in each requirement a student has satisfied:
create index student_satisfied on satisfies(course_id);

-- Search for a course by title and semester:
create index courses_search on courses(title, semester);