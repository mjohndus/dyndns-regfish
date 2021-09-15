#!/bin/bash

#cron alle 20 min
#*/20 * * * * /usr/local/bin/regip4.sh

# --------------------------------------------------
FQDN=(domain.de. www.domain.de. mail.domain.de. email.domain.de. ftp.domain.de. server.domain.de.)
TOKEN=cfe5e079ec9c1bf56df0a9df65fe9d37
# --------------------------------------------------

dir=`dirname $0`
aip4=`curl -s 'http://dyndns.regfish.de/show_myip.php'`

function set_ip4 {
         echo "" > $dir/ip4
         /bin/chmod 600 $dir/ip4
         bip4=`cat $dir/ip4`
}

function update_ipv4 {
    for fq4 in "${FQDN[@]}"
        do cod=`curl -s 'https://dyndns.regfish.de/?fqdn='$fq4'&thisipv4=1&forcehost=0&authtype=secure&token='$TOKEN`
        done
        #echo $cod
    if [ "$cod" = "success|100|update succeeded!" -o "$cod" = "success|101|already up-to-date!" ];then
        echo $aip4 > $dir/ip4
    fi
}

if [ ! -f $dir/ip4 ];then
        set_ip4
else
        bip4=`cat $dir/ip4`
fi

if [ "$aip4" = "$bip4" ];then
    exit 0
else
    update_ipv4
fi
exit 0
