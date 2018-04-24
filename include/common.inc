;
; Macros
;

%include "./macros/import.inc"
%include "./macros/prologue.inc"
%include "./macros/epilogue.inc"

%ifidn __OUTPUT_FORMAT__, win32

%elifidn __OUTPUT_FORMAT__, elf32 

%elifidn __OUTPUT_FORMAT__, macho64

  import "macho64/syscall"

%endif
