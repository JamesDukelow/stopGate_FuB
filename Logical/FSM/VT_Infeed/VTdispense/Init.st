

PROGRAM _INIT
	laneIdx := 0;
	readyForDispense := FALSE;
	pauseDispense := FALSE;
	start := FALSE;
	state := 0;
	error := FALSE;
	
	
	FOR i := 0 TO 2 DO
		resetLaneCount[i] := FALSE;
		laneCount[i] := 0;
		downstreamFull[i] := FALSE;
	END_FOR
	
	 
END_PROGRAM