
telemetry.log.parsed:
	cd data-parser; ./dump < ../telemetry.log > ../telemetry.log.parsed

telemetry.csv: telemetry.log.parsed
	cd data-parser; ./mkcsv < ../telemetry.log.parsed > ../telemetry.csv
