; ssize_t	ft_read(int fd, void *buf, size_t count)
;
; args:
; 	rdi -> int fd
; 	rsi -> const void *buf
; 	rdx -> size_t count
;
; return:	rax -> ssize_t count
;========================================================

global	ft_read

extern	__errno_location

section	.text

ft_read:
	mov			rax, 0			; read syscall
	syscall						; ret = read(fd, buf, count)
	cmp			rax, 0			;
	jl			.error			; if (ret < 0) => .error
	ret							; return (ret)

.error:
	mov			rdi, rax			; tmp = ret
	neg			rdi					; tmp = -tmp (invert value for positive errno)
	call		__errno_location	; ret = &errno (get pointer to errno)
	mov			[rax], rdi			; *ret = tmp (put return value into errno)
	mov			rax, -1				; ret = -1
	ret								; return (ret)