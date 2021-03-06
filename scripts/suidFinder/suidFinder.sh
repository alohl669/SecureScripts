#!/bin/bash
echo ""
echo "---------------------------"
echo "-       suidFinder        -"
echo "---------------------------"
echo ""
find / -perm -u=s -type f 2>/dev/null
echo ""
echo "---------------------------"
echo "Visit the following link to check the possible vulnerabilities"
echo "https://gtfobins.github.io/#+suid"
echo ""
echo " \"Why is it dangerous?\" "
echo "https://www.hackingarticles.in/linux-privilege-escalation-using-suid-binaries/"
echo "---------------------------"
echo ""