#!/bin/bash
# creamos los fichero de filtros
blackList=blackList.txt
whiteList=whiteList.txt
touch $blackList
touch $whiteList
# VARIABLES
# Sacamos la lista de comandos
cronTasks=$(ps -eo command)
# declaramos el array que usaremos para los filtros de exclusion y de inclusión
excluidos=(`cat $blackList`)
incluidos=(`cat $whiteList`)
nameReport=$(date +%Y%m%d-%H%M-)report.txt

# FUNCIONES
. functions.sh
while getopts "bwa:e:rdh" option;
    do
      case "${option}" in
      b) cat $blackList ; exit 1;;
      w) cat $whiteList ; exit 1;;
      a) echo $OPTARG >> $whiteList ; exit 1;;
      e) echo $OPTARG >> $blackList ; exit 1;;
      r) rm $blackList; rm $whiteList; echo "Filtros eliminados"; exit 1;;
      d)
        date > $nameReport
        echo "--------------------------" >> $nameReport
        echo "Lista de filtros Incluidos" >> $nameReport
        echo ${incluidos[@]} >> $nameReport
        echo "" >> $nameReport
        echo "Lista de filtros excluidos" >> $nameReport
        echo ${excluidos[@]} >> $nameReport
        echo "--------------------------" >> $nameReport
        echo "" >> $nameReport
        Filters
        BucleCommands | tee -a $nameReport
        ;;
      h) Help ; exit 1;;
    #   : ) echo "Invalid Option: -$OPTARG requires an argument" 1>&2 ;;
      \?) echo "Invalid Option: -$OPTARG" 1>&2 ; Help ; exit 1 ;;


      esac
    done
	shift $((OPTIND-1))

Filters
BucleCommands
