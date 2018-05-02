;
; Defines system calls specific to the MachO64 format
;


; System Calls

%define SYS_EXIT  0x2000001
%define SYS_WRITE 0x2000004

; Descriptors

%define STDOUT    0x0000001