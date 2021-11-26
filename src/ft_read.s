; ssize_t	ft_read(int fd, void *buf, size_t count)
;
; args:
; 	rdi -> int fd
; 	rsi -> const void *buf
; 	rdx -> size_t count
;
; return:	rax -> ssize_t count
;========================================================

global	_ft_read

section	.text

extern ___error

_ft_read:
	mov			rax, 0x2000003	; read syscall
	syscall						; ret = read(fd, buf, count)
	cmp			rax, 0			;
	jl			.error			; if (ret < 0) => .error
	ret							; return (ret)

.error:
	mov			rdi, rax			; tmp = ret
	neg			rdi					; tmp = -tmp (invert value for positive errno)
	call		___error	; ret = &errno (get pointer to errno)
	mov			[rax], rdi			; *ret = tmp (put return value into errno)
	mov			rax, -1				; ret = -1
	ret								; return (ret)
