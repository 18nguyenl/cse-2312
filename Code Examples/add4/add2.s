.global add2

.text

add2:
	@ think repeated +='s
	@ looks like ADD is a signed operation
	ADD R0, R0, R1
	BX LR




