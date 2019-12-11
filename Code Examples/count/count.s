.global countUpToFifty
.global countDownToZero

.text

countUpToFifty:
	MOV R1, #50
	loopUp:
		CMP R0, R1 @ set flags comparing R0 (a) and R1(#50)
		BGE exit @ is if R0 == R1, exit
		ADD	R0, R0, #1 @ increment
		B loopUp @ loop back up => while loop

countDownToZero:
	loopDown:
		CMP R0, #0
		BLE exit @ Less than or equal 0? => exit
		SUB R0, R0, #1
		B loopDown

exit:
	BX LR
