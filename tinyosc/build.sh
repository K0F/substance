#!/bin/bash

#gcc *.c -Werror -std=c99 -O0 -g -o tinyosc
gcc -o oscrec *.c -std=gnu99 -O3  -I.
