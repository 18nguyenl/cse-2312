.global isEven

.text 

isEven:
	@ store link register because we're gonna override it
	PUSH {LR}
	AND R0, R0, #1
	BL invert @ overrides link register => stack needed
	POP {LR}
	BX LR

invert:
	EOR R0, R0, #1 @ invert to return correct truth value
	BX LR

