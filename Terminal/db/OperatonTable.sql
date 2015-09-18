create table terminal_operation (
  id_operation int auto_increment primary key,
  id_duty int,  
  id_terminal int,
  type_operation int,
  pan int,
  currency int,
  sum_operation double,
  time_operation datetime
);