#!/bin/bash
# find / -iname "*.sh" 2>/dev/null
shList=(`find / -iname "*.sh" -perm -o=w -type f 2>/dev/null`)
echo "${#shList[@]} matches"
if [[ ${#shList[@]} -gt 0 ]]; then
    for((i=0;i<${#shList[@]};i++)); do
        ls -lah ${shList[i]} | grep "root"
    done
else
    echo "everything ok"
fi

# declare -a userList
# passwdList=($(cat -T /etc/passwd | tr " " "*"))
# # echo ${passwdList[@]}
# for((i=0;i<${#passwdList[@]};i++)); do
#     IFS=':'
#     read -a usrLst <<< "${passwdList[i]}"
#     userList+=(${usrLst[0]})
# done




# echo "usuarios: ${userList[@]}"
