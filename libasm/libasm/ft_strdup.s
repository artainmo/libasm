; RDI takes the intial parameter s1
; strdup allocates memory to s2 and creates a copy of s1, it returns the copy

section	.text
						global	_ft_strdup:			; necessary for function call
            extern  _ft_strcpy:
            extern  _ft_strlen:
            extern _malloc:

_ft_strdup:
            call  _ft_strlen  ; Returns in RAX the lenght of RDI
						push RDI					; Pushs in stack memory the s1 string
            mov    RCX, RDI       ; RCX is a temporary that contains the initial RDI or s1
            mov    RDI, RAX      ; We give the value RAX or lenght of s1 to RDI for malloc
            inc    RDI           ; We increment by one the string lenght that needs to be malloced
            call  _malloc      ; Malloc takes RDI or currently lenght of s1 as parameter and returns a pointer to RAX or s2
						cmp		RAX, 0	; If RAX first byte is equal to zero or malloc failed, RAX or zero is returned
						je	_ret
            pop   RSI						; Takes back the s1 string that got pushed in stack memory
            mov    RDI, RAX      ; RDI takes s2 for the strcpy function
            call  _ft_strcpy   ; strcpy takes RDI or currently s2 as first parameter and RSI or s1 as second parameter, it returns the malloced copy to RAX
            mov   RDI, RSI      ; RDI takes back its initial value s1, because all variables are global the variables should keep the values they came in with

_ret:
						;mov		RAX, 0 ;LIBASM_UNIT TEST IS FALSE ABOUT MALLOC PROTECTION TEST HERE
						ret						; return RAX
