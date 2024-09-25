
PROGRAM _CYCLIC
	//**************************************************************************//
	// VT--> InfeedZone 0 communications****************************************//
	// Sept 6, 2024*************************************************************//
	// Jamie Dukelow, Assurant Inc.*********************************************//
	//**************************************************************************//
	
	//Handoff between VT and Infeed Zone 0
	
	bladeStopZone0();
	partPresent := bladeStopZone0.partPresent;
	gateOpen := bladeStopZone0.gateOpen;
	gateClose := bladeStopZone0.gateClose;
	hasOpenSensor := bladeStopZone0.hasOpenSensor;
	downstreamReady := bladeStopZone0.downstreamReady;
	EMGC := bladeStopZone0.EMGC;
	
	

		
	
	
		
	
	 
END_PROGRAM
