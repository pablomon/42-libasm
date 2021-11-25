; int	ft_strcmp(const char *s1, const char *s2);

; args:
; 	rdi -> const char *s1
; 	rsi -> const char *s2

; return:		rax -> int diff
;========================================================

global		ft_strcmp

section		.text

ft_strcmp:
	mov			rcx, 0			; i = 0
	mov			rdx, 0			; cmp = 0
	cmp			rdi, 0			; if (!s1)
	jz			.check_null
	cmp			rsi, 0			; if (!s2)
	jz			.check_null
	jmp			.check

.check_null:
	cmp			rdi, rsi
	jz			.equal			; if (s1 == s2 == 0) //NULL
	jg			.superior		; if (s1 == NULL)
	jmp			.inferior		; else if (s2 == NULL)

.compare:
	mov			dl, BYTE [rsi + rcx]	; tmp = s2[i]
	cmp			BYTE [rdi + rcx], dl	; 
	jne			.is_last_char			; if (s1[i] != tmp)
	inc			rcx						; i++

.check:
	cmp			BYTE [rdi + rcx], 0		; 
	je			.is_last_char			; if (!s1[i])
	cmp			BYTE [rsi + rcx], 0		; 
	je			.is_last_char			; if (!s2[i])
	jmp			.compare

.is_last_char:
	mov			dl, BYTE [rdi + rcx]	; cmp = s1[i]
	sub			dl, BYTE [rsi + rcx]	; cmp -= s2[i]
	cmp			dl, 0					; 
	jz			.equal					; if (cmp == 0) -> equal
	jl			.inferior				; if (cmp < 0) -> inferior

.superior:
	mov			rax, 1
	ret

.inferior:
	mov			rax, -1
	ret

.equal:
	mov		rax, 0
	ret