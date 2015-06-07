#!/bin/bash

cat << ROS > quadrato_ripetuto.gcode
G21 ; set units to millimeters
G28 ;Home all axis
G1 Z100 F2000
G1 X100 Y100 F3000
G92
G90 ; use absolute coordinates
G92

ROS

for step in $(seq 10 400)
do
cat << EOF >> quadrato_ripetuto.gcode
G1 Z$step F$(( $step *10 ))
G1 F$(( $step *10 ))
G1 X-80 Y80
G1 X-80 Y-80
G1 X80 Y-80
G1 X80 Y80
G1 X0 Y0
G1 X-60 Y60
G1 X-60 Y-60
G1 X60 Y-60
G1 X60 Y60
EOF
done
