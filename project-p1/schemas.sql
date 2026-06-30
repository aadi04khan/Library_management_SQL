drop table if exists books;
create table  books (
		isbn varchar(20)primary key,
		book_title varchar(60),
		category VARCHAR(15),
		rental_price FLOAT,
		status VARCHAR,
		author varchar(25),
		publisher varchar(30)
);

drop table if exists branch;

create table branch (
branch_id VARCHAR(15) PRIMARY KEY,
manager_id VARCHAR(15),
branch_address VARCHAR(55),
contact_no VARCHAR(15)
);

drop table if exists employees;
create table employees(emp_id VARCHAR(15) PRIMARY KEY,
emp_name VARCHAR(25),
position VARCHAR(25),
salary int ,
branch_id VARCHAR(25)
);
     
drop table if exists issues_status;
create table issued_status (
issued_id VARCHAR(25) PRIMARY KEY,
issued_member_id  VARCHAR(25), --FK
issued_book_name VARCHAR(55),
issued_date	VARCHAR(25),
issued_book_isbn  VARCHAR(25),--FK	
issued_emp_id VARCHAR(25) --FK
);

drop table if exists return_status;
CREATE TABLE return_status(
return_id VARCHAR(25) PRIMARY KEY,
issued_id VARCHAR(25) ,
return_book_name VARCHAR(55),
return_date date,
return_book_isbn VARCHAR(25)
);

-- foreign key

alter table issued_status
add constraint  fk_members
foreign key (issued_member_id)
references members(member_id);


alter table issued_status
add constraint  fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint  fk_employees
foreign key (issued_emp_id)
references employees(emp_id);


alter table employees
add constraint  fk_branch
foreign key (branch_id)
references branch(branch_id);


alter table return_status
add constraint  fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);