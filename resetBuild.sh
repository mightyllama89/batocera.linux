#!/bin/bash

echo "this is a test"
echo "this is another test"

command="$1"

if [[ "$command" == "all" || ! "$command" ]]; then
	rm -rf output/build/batocera-configgen-1.0 
	rm -rf output/build/batocera-es-system-1.0 
	rm -rf output/build/batocera-retrogame-1.0 
	rm -rf output/build/batocera-shaders-1.0 
	rm -rf output/build/batocera-bezel-master 
	find output/build -name "batocera-system-*" -prune -exec rm -r {} \;
	rm -rf dl/batocera-bezel 

	find output/build -name "batocera-emulationstation-*" -prune -exec rm -r {} \;
	rm -rf dl/batocera-emulationstation
	
	echo "All ready for a fresh build!:"
fi

if [[ "$command" == "batocera" ]]; then
	rm -rf output/build/batocera-configgen-1.0 
	rm -rf output/build/batocera-es-system-1.0 
	rm -rf output/build/batocera-retrogame-1.0 
	rm -rf output/build/batocera-shaders-1.0 
	rm -rf output/build/batocera-bezel-master 
	find output/build -type d -name "batocera-system-*" -prune -exec rm -r {} \;
	rm -rf dl/batocera-bezel 
	echo "Batocera Linux ready for a fresh build!"
fi

if [[ "$command" == "es" ]]; then
	find output/build -name "batocera-emulationstation-*" -prune -exec rm -r {} \;
	rm -rf dl/batocera-emulationstation
	echo "Emulation Station ready for fresh build!"
fi


