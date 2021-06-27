.MODEL SMALL
.386p
.DATA

a dd 1234567FH
b dd 11111110H

.CODE

START:
	mov eax,@DATA
	mov ds,eax
	mov eax,a
	mov ebx,b
	sub eax,ebx
	mov ch,08H
	mov cl,04H
	mov ebx,eax

L2:
	rol ebx,cl
	mov dl,bl
	and dl,0FH
	cmp dl,09
	jbe L4
	add dl,07H

L4:
	add dl,30H
	mov ah,02
	int 21H
	dec ch
	jnz L2
	.EXIT
	END START
