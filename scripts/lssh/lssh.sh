#!/bin/bash
# find / -iname "*.sh" 2>/dev/null
lssh () {
    shList=(`find / -iname "*.sh" -perm -o=w -type f 2>/dev/null`)
    let rootShList=0
    echo ""
    echo "  [*] List of *sh* scripts"
    echo "  [\$] find / -iname \"*.sh\" -perm -o=w -type f 2>/dev/null"
    echo ""
    echo "      [*] ${#shList[@]} matches"
    echo ""
    if [[ ${#shList[@]} -gt 0 ]]; then
        for((i=0;i<${#shList[@]};i++)); do
            ls -lah ${shList[i]} #| grep "root"
            if [[ $(stat --format %U ${shList[i]}) = "root" ]] || [[ $(stat --format %G ${shList[i]}) = "root" ]]; then
                let rootShList++
            fi
        done
        echo ""
        if [[ $rootShList -gt 0 ]]; then
            echo "  [*] ROOT scripts"
            echo "      [*] $rootShList root matches"
            echo ""
            for((l=0;l<${#shList[@]};l++)); do
                ls -lah ${shList[l]} | grep "root"
            done
        else
            echo "  [*] $rootShList ROOT scripts"
            echo "      [*] Everything ok"
            echo ""
        fi
        
    else
        echo "      [*] Everything ok"

        echo ""
    fi
}