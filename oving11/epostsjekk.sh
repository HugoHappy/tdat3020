mx=$(nslookup -query=mx $1 | grep mail | grep -oE "[^ ]+$")

printf "\nMX name: \n$mx\n\n"

for ent in $mx; do
	entr=$(nslookup $ent)
	mxip=$(nslookup $ent | grep Address | tail -n +2 | cut -c 10-100)
	printf "$entr\n"
	printf "IP: $mxip\n"

	for ip in $mxip; do
		ripn=$(nslookup $ip | grep name)
		printf "Reverse: $ip : ${ripn##* }\n"
	done
done

#mxip=$(nslookup $mx | grep Address | tail -n +2 | cut -c 10-100)
#mycount=`echo $mxip | wc -w`

#printf "\nMX name: \n$mx\n\n"
#printf "IP(s): \n$mxip\n\n"

#printf "Reverse IP name(s):\n"

#for ip in $mxip; do
#	ripn=$(nslookup $ip | grep name)
#	printf "$ip : ${ripn##* }\n"
#done

printf "\n"

printf "SPF:\n"

spf=$(nslookup -type=txt $1 | grep v=spf1 | cut -d " " -f4-)

get_spf() { 
   dig +short txt "$1" | 
   tr ' ' '\n' |
   while read entry; do 
      case "$entry" in 
         ip4:*)  echo ${entry#*:} && echo ${entry#*:} | cut -f1 -d "/" | nslookup ;; 
	 ip6:*)  echo ${entry#*:} && echo ${entry#*:} | cut -f1 -d "/" | nslookup ;; 
         include:*) get_spf ${entry#*:} ;;
      esac
   done |
   sort -u
}

get_spf $1

