.model small
.386p
.data
a db "Enter a 4 digit number: $"
b db 13,10,"Palindrome.$"
c db 13,10,"Not Palindrome.$"
.code
start:	mov ax,@data
	mov ds,ax
	mov dx,offset a
	mov ah,09
	int 21H
	mov ecx,4
	mov ebx,0
L1:	
	mov ah,01
	int 21H
	sub al,30H
	rol ebx,8	
	mov bl,al	
	loop L1	
	mov edx,ebx
	mov ecx,2
L2:	
	rol edx,8
	cmp dl,bl
	jnz L3
	ror ebx,8	
	loop L2	
	mov dx,offset b
	mov ah,09
	int 21H	
	jmp L4
L3:	mov dx,offset c
	mov ah,09
	int 21H
L4:
.exit
end start
