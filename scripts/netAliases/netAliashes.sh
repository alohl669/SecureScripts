#!/bin/bash
# VARIABLES
clientTarget=""
ipTarget=127.0.0.1
ttl=0
workFolder=""
allPortsFile="allPorts.txt"

# FUCIONES
CliTrgt () {
    # Pregunta nombre del objetivo
    echo -n "Cliente/Target: "
    read clientTarget
    echo ""
}

MakeTree () {
    # Crea el arbol de directorios de trabajo, 
    # despues vuelve al la raiz del modulo
    mkdir $clientTarget/
    cd $clientTarget
    workFolder=$(pwd)
    mkdir {nmap,content,scripts,tmp,exploits}
    echo "[*] Creando arbol cliente..."
    echo ""
    echo "  [*]Carpeta de Trabajo: $workFolder"
    echo ""
    ls -lh
    cd ../
    echo ""
}

MuestraPasarela () {
    # Muestra la pasarela a la que estamos conectados
    route -n
    echo ""
}

IpTrgt () {
    # Pregunta IP objetivo
    echo -n "IP/Dominio: "
    read ipTarget
    echo ""
}

PingBase () {
    # hace ping y captura ttl para futura identificación de OS
    ping -c 1 $ipTarget | grep ttl
    # ping -c 1 $ipTarget -R
    echo ""
}

MapeoPuertos () {
    # Lanza nmap para el primer analisis
    local speed
    echo -n "Velocidad/Intrusividad{0,5}: "
    read speed
    echo ""
    echo "[*] Escaneando..."
    echo ""
    nmap $ipTarget -p- --open -T$speed -v -n -oG $workFolder/nmap/$allPortsFile
    # -p- Todos
    #  --open Filtro
    # -T5 {0,5} - Velocidad/Intrusividad
    # -v Verbose
    # -n Ignora DNS
    # -oG <fichero> exporta fichero legible por grep
    echo ""
    echo "  [*] GUARDADO: $workFolder/nmap/$allPortsFile"
    echo ""
}

NmapReport () {
    # Muestra el contenido de allPorts.txt
    echo "[*] Mostrando $allPortsFile"
    echo ""
    cat $workFolder/nmap/$allPortsFile
    echo ""
}

ExtractPorts () {
    # Extrae info relevante de allPorts.txt
    cat $workFolder/nmap/$allPortsFile | grep -oP '\d{0,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ','
    # -o solo muestra el filtro, no la linea
    # -oP '<regexp>' Filtro por regexp
    # # \d{min,max} longitud del digito
    # # /open es simplemente por como esta contruido allPorts.txt
    # awk '{print $1}' FS='/'
    # # Pinta solo el primer elemento, split /
    #  xargs TODO Para ejecución paralela?
    #  tr ' ' ',' sustitución de espacios por comas
    # # 
    # 
    echo ""
}

# EJECUCIÓN
clear

# captura de variables
CliTrgt
MakeTree

IpTrgt
MapeoPuertos
clear
NmapReport
ExtractPorts

# PingBase
# MuestraPasarela
