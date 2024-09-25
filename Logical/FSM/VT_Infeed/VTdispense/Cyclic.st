
PROGRAM _CYCLIC
	
	//**************************************************************************//
	// VT device dispense Control***********************************************//
	// Sept 6, 2024*************************************************************//
	// Jamie Dukelow, Assurant Inc.*********************************************//
	//**************************************************************************//
	
	//B&R chooses next lane to dispense phone
	// B&R sends signal to VT to dispense phone 
	//wait for isDispensing signal
	//once signal is received, increment lane.  if lane not available, increment again
	//if lane still not available, go back to original lane.  if original lane not
	//available, send signal to VT to pause dispensing.  Keep going through this cycle
	//until lane becomes available.  Then resume dispensing.
	//need signal from Transport module as to how many phones are in each lane.
	
	
	//Declaring RTrigs
	
	isDispensingTrig (CLK := isDispensing);
	startTrig(CLK := start);
	errorResetTrig (CLK := errorReset);
	
	
	IF laneIdx >=3 THEN  //prevents logic from attempting to dispense into any lane # greater than 2.
		laneIdx := 0;
	END_IF
	// Reset any lane count to zero
	FOR i := 0 TO 2 DO
		resetLaneCountTrig[i] (CLK := resetLaneCount[i]);
		IF resetLaneCountTrig[i].Q THEN
			laneCount[i] := 0;
			resetLaneCount[i] := FALSE;
		END_IF
	END_FOR
	
	
	
	//Resets lane index to 0	
		
	IF startTrig.Q THEN
		laneIdx := 0;
		start := FALSE;
	END_IF
	
	//doesn't allow dispensing if all lanes are full
	
	IF (laneCount[0] AND laneCount[1] AND laneCount[2]) >= maxLaneCount THEN
		readyForDispense := FALSE;
	END_IF
	
	
	
	CASE state OF 
		
		0:  //default state
			
			IF NOT error THEN
				state := 10;
			ELSE
				state := 40;
			END_IF
			
			
		10:  //dispense onto lane 0
			
			IF laneCount[0] < maxLaneCount THEN
				readyForDispense := TRUE;
				laneIdx := 0;
				IF isDispensingTrig.Q THEN 
					//laneIdx := laneIdx + 1;
					readyForDispense := FALSE;
					laneCount[0] := laneCount[0] + 1;
					state := 20;
					isDispensing := FALSE;
				END_IF
			ELSE state := 20;
			END_IF
			
			
		20: //dispense onto lane 1
			
			IF laneCount[1] < maxLaneCount THEN
				readyForDispense := TRUE;
				laneIdx := 1;
				IF isDispensingTrig.Q THEN 
					readyForDispense := FALSE;
					laneCount[1] := laneCount[1] + 1;
					state := 30;
					isDispensing := FALSE;
				END_IF
			ELSE state := 30;
			END_IF
			
			
		30: //dispense onto lane 2
			
			
			IF laneCount[2] < maxLaneCount THEN
				readyForDispense := TRUE;
				laneIdx := 2;
				IF isDispensingTrig.Q THEN 
					readyForDispense := FALSE;
					laneCount[2] := laneCount[2] + 1;
					state := 10;
					isDispensing := FALSE;
				END_IF
			ELSE state := 0;
			END_IF
		
		40:  //ERROR state
		
		
			IF errorResetTrig.Q THEN
				error := FALSE;
				state := 0;
			ELSE
				state := 40;
			END_IF
		
			
	END_CASE
	
			
			
				
				
			
		
	
	
	 
END_PROGRAM






			(*	IF laneIdx = 0 AND NOT downstreamFull AND NOT pauseDispense THEN
					state := 10;
				ELSIF laneIdx = 1 AND NOT downstreamFull AND NOT pauseDispense THEN
					state := 20;
				ELSIF laneIdx = 2 AND NOT downstreamFull AND NOT pauseDispense THEN
					state := 30;
				ELSE state := 0;
				END_IF *)




