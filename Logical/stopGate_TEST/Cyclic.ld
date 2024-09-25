PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio FileVersion="4.9"?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="12" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="bladeStopZone0" type="stopGate"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="top" type="stopGate"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="partPresent"/><output name="gateOpen"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="EMGC"/><output name="sGateOpenFault"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="gateOpenSensor"/><output name="sGateOpen"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="openTime"/><output name="sGateCloseFault"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="closeTimeout"/><output name="gateClose"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="openTimeout"/><output name="sGateClosed"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="gateCloseSensor"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="gateFaultReset"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="stopGate"><input name="downstreamReady"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="bottom" type="stopGate"><input name="hasOpenSensor"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM







