#!/bin/bash
function Help () {
    cat doc/help.txt
}
function Filters () {
    # comprobamos que $blackList tiene contenido y a raiz de ello constuimos el filtro
    if [[ $(wc -l $blackList | awk '{ print $1 }') -gt 0 ]]; then
         # Construimos el filtro desde el fichero
        filtroExcluidos="grep -v"
        for((i=0;i<${#excluidos[@]};i++)); do
            filtroExcluidos+=" -e \"${excluidos[i]}\""
        done
        boolFiltroExcluidos=true
    else
        boolFiltroExcluidos=false
    fi
    
    if [[ $(wc -l $whiteList | awk '{ print $1 }') -gt 0 ]]; then
        filtroIncluidos="grep"
        for((i=0;i<${#incluidos[@]};i++)); do
            filtroIncluidos+=" -e \"${incluidos[i]}\""
        done
        boolFiltroIncluidos=true
    else
        boolFiltroIncluidos=false
    fi
    
    
}

function BucleCommands () {
	# Creamos un bucle infito que revise los comandos
		if [[ $boolFiltroExcluidos = false && $boolFiltroIncluidos = false ]]; then
            while true; do
                cronTasksNew=$(ps -eo command)
                diff <(echo "$cronTasks") <(echo "$cronTasksNew") | grep "[\>\<]"
                cronTasks=$cronTasksNew
            done
        elif [[ $boolFiltroExcluidos = true && $boolFiltroIncluidos = false ]]; then
            while true; do
                cronTasksNew=$(ps -eo command)
                diff <(echo "$cronTasks") <(echo "$cronTasksNew") | eval $filtroExcluidos | grep "[\>\<]"
                cronTasks=$cronTasksNew
            done
        elif [[ $boolFiltroExcluidos = false && $boolFiltroIncluidos = true ]]; then
            while true; do
                cronTasksNew=$(ps -eo command)
                diff <(echo "$cronTasks") <(echo "$cronTasksNew") | eval $filtroIncluidos | grep "[\>\<]"
                cronTasks=$cronTasksNew
            done
        else
            while true; do
                cronTasksNew=$(ps -eo command)
                diff <(echo "$cronTasks") <(echo "$cronTasksNew") | eval $filtroExcluidos | eval $filtroIncluidos | grep "[\>\<]"
                cronTasks=$cronTasksNew
            done
        fi
}