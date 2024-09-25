
{REDUND_ERROR} FUNCTION_BLOCK onOffDebounce (*debounce timer with on delay and off delay capability*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		inputSignal : {REDUND_UNREPLICABLE} BOOL;
		onTimeDelay : {REDUND_UNREPLICABLE} TIME;
		offTimeDelay : {REDUND_UNREPLICABLE} TIME;
	END_VAR
	VAR_OUTPUT
		detected : BOOL;
	END_VAR
	VAR
		onDelayTimer : {REDUND_UNREPLICABLE} TON;
		offDelayTimer : {REDUND_UNREPLICABLE} TOF;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK stopGate (*define actuate signal, timeout for gate to open, gate open duration, EMGC input*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		partPresent : {REDUND_UNREPLICABLE} BOOL;
		EMGC : {REDUND_UNREPLICABLE} BOOL;
		gateOpenSensor : {REDUND_UNREPLICABLE} BOOL;
		openTime : {REDUND_UNREPLICABLE} TIME;
		closeTimeout : TIME;
		openTimeout : TIME;
		gateCloseSensor : BOOL;
	END_VAR
	VAR_OUTPUT
		gateOpen : {REDUND_UNREPLICABLE} BOOL;
		sGateOpenFault : {REDUND_UNREPLICABLE} BOOL;
		sGateOpen : {REDUND_UNREPLICABLE} BOOL;
		sGateCloseFault : BOOL;
		gateClose : BOOL;
		sGateClosed : BOOL;
	END_VAR
	VAR
		gateOpenTimeout : {REDUND_UNREPLICABLE} TON;
		state : {REDUND_UNREPLICABLE} INT;
		gateCloseTimeout : TON;
		gateFaultResetTRIG : R_TRIG;
	END_VAR
	VAR_INPUT
		gateFaultReset : BOOL;
		downstreamReady : BOOL;
	END_VAR
	VAR
		partPresentFTRIG : F_TRIG;
		gateOpenTimer : TON;
		gateCloseTimer : TON;
	END_VAR
	VAR_INPUT
		hasOpenSensor : BOOL;
	END_VAR
	VAR
		gateCloseDelay : TON;
		gateCloseDelayTime : TIME;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION Timers : BOOL (*Timers used in Automation Line*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		openTimeout : TIME;
		closeTimeout : TIME;
		openTime : TIME;
		closeTime : TIME;
	END_VAR
	VAR
		gateOpenTimeout : TON;
		gateCloseTimeout : TON;
		gateOpenTimer : TON;
		gateCloseTimer : TON;
	END_VAR
	VAR_INPUT
		gateOpen : BOOL;
		gateClose : BOOL;
		gateOpenTimerDone : BOOL;
		gateCloseTImerDone : BOOL;
	END_VAR
END_FUNCTION
