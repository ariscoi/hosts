while read -r line; do
   ip=$(echo "$line" | awk '{print $1}')
   if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
       echo "Valid IP: $ip"
   else
       echo "Invalid IP: $ip"
   fi
done < /etc/hosts
