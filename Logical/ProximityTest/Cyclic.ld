PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio FileVersion="4.9"?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="sensor" type="onOffDebounce"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="inputSignal"/>
			<functionblock position="top" type="onOffDebounce"><input name="inputSignal"/><output name="detected"/></functionblock>
			<analog type="output" name="detected"/>
		</row>
		<row>
			<analog type="input" name="onTimeDelay"/>
			<functionblock position="middle" type="onOffDebounce"><input name="onTimeDelay"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="offTimeDelay"/>
			<functionblock position="bottom" type="onOffDebounce"><input name="offTimeDelay"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM

