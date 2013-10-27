#!/bin/bash
iptables -F

iptables -P INPUT DROP
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

iptables -A INPUT -i lo -p all -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport SSH -j ACCEPT
iptables -A INPUT -p udp --dport OVPN -j ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables-save > /etc/iptables.rules

################################################################

ip6tables -F

ip6tables -P INPUT DROP
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT

ip6tables -A INPUT -p icmpv6 -j ACCEPT

ip6tables -A INPUT -i lo -p all -j ACCEPT
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
ip6tables -A INPUT -p tcp --dport SSH -j ACCEPT
ip6tables -A INPUT -p udp --dport OVPN -j ACCEPT

ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

ip6tables-save > /etc/ip6tables.rules