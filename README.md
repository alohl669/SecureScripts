# secureScripts

secureScripts is a small set of tools for linux, designed to monitor some basic system functions and locate possible vulnerabilities. This set of tools is based on pentesting techniques for learning reasons

## Requirements
- nmap
- openSSL

## Install

```
git clone https://github.com/alohl669/secureScripts.git
. secureScripts/aliases.sh
```

## man Page

```
man ./secureScripts.1
```

### lssuid

List of files with SUID bit and GTFOBINS references

```
lssuid
```
### lssh

List *sh* scripts  

```
lssh
```

## lscap

Capabilities search engine

```
lscap
```

## showCommands
showCommands is a tool to discover the processes that go in and out of execution. This is useful for identifying vulnerabilities and/or malicious applications. One of its most useful examples is for discovering CRON processes. The tool has the ability to use exclusion and inclusion filters and the ability to add and remove them easily. If a more detailed edition is desired, the txt files that are created can be modified.

```
cd secureScripts/scripts/showCommands
```


**Usage:**  

```
        ./showCommands.sh [[-h] | [-b] | [-w] | [-a] | [-e] | [-r] | [-d]]
        ./showCommands.sh [-h]

        -b      See excluded filters 
        -w      See filters included 
        -a      Adds a filter to inclusion list. [showCommands.sh -a <filter>]
        -e      Adds a filter to exclusion list. [showCommands.sh -e <filter>]
        -r      Remove all filters
        -d      Document the output in a "report.txt" file
        -h      help  
```  


**Examples:** if we wanted to simply look for only those processes executed by CRON, we would simply need
```
./showCommands.sh -a CRON
./showCommands.sh
```


> The application is based on an infinite loop and as a consequence brings with it an excessive consumption of CPU, we will have to look for alternatives

## netAliases
Target recognition tools
```
cd secureScripts/scripts/netAliases && \
./netAliases.sh
```

**++TODO++:** Hay que ir pensando en volver a refactorizar, debe convertirse en herramientas que cargas, no en una aplicación que ejecutas  
**+TODO+** inducir alias en rc  