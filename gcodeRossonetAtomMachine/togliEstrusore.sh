#!/bin/bash
#Elimina dal gcode l'estrusore e la temperatura

cp $1 temp.gcode
sed -i "s/M107//" temp.gcode
sed -i "s/M104 S 0//" temp.gcode
sed -i "s/M109 S 0//" temp.gcode
sed -i "s/M106 S127 ;EXTRUDER FAN ON//" temp.gcode
sed -i "s/T0//" temp.gcode
sed -i "s/M106 S255//" temp.gcode
sed -i "s/G92 E0/G92/" temp.gcode
sed -i "s/E.*\.[0-9][0-9][0-9][0-9][0-9]//" temp.gcode
cat temp.gcode | grep -v '^$' > elaborato_$1
rm temp.gcode
