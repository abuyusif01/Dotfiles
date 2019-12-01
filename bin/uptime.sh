#!/bin/bash

# Show the uptime
uptime | cut -d' ' -f 4,5 | sed 's/,//'
