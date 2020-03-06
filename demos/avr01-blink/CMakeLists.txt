cmake_minimum_required (VERSION 3.9)
project(avr01-blink)

set(SOURCES avr01-blink.c)


add_avr_executable(avr01-blink ${SOURCES})