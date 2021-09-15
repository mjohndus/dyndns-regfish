# dyndns-regfish

Shell script to Register your IP address with Regfish DynDNS

### for Dokumentation see:

cod=`curl -s 'https://dyndns.regfish.de/?fqdn='$fq4'&thisipv4=1&forcehost=0&authtype=secure&token='$TOKEN`

[Regfish DynDNS Dokumentation](https://www.regfish.de/domains/dyndns/dokumentation)
