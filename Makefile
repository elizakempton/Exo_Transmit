# File:          Makefile
# Author:        Albert Owusu-Asare
# Created:       May 28,2014
# Acknowledgement:  adapted from an example by Henry Walker, Grinnell College
#----------------------------------------------------------------------------
# Use the gcc compiler
CC = cc

# Set compilation flags
#   -ansi (check syntax against the American National Standard for C
CFLAGS = -Wall -g

#----------------------------------------------------------------------------
# build rules:
#
# Each rule takes the following form>  (Note there MUST be a tab,
# as opposed to several spaces, preceeding each command.
#
# target_name:  dependency_list
#	command(s)


all: Exo_Transmit


# List program components, what they depend on, and how to compile each

#<<<<<<< HEAD
Exo_Transmit: main_transmission.o readopactable.o totalopac.o readchemtable.o read_t_p.o rt_transmission.o nrutil.o utils.o interpol.o planck.o geometry.o getFileArray.o getVars.o getNTau.o getChemSelection.o
	$(CC) -lm -o Exo_Transmit  main_transmission.o readopactable.o totalopac.o readchemtable.o read_t_p.o rt_transmission.o nrutil.o utils.o interpol.o planck.o geometry.o getFileArray.o getVars.o getNTau.o getChemSelection.o
#=======

main_transmission.o: main_transmission.c opac.h atmos.h prototypes.h 
	$(CC) $(CFLAGS) -c main_transmission.c 

readopactable.o: readopactable.c constant.h atmos.h opac.h prototypes.h vars.h nrutil.h
	$(CC) $(CFLAGS) -c  readopactable.c 

totalopac.o: totalopac.c include.h constant.h atmos.h opac.h readopactable.c readchemtable.c nrutil.c nrutil.h utils.c interpol.c vars.h prototypes.h
	$(CC) $(CFLAGS) -c  totalopac.c 

readchemtable.o:  readchemtable.c opac.h vars.h prototypes.h
	$(CC) $(CFLAGS) -c readchemtable.c 

nrutil.o: nrutil.c nrutil.h 
	$(CC) $(CFLAGS) -c nrutil.c 

utils.o: utils.c include.h nrutil.h
	$(CC) $(CFLAGS) -c utils.c 

interpol.o: interpol.c prototypes.h
	$(CC) $(CFLAGS) -c interpol.c 


#<<<<<<< HEAD
read_t_p.o:  read_t_p.c  atmos.h prototypes.h vars.h nrutil.h
	$(CC) $(CFLAGS) -c read_t_p.c 


rt_transmission.o:  rt_transmission.c opac.h atmos.h constant.h include.h nrutil.c interpol.c planck.c utils.c geometry.c vars.h prototypes.h
	$(CC) $(CFLAGS) -c  rt_transmission.c

planck.o:  constant.h include.h planck.c
	$(CC) $(CFLAGS) -c  planck.c 

getFileArray.o:  getFileArray.c
	$(CC) $(CFLAGS) -c getFileArray.c
	
getVars.o:  getVars.c  vars.h
	$(CC) $(CFLAGS) -c getVars.c
	
getChemSelection.o:  getChemSelection.c
	$(CC) $(CFLAGS) -c getChemSelection.c
	
getNTau.o:  getNTau.c vars.h
	$(CC) $(CFLAGS) -c getNTau.c
	
geometry.o:  geometry.c prototypes.h opac.h atmos.h constant.h include.h interpol.c
	$(CC) $(CFLAGS) -c  geometry.c 

clean:
	rm -f *.o *~ core*
