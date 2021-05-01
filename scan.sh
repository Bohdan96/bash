
#!/bin/bash
menu() {
        echo "-=-=-=-=-=-=-=-=-=-=-=-scan by Kanarskyi Bohdan-=-=-=-=-=-=-=-=-=-=-=-"
        echo "Usage: scan [OPTIONS]"
        echo "OPTIONS:"
        echo "   --all, -a:"
        echo "         Displays the IP addresses of all hosts in the current subnet"
        echo "   --target, -t [IP] [PORT]:"
        echo "         Displays a list of open system TCP ports"
}

##################function fot scan port##################
scan_port() {
        echo "-------------------Scanning port---------------------"
        echo
        ip=$2
        port=$3
        nc -nvz $ip $port
        echo
        echo "-----------------------DONE--------------------------"
}
##########################################################

##################function for show ip####################
show_ip() {
        echo "-----------------------------------------------------"
        echo "             This server has next ip:          "
        ip -4 a | grep inet | cut -f1 | awk '{print $2}' | cut -f1,2,3
        echo "-----------------------------------------------------"
}
##########################################################

if [ -n "$1" ]
then
case "$1" in
-a) show_ip $* ;;
--all) show_ip $* ;;
-t) scan_port $* ;;
--target) scan_port $* ;;
*) menu ;;
esac
shift
else menu
fi
