#!/bin/bash

avrdude -D -p atmega2560 -c wiring -P /dev/ttyACM0 -U flash:w:${1}:i
