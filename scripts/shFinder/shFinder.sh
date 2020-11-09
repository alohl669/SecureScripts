#!/bin/bash
# find / -iname "*.sh" 2>/dev/null
shList=(`find / -iname "*.sh" -perm -o=w -type f 2>/dev/null`)
echo ""
echo "---------------------------"
echo "-        shFinder         -"
echo "---------------------------"
echo ""
echo "${#shList[@]} matches"
if [[ ${#shList[@]} -gt 0 ]]; then
    for((i=0;i<${#shList[@]};i++)); do
        ls -lah ${shList[i]} | grep "root"
    done
    echo "---------------------------"
    echo ""
else
    echo "everything ok"
    echo "---------------------------"
    echo ""
fi