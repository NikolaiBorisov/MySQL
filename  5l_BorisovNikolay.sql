BEGIN;
UPDATE employees SET first_name = 'qqqq' WHERE emp_no = 10000;
INSERT INTO dept_emp SET emp_no = 10000 AND dept_no = 'd007';
UPDATE salaries SET salary = salary + 5000 WHERE emp_no = 10000;
COMMIT;

start transaction;
select important from cities_tbl where important = 1 for update;
update cities_tbl set important = 0 where important = 1;
commit;