%macro  prologue 1
  push  rbp
  mov   rbp, rsp
  sub   rsp, %1
%endmacro
