[BITS             16]
[ORG              0x7C00]

start:
XOR               AX,               AX
MOV               DS,               AX
MOV               ES,               AX
MOV               BX,               AX

MOV               SI,               output_text
CALL              print_str

print_str:
MOV               AH,               0x0E

next_char:
LODSB
CMP               AL,               0
JE                print_end
INT               0x10
JMP               next_char

print_end:
RET

output_text DB    'Hello World!',   0

TIMES             510 - ($ - $$)    DB                0
DW                0xAA55
