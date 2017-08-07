#!/bin/bash

echo "Cerco Arduino 1.6.0 in $PATH_ARDUINO"
echo "settare il percorso in PATH_ARDUINO"

$PATH_ARDUINO/arduino --verify Marlin/Marlin/Marlin.ino -v

