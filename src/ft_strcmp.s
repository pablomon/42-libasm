; int	ft_strcmp(const char *s1, const char *s2);

; args:
; 	rdi -> const char *s1
; 	rsi -> const char *s2

; return:		rax -> int diff
;========================================================

global		ft_strcmp

section		.text

ft_strcmp:
	mov			rcx, -1		; i = 0

.while:
	inc			rcx						; i++;
	mov			dl, byte[rdi + rcx]		; char c1 = s1[i]
	mov			dh, byte[rsi + rcx]		; char c2 = s2[i]
	cmp			dl, dh
	jne			.return					; if (s1[i] != s2[i]) => return
	cmp			dl, 0
	je			.return					; if (s1[i] == '\0') => return
	cmp			dh, 0
	je			.return					; if (s2[i] == '\0') => return
	jmp			.while

.return:
	sub			dl, dh		; c1 -= c2
	movsx		rax, dl		; ret (c1)
	ret