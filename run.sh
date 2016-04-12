#!/bin/bash

echo "hello world" > ~/log.txt

sudo touch /forcefsck
sudo mount -o remount,size=256M /dev/shm
echo performance | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

#(pj ~/src/pijockey-sound/shaders/template.glsl)&

(sleep 5s && pkill fbi)&
(sleep 5s && pj ~/substance.glsl )&
(sh ~/start-sc) # > /dev/null 2>&1)&
