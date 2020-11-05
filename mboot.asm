  section .mboot

  magic equ 0xE85250D6          ;multiboot header
  arch equ  0                   ;protected mode i386

header_start:
  dd magic                      ;magic number
  dd arch                       ;arch
  dd header_end - header_start  ;header length
  dd 0x100000000 - (magic + arch + (header_end - header_start ))
  dw  0                         ;type
  dw  0                         ;flags
  dd  8                         ;size
header_end: 
