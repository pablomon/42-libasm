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
	jc			.error			; if (ret < 0) => .error
	ret							; return (ret)

.error:
    push r10
    mov r10, rax
    call ___error
    mov qword [rax], r10
    mov rax, -1
    pop r10
    ret
