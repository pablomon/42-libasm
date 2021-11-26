; char	*ft_strdup(const char *s1)
;
; args:
; 	rdi -> const char *s1
;
; return:		rax -> char *dst
;========================================================

global		_ft_strdup

extern		___error
extern		_malloc
extern		_ft_strlen
extern		_ft_strcpy

section		.text

_ft_strdup:
	call	_ft_strlen		; len = ft_strlen(s1)
	push	rdi				; save src on the stack
	inc		rax				; len++
	mov		rdi, rax		; len_for_malloc = len
	call	_malloc			; ptr = malloc(len_for_malloc)
	cmp		rax, 0			;
	jz		.error			; if (ptr == 0) => .error
	mov		rdi, rax		; dst = ptr
	pop		rsi				; bring src from the stack
	call	_ft_strcpy		; ft_strcpy(dst, src)
	ret						; return dst

.error:
	mov			rdi, rax			; tmp = ret
	neg			rdi					; tmp = -tmp (invert value for positive errno)
	call		___error			; ret = &errno (get pointer to errno)
	mov			[rax], rdi			; *ret = tmp (put return value into errno)
	mov			rax, -1				; ret = -1
	ret								; return (ret)
