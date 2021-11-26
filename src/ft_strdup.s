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
	call		_ft_strlen		; len = ft_strlen(s1)
	inc			rax				; len++
	mov			rbx, rdi		; tmp = s1
	mov			rdi, rax		; size = len
	call		_malloc			; ret_malloc = malloc(size)
	cmp			rax, 0
	je			.error			; if (!ret_malloc) => .error
	mov			rdi, rax		; dst = ret_malloc
	mov			rsi, rbx		; src = tmp
	call		_ft_strcpy
	ret

.error:
	mov			rdi, rax			; tmp = ret
	neg			rdi					; tmp = -tmp (invert value for positive errno)
	call		___error			; ret = &errno (get pointer to errno)
	mov			[rax], rdi			; *ret = tmp (put return value into errno)
	mov			rax, -1				; ret = -1
	ret								; return (ret)
