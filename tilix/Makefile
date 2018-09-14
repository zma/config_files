default:
	@echo "Call 'make {import,export} to import/export the configurations"
export:
	dconf dump /com/gexperts/Tilix/ > tilix.dconf
import:
	dconf load /com/gexperts/Tilix/ < tilix.dconf

