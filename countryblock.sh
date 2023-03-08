#!/bin/bash
#Script to process ip ranges to ban using IPSet and IPTables
ipset create countryblock hash:net
while read line; do ipset add countryblock $line; done < $1
iptables -I INPUT -m set --match-set countryblock src -j DROP
