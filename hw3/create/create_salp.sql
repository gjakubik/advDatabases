create table salesperson
       (salpers_id number(2),
        salpers_name varchar(30),
        manager_id number(2),
        office varchar(20),
        comm float,
	primary key (salpers_id),
	foreign key (manager_id) references salesperson(salpers_id));
