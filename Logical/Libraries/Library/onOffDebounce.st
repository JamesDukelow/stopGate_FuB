
(* debounce timer with on delay and off delay capability *)
FUNCTION_BLOCK onOffDebounce

	onDelayTimer(IN := inputSignal, PT := onTimeDelay);
	detected := onDelayTimer.Q;
	
	offDelayTimer(IN := detected, PT := offTimeDelay);
	detected := offDelayTimer.Q;
	
	

END_FUNCTION_BLOCK
