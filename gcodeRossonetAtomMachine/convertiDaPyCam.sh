#!/bin/bash


cp $1 temp.gcode
#inizio file e centro
sed -i "s/^ X/G1 X/" temp.gcode
sed -i "s/^ Y/G1 Y/" temp.gcode
sed -i "s/^;.*$//" temp.gcode
sed -i "s/F200.00000/G21/" temp.gcode
sed -i "s/S1000.00000/G28/" temp.gcode
sed -i "s/T3 M6/G1 Z100 F10000/" temp.gcode
sed -i "s/M3 (start spindle)/G92/" temp.gcode
sed -i "s/G04 P3 (wait for 3 seconds)/G90/" temp.gcode

sed -i "s/G0 Z25.0000/G1 Z25 F1500/" temp.gcode
sed -i "s/G1 Z0\..*$/G1 Z10 F900/" temp.gcode

# Fine file
sed -i "s/M5 (stop spindle)/G1 X0 Y0 Z350 F3000/" temp.gcode
sed -i "s/M2 (end program)/G28/" temp.gcode
cat temp.gcode | grep -v '^$' > $1
rm temp.gcode


