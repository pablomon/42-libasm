; char	*ft_strcpy(char *dst, const char *src)

; args:
; 	rdi		char *dst
; 	rsi		const char *src

; return:	rax -> char *dst
;========================================================


global	ft_strcpy

section	.text

ft_strcpy:
	mov		rcx, -1			; i = -1
	mov		rdx, 0			; tmp = 0
	cmp		rsi, 0			; 
	jz		.return			; if (dst == 0) => .return

.while:
	inc		rcx						; i++
	mov		dl, BYTE [rsi + rcx]	; c = src[i]
	mov		BYTE [rdi + rcx], dl	; dst[i] = c
	cmp		dl, 0					;
	jnz		.while					; if (c != 0) => .while

.return:
	mov		rax, rdi		; return dst
	ret