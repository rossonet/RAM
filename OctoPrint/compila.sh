#!/bin/bash

killall octoprint

~/RAM/OctoPrint/venv/bin/python setup.py install

cd && nohup ~/RAM/OctoPrint/venv/bin/octoprint > ~/octoprint.log 2> ~/octoprint.err < /dev/null &
