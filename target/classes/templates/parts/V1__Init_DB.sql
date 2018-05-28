create table hibernate_sequence (next_val bigint) engine=MyISAM;
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );

create table news (
  id bigint not null,
  filename varchar(255),
  text text not null,
  title varchar(255) not null,
  user_id bigint,
  primary key (id)
) engine=MyISAM;

create table task (
  id bigint not null,
  filename varchar(255),
  header varchar(255) not null,
  text text not null,
  title varchar(255) not null,
  user_id bigint,
  primary key (id)
) engine=MyISAM;

create table user (
  id bigint not null,
  active bit not null,
  email varchar(255) not null,
  full_name varchar(255) not null,
  password varchar(255) not null,
  username varchar(255) not null,
  primary key (id)
) engine=MyISAM;

create table user_news_set (
  user_id bigint not null,
  news_set_id bigint not null,
  primary key (user_id, news_set_id)
) engine=MyISAM;

create table user_role (
  user_id bigint not null,
  roles varchar(255)
) engine=MyISAM;

create table user_task_set (
  user_id bigint not null,
  task_set_id bigint not null,
  primary key (user_id, task_set_id)
) engine=MyISAM;

alter table user_news_set add constraint UK_bgwpprg6ui635ss4169un25gj unique (news_set_id);

alter table user_task_set add constraint UK_kkiftsn7kvju975gno5vn25b3 unique (task_set_id);

alter table news add constraint news_fk foreign key (user_id) references user (id);

alter table task add constraint task_fk foreign key (user_id) references user (id);

alter table user_news_set add constraint FKmtamm1lkp4x4u8ft6nywbhvt3 foreign key (news_set_id) references news (id);

alter table user_news_set add constraint FKbmfbuieuybivrosxg0jv7ew0y foreign key (user_id) references user (id);

alter table user_role add constraint FK859n2jvi8ivhui0rl0esws6o foreign key (user_id) references user (id);

alter table user_task_set add constraint FKn48u09ig35t61ihjfp05tv0nw foreign key (task_set_id) references task (id);

alter table user_task_set add constraint FK8wokab54go8f8ddbkkqq6kdoa foreign key (user_id) references user (id);