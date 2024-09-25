
FUNCTION_BLOCK stopGate
	
	partPresentFTRIG(CLK := partPresent);  // this indicates that the part has passed by the sensor and the gate is ready to close after
	                                       // a delay timer elapses.
	
	
	CASE state OF 
		
		0:  // Starting point of stop gate--everything initialized
			gateOpen := FALSE;
			sGateOpenFault := FALSE;
			sGateCloseFault := FALSE;
			gateOpen := FALSE;
			gateClose := TRUE;
			gateOpenTimeout(IN := FALSE);
			gateCloseTimeout(IN := FALSE);
			gateOpenTimer (IN := FALSE);
			gateCloseTimer (IN := FALSE);
			IF gateCloseSensor THEN
				sGateClosed := TRUE;
				state := 5;
			ELSE
				sGateClosed := FALSE;
				sGateOpen := TRUE ;
				state := 40;
			END_IF
			
		5:
			
			// If part arrives at sensor, turn on gateOpen to open gate and move to state 1.  If sensor is used, would
			// need to use de-bounced sensor variable (use onOffDebounce FuB)
			
			IF partPresent AND downstreamReady AND NOT EMGC THEN  //partPresent would be the .out of onOffDebounce FuB for sensor
				state := 10;
				gateOpen := TRUE;
			END_IF
			
			
		10:  // Once gateOpen signal gets triggered, the gate should open within a short time (configurable).  A gate open
			// timeout timer starts at this time.  At this time, if the gate open sensor goes TRUE before the timeout timer
			// matures, then output a signal to signify that the gate is open.  If timer matures and open sensor is still
			// FALSE, then output a gate fault status and move to state 3 where the gate awaits to be fixed, then a "reset"
			// button is pressed to indicate the gate has been fixed.
			
			gateOpenTimeout(IN := TRUE, PT := openTimeout);
			IF hasOpenSensor THEN 
					
				IF gateOpenSensor THEN
				sGateOpen := TRUE;
				sGateClosed := FALSE;
				state := 20;
				ELSIF gateOpenTimeout.Q THEN
				sGateOpenFault := TRUE;
				sGateOpen := FALSE;
					state := 30;
					
				END_IF
			ELSE
				state := 20;
			END_IF
			
		20: // Once in state 20, the gate is known to be opened successfully, and the program waits for the part to
			// pass by the sensor.  Then a closeDelay timer starts.  This timer defines
			// how long the gate should stay open after the falling edge trigger of the sensor
			// goes TRUE (configurable).  When this timer matures, the gateOpen is set TO FALSE which
			// should allow the gate to close, and gateClose is set to TRUE.  
			// Once the gateOpen is
			// set to FALSE, a timeout timer similar to state 10 starts timing.  If timer matures and open sensor is still
			// TRUE, then output a gate fault status and move to state 40 where the gate awaits to be fixed, then a "reset"
			// button is pressed to indicate the gate has been fixed.
			
			// gateOpenTimer (IN := TRUE, PT := openTime);  TODO:  delete if determined not necessary anymore
			gateOpenTimeout (IN := FALSE);
			
			IF partPresentFTRIG.Q THEN
				gateCloseDelay(IN := TRUE, PT := gateCloseDelayTime); 
			END_IF
			
			IF gateCloseDelay.Q THEN
				
				gateOpen := FALSE;
				gateClose := TRUE;
				gateCloseTimeout(IN := TRUE, PT := closeTimeout);
				gateCloseDelay(IN := FALSE);
			END_IF
				
			IF gateCloseSensor THEN
				sGateClosed := TRUE;
				gateCloseTimeout(IN := FALSE);
				state := 0;
				ELSIF gateCloseTimeout.Q THEN
					sGateCloseFault := TRUE;
					sGateClosed := FALSE;
					state := 40;
				END_IF
			END_IF
			
		30: // Gate Not Open fault reset
			
			gateFaultResetTRIG(CLK := gateFaultReset);
			gateOpenTimeout (IN := FALSE);
			
			IF gateFaultResetTRIG.Q THEN
				gateCloseTimeout(IN := FALSE);
				sGateCloseFault := FALSE;
				state := 0;
			END_IF
			
		
		40:  // Gate not Closed fault reset
			
			gateFaultResetTRIG(CLK := gateFaultReset);
			
			IF gateFaultResetTRIG.Q THEN
				gateCloseTimeout(IN := FALSE);
				sGateCloseFault := FALSE;
				state := 0;
			END_IF
		
	END_CASE		
				
	
	
	IF EMGC THEN
		state := 0;
	END_IF
	
	
END_FUNCTION_BLOCK
