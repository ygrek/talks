type bkpt = {
  number : int;
  typ [@name "type"] : string;
  disp : string;
  enabled : string;
  addr : int;
  func : string;
  file : string option;
  fullname : string option;
  line : int option;
  cond : int option;
  thread_groups [@name "thread-groups"] : string values;
  times : int;
  ignore : int option;
} [@@inject]
