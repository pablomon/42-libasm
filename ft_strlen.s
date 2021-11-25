; size_t	ft_strlen(const char *s)
;
; args: 
; 	rdi -> const char *s
;
; return:	rax -> size_t len
;========================================================

global		ft_strlen

section .text

ft_strlen:
	mov			rax, -1			; i = 0

.while:							; while
	inc			rax				; i++
	cmp byte	[rdi + rax], 0	; s[i] != 0
	jne			.while

	ret							; return (i)