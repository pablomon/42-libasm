; ssize_t	ft_write(int fd, const void *buf, size_t count)
;
; args:
; 	rdi -> int fd
; 	rsi -> const void *buf
; 	rdx -> size_t count
;
; return:	rax -> ssize_t count
;========================================================

section .text
global	_ft_write

extern	___error


_ft_write:
	mov			rax, 0x2000004	; write syscall
	syscall						; res = write(fd, buf, count)

	jc			.error			; if (res < 0) goto .error
	ret							; else return res

.error:
    push r10
    mov r10, rax
    call ___error
    mov qword [rax], r10
    mov rax, -1
    pop r10
    ret
