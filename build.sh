openscad_osx="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
openscad_ubuntu="/usr/bin/openscad"

if [ -f $openscad_osx ]; then
	openscad=$openscad_osx
else
	if [ -f $openscad_ubuntu ]; then
		openscad=$openscad_ubuntu
	else
		echo "OpenSCAD not installed" 
    	exit 1
	fi

fi

# let's build some scad files. 
for filename in ./*.scad; do
	extension="${filename##*.}"
	filename="${filename%.*}"
	echo "Building $filename.scad -> $filename.stl"
	command="$openscad -o $filename.stl $filename.scad"
	eval $command
done
