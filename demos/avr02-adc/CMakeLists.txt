cmake_minimum_required (VERSION 3.9)
project(avr02-adc)

file (GLOB SOURCES *.c)

add_avr_executable(avr02-adc ${SOURCES})