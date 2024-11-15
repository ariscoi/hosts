cat /etc/hosts | while read -r ip hostname _; do
    [[ $ip =~ ^#|^$ ]] && continue
    resolved_ip=$(nslookup $hostname | awk '/^Address: / {print $2}' | tail -n1)
    [[$resolved_ip != $ip ]] && echo "Bogus IP for $hostname in /etc/hosts!"
done
