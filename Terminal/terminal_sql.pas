unit terminal_sql;

interface

const
  CREATE_TERMINAL_OPERATION_TABLE = 'create table tbl_operation (' +
    'id int auto_increment primary key,' +
    'id_terminal int,' +
    'id_shift int,' +
    'type int,' +
    'pan int,' +
    'currency int,' +
    'sum double,' +
    'time datetime' +
  ');';

  CREATE_OPERATION_SPR = 'create table spr_operation (' +
    'id int primary key auto_increment,' +
    'name varchar(100)' +
  ');';

  CREATE_SHIFT_TABLE = 'create table tbl_shift (' +
    'id int auto_increment primary key,' +
    'id_terminal int,' +
    'time_open datetime,' +
    'time_close datetime' +
  ');';

implementation

end.
