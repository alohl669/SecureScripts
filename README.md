# SecureScripts

SecureScripts is a small set of tools designed to monitor some basic system functions and locate possible vulnerabilities. This set of tools is based on pentesting techniques for learning reasons

## showCommands

```
Usage:  ./showCommands.sh [[-h] | [-b] | [-w] | [-a] | [-e] | [-r]] 
        ./showCommands.sh [-h]
Description: showCommands is a tool to discover the processes that go in 
and out of execution. This is useful for identifying vulnerabilities and/or 
malicious applications. One of its most useful examples is for discovering 
CRON processes. The tool has the ability to use exclusion and inclusion 
filters and the ability to add and remove them easily. If a more detailed 
edition is desired, the txt files that are created can be modified.

        -b      See excluded filters 
        -w      See filters included 
        -a      Adds a filter to inclusion list. [showCommands.sh -a <filtro>]
        -e      Adds a filter to exclusion list. [showCommands.sh -e <filtro>]
        -r      Remove all filters
        -h      help 

Examples: if we wanted to simply look for only those processes executed by CRON, we would simply need
./showCommands.sh -a CRON
./showCommands.sh

```