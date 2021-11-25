; char	*ft_strdup(const char *s1)
;
; args:
; 	rdi -> const char *s1
;
; return:		rax -> char *dst
;========================================================

global		ft_strdup

extern		__errno_location
extern		malloc
extern		ft_strlen
extern		ft_strcpy

section		.text

ft_strdup:
	call		ft_strlen		; len = ft_strlen(s1)
	inc			rax				; len++
	mov			rbx, rdi		; tmp = s1
	mov			rdi, rax		; size = len
	call		malloc			; ret_malloc = malloc(size)
	cmp			rax, 0
	je			.error			; if (!ret_malloc) => .error
	mov			rdi, rax		; dst = ret_malloc
	mov			rsi, rbx		; src = tmp
	call		ft_strcpy
	ret

.error:
	mov			rdi, rax			; tmp = ret
	neg			rdi					; tmp = -tmp (invert value for positive errno)
	call		__errno_location	; ret = &errno (get pointer to errno)
	mov			[rax], rdi			; *ret = tmp (put return value into errno)
	mov			rax, -1				; ret = -1
	ret								; return (ret)