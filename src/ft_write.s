; ssize_t	ft_write(int fd, const void *buf, size_t count)
;
; args:
; 	rdi -> int fd
; 	rsi -> const void *buf
; 	rdx -> size_t count
;
; return:	rax -> ssize_t count
;========================================================

global	_ft_write

extern ___error

section .text

_ft_write:
	mov			rax, 0x2000004	; write syscall
	syscall						; res = write(fd, buf, count)
	cmp			rax, 0
	jl			.error			; if (res < 0) goto .error
	ret							; else return res

.error:
	mov			rdi, rax			; tmp = ret
	neg			rdi					; tmp = -tmp (invert value for positive errno)
	call		___error			; ret = &errno (get pointer to errno)
	mov			[rax], rdi			; *ret = tmp (put return value into errno)
	mov			rax, -1				; ret = -1
	ret								; return (ret)
