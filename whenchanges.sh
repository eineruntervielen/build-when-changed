#!/bin/bash
# Script Name:  whenchanged
# Beschreibung: Kann im Hintergrund gestartet werden und baut nach jeder
#               Aenderung an einer *.tex Datei via dem Makefile das Dokument
#               neu und produziert ein PDF.
# Aufruf:       ./whenchanged [<name_of_output.pdf>]
# Autor:        Erik J Kostic
# Version:      0.2
# Datum:        2021-07-22


#MAINFILE=$1
if [[ -f "/Makefile" ]]
then
    make
    while true
    do
        sleep 1
        find ./ -iname "*.tex" | while read tex_file
        do
            if [[ "$tex_file" -nt "main.pdf" ]] # ALT
#            if [[ "$tex_file" -nt $MAINFILE ]] # Dieses main muss noch übergeben werden. kann ja anders heißen
            then
                echo "$tex_file has changes"
                make
            fi
        done
    done
else
    echo "Makefile does not exist."
    exit
fi
