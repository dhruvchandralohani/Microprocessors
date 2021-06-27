.model small
.386p
.data
a dd 20000000H
b dd 00000002H
.code
start:
		mov eax,@data
		mov ds,eax
		
		mov edx,0
		mov eax,a
		mov ebx,b
		div ebx
		
		mov ecx,0
		mov ch,08H	;counter to check no. of digits printed 
		mov cl,04H	;to rotate 4 times
		mov ebx,eax
		
L2:
		rol ebx,cl
		mov dx,bx
		and dx,000FH
		cmp dx,09
		jbe L4		;jbe= jump below equal
		add dx,0007h	;if dl has no. from 0-9 to convert to

L4:
		add dl,30H
		mov ah,02H
		int 21H
		
		dec ch
		jnz L2
		.EXIT
		END START
