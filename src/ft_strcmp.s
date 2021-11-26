; int	ft_strcmp(const char *s1, const char *s2);

; args:
; 	rdi -> const char *s1
; 	rsi -> const char *s2

; return:		rax -> int diff
;========================================================

global		_ft_strcmp

section		.text

_ft_strcmp:
	mov rcx, 0		 ; we put rcx to 0

comp:
	cmp 		BYTE [rdi + rcx], 0			;
	je return			 					; if (s1[i] == 0) => .return
	cmp 		BYTE [rsi + rcx], 0 		;
	je return			 					; if (s2[i] == 0) => .return
	mov 		al, BYTE [rsi + rcx]		; char c = s2[i]
	cmp 		BYTE [rdi + rcx], al		;
	jne return								; if (c != s1[i]) => .return
	inc 		rcx							; i++
	jmp 		comp						; and we continue to compare

return:
	movzx 		rax, BYTE [rdi + rcx]		; ret = s1[i]
	movzx 		rdx, BYTE [rsi + rcx]		; tmp = s2[i]
	sub 		rax, rdx					; ret -= tmp
	ret										; return ret
