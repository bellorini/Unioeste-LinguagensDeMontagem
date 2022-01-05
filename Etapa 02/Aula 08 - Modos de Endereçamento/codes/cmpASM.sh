#!/bin/bash
# Caso não seja -rwxr-xr-x faça:
# 	chmod +x cmpASM.sh

if [ "$#" -ne 2 ]; then
	echo Deve ser passado 2 nomes de arquivos! Try again!
	exit
fi

if [ ! -f "$1" ]; then
	echo Arquivo $1 não encontrado! Try again!
	exit
fi

if [ ! -f "$2" ]; then
	echo Arquivo $2 não encontrado! Try again!
	exit
fi

cmp -l $1 $2 | gawk '{printf "%08X %02X %02X\n", $1-1, strtonum(0$2), strtonum(0$3)}'
