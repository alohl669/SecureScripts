#!/bin/bash
# 
locationSecures="false"
installedSecures="false"
installAnswer="n"
checkLocation () {
    locationSecures="false"
    if [[ $(stat --format %n ./secureScripts.sh 2>/dev/null) = "./secureScripts.sh" ]]; then
        locationSecures="true"
    else
        locationSecures="false"
    fi
}

execSecuresNoinstalled () {
    echo ""
    echo "  [*] secureScripts"
    echo "      [*] lssuid"
    echo "      [*] lssh"
    echo "      [*] lscap"
    echo ""
    . $PWD/scripts/lssuid/lssuid.sh
    . $PWD/scripts/lssh/lssh.sh
    . $PWD/scripts/lscap/lscap.sh
}

createMain () {
    
}

installSecures () {
    if [[ $(cat ~/.bashrc | grep -o secureScripts.sh) = "secureScripts.sh" ]]; then
        installedSecures="true"
    else
        echo ""
        echo "  [*] secureScripts"
        echo "      [i] secureScripts is a set of tools that are loaded as an alias. To speed up the process we recommend creating an entry in your .bashrc file"
        echo -n "      [?] want to create the entry now?[Y/n]: "
        read installAnswer
        if [[ $installAnswer = '' ]]; then
            installAnswer='Y'
        fi
        
        case $installAnswer in
            n) 
            echo ""
            echo "  [i] Maybe next time"
            echo ""
            installedSecures="false"
            execSecuresNoinstalled
            ;;
            no) 
            echo ""
            echo "  [i] Maybe next time"
            echo ""
            installedSecures="false"
            execSecuresNoinstalled
            ;;
            N) 
            echo ""
            echo "  [i] Maybe next time"
            echo ""
            installedSecures="false"
            execSecuresNoinstalled
            ;;
            NO) 
            echo ""
            echo "  [i] Maybe next time"
            echo ""
            installedSecures="false"
            execSecuresNoinstalled
            ;;
            y) echo Yes
            echo "alias secureScripts='. $PWD/secureScripts.sh'" >> /home/$USER/test.txt
            installedSecures="true"
            ;;
            Y) echo Yes
            echo "alias secureScripts='. $PWD/secureScripts.sh'" >> /home/$USER/test.txt
            installedSecures="true"
            ;;
            *) 
            echo ""
            echo "  [*] Maybe next time"
            echo ""
            installedSecures="false"
            execSecuresNoinstalled
            ;;
        esac
        echo ""
    fi
}

checkLocation
if [[ $locationSecures = "true" ]]; then
    installSecures
    # if [[  ]]; then
    # else
    # fi
else
    echo "You are not in the secureScripts directory"
fi