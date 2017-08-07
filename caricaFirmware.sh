#!/bin/bash
echo "Cerco Arduino 1.6.0 in $PATH_ARDUINO"
echo "settare il percorso con variabile PATH_ARDUINO"

echo "Carico sulla device $DEV_ARDUINO"
echo "Device settabile con variabile DEV_ARDUINO"

$PATH_ARDUINO/hardware/tools/avr/bin/avrdude -D -p atmega2560 -c wiring -P $DEV_ARDUINO -U flash:w:${1}:i

