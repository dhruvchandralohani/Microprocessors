.model small
	.data
	MESS0 DB 10,13,"ENTER THE NUMBER:$"
	MESS1 DB 10,13,"THE BINARY EQUIVALENT IS:$"
	a db ?
	.code
	.startup
	mov ah,09h
	lea dx,MESS0
	int 21H

	mov ah,01h
	int 21H

	lea dx,MESS1
	mov ah,09h
	int 21H

	mov cl , 08H
	mov ah, 00h

	up :  shl al, 01h  
		
	mov bl, al  
	mov  al, 00H
	adc al, 30h
	mov dl, al
	mov ah, 02h
	int 21h
	mov al,bl
	dec cl
	jnz up
	mov ah, 4ch  
	int 21H
	end
