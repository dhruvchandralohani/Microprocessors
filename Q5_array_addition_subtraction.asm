.model small
.386p
.stack
.data

	ARRAY db 10 dup(?)
	ARRAY2 db 10 dup(?)
	ARRAY3 db 10 dup(?)

	msg0 db 13,10,"ENTER NO.:$"
	msg1 db 13,10,"ENTER NUMBER OF ELEMENTS:$"
	msg db 13,10,"FOR ARRAY 2:$"
	
	msg2 db 13,10,"ARRAY AFTER ADDITION:$"
	msg3 db 13,10,"ARRAY AFTER SUBTRACTION:$"

	n db ?


.code

start:

	mov eax,@data
	mov ds,eax
	
	mov dx,offset msg1
	mov ah, 09H
	int 21H
	mov ah,01H
	int 21H
	mov n,al
	sub n,30H
	mov cl,n
	
INPUT:
	mov dx,offset msg0
	mov ah,09H
	int 21H
	
	mov ah,01H
	int 21H
	
	mov ARRAY[si],al
	inc si
	LOOP INPUT
	
	mov si,0
	mov cl,n
	
	mov dx,offset msg
	mov ah, 09H
	int 21H
	
INPUT2:
	mov dx,offset msg0
	mov ah,09H
	int 21H
	
	mov ah,01H
	int 21H
	
	mov ARRAY2[si],al
	inc si
	LOOP INPUT2
	
	
	mov cl,n
	mov si,0
	
ADDITION:
	mov al,ARRAY[si]
	mov bl,ARRAY2[si]
	
	add al,bl
	mov ARRAY3[si],al
	
	inc si
	LOOP ADDITION
	mov cl,n
	mov si,0
	
	mov dx,offset msg2
	mov ah,09H
	int 21H
	
PRINTARR3:
	
	mov dl,ARRAY3[si]
	and dl,0Fh
	add dl,30H
	
	mov ah,02H
	int 21H
	mov dl,' '
	mov ah,02H
	int 21H
	
	inc si
	LOOP PRINTARR3
	mov si,0
	mov cl,n

SUBTRACTION:
	mov al,ARRAY[si]
	mov bl,ARRAY2[si]
	
	sub al,bl
	
	mov ARRAY3[si],al
	
	inc si
	LOOP SUBTRACTION

	mov cl,n
	mov si,0
	
	mov dx,offset msg3
	mov ah,09H
	int 21H
	
PRINTARR4:
	
	mov bl,ARRAY3[si]
	mov dl,bl
	and dl,80H
	cmp dl,80H
	je negative
	
	mov dl,bl
	and dl,0FH
	add dl,30H
	mov ah,02H
	int 21H
	
	mov dl,' '
	mov ah,02H
	int 21H
	
	jmp noneg

negative:
	
	mov dl,2DH
	mov ah,02H
	int 21H
	
	neg bl
	mov dl,bl
	and dl,0FH
	add dl,30H
	mov ah,02H
	int 21H
	
	mov dl,' '
	mov ah,02H
	int 21H
	

noneg:
	inc si
	
	LOOP PRINTARR4
	mov si,0
	mov cl,n

EXIT:
.exit
end start

