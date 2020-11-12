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

thanks () {
    echo "      [i] Great, just type 'secureScripts' in a new terminal to source commands"
}

createMain () {
    sed "s|SECDIR|$PWD|g" main.sh.bk > main.sh
}

installSecures () {
    if [[ $(cat ~/.bashrc | grep -o main.sh) = "main.sh" ]]; then
        installedSecures="true"
        execSecuresNoinstalled
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
            echo "alias secureScripts='source $PWD/main.sh'" >> /home/$USER/.bashrc
            createMain
            installedSecures="true"
            thanks
            ;;
            Y) echo Yes
            echo "alias secureScripts='source $PWD/main.sh'" >> /home/$USER/.bashrc
            createMain
            installedSecures="true"
            thanks
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