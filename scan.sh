#!/bin/bash
menu () {
        echo "scan by Kanarskyi Bohdan"
        echo "Usage: scan [OPTIONS]"
        echo "OPTIONS:"
        echo "--all, -a:"
        echo "     Displays the IP addresses of all hosts in the current subnet"
        echo "--target, -t [IP] [PORT]:"
        echo "     Displays a list of open system TCP ports"
}
port_scan () {
        if [ "$1" == '' ]
        then
        echo "Wait while ports are scanned..."
        `nc -nvz $1 22` #> $2.txt 2>&1
        else
        echo "Error: Incorrect command syntax"
        echo "Use: ./scan.sh -t [IP] [PORT]"
        fi
        #tac $2.txt
        #rm -rf $2.txt
}
if [ -n "$1" ]
then
case "$1" in
-a) echo `ip a` ;;
--all) echo `ip a` ;;
-t) port_scan ;;
--target) port_scan ;;
*) menu ;;
esac
shift
else menu
fi
