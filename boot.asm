bits 16

start:
  mov ax, 0x07C0                ;where we are right now
  add ax, 0x20                  ;add 0x20 when shifted by 512
  mov ss, ax                    ;point the stack segment at the ax address
  mov sp, 0x1000                ;initialise the stack pointer

  mov ax, 0x07C0
  mov ds, ax                    ;set data segment
  mov si, msg
  mov ah,0x0E                  ;printchar bios procedure

.next:
  lodsb                         ;next byte to AL, inc SI
  cmp al, 0                     ;if 0 jump to done
  je .done
  int 0x10                      ;invoke bios syscall
  jmp .next                     ;repeat

  .done
    jmp $                       ;loop forever

msg:  db 'Hello',0

  times 510-($-$$) db 0         ;fill up to 512 bytes
  dw 0xAA55                     ;MASTER BOOT RECORD SIGNATURE
  
