create schema dnd_note_taker;

use dnd_note_taker;

create table users(
	id char(36) not null,
    email varchar(60) unique not null,
    password varchar(60) not null,
    first_name varchar(60) not null,
    last_name varchar(60) not null,
    created_at timestamp default now(),
    primary key(id)
);

create table notes(
	id char(36) not null,
    userid char(36) not null,
    body varchar(2000) not null,
    created_at timestamp default now(),
    primary key(id),
    foreign key(userid) references users(id)
);

# 5.x mysql
create user 'dnd_note_taker'@'localhost' identified by 'dnd_note_taker';

# 8.0.x mysql
create user 'dnd_note_taker'@'localhost' identified with mysql_native_password by 'dnd_note_taker';

# 8.1.x with mysql2
create user 'dnd_note_taker'@'localhost' identified by 'dnd_note_taker';

# grant privileges
grant all privileges on dnd_note_taker.* to 'dnd_note_taker'@'localhost';
flush privileges;








