.global add4

.text

add4:
	@ think repeated +='s
	@ looks like ADD is a signed operation
	ADD R0, R0, R1
	ADD R0, R0, R2
	ADD R0, R0, R3
	BX LR




