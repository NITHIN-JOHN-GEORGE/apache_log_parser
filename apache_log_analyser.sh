#! /usr/bin/env bash

Log_File=access.log

# In realtime give the complete path for access.log

# AUTHOR : NITHIN JOHN GEORGE

print_header()
{
printf "\n"
printf "#%.0s" $(seq 1  $(tput cols))
printf "\n"
printf "\n"
}

#function to center the specified message

centre()
{
message=$1
col=$(tput cols)
message_length=$(echo ${#1})
pre_space=$(($((col-message_length))/2))
print_header
printf " %.0s" $(seq 1 $pre_space)
printf "%s" "$1"
printf "\n"
print_header
}

most_visited_ips()
{

if [[ -e sorted_list.txt ]]
then
rm -rf sorted_list.txt &> /dev/null
touch sorted_list.txt
fi

cat $Log_File | grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c | sort -nr | head -n 20 | column -t >> sorted_list.txt

while read count ip

do

echo -e "IP_ADDRESS: $ip \nNO_OF_TIMES_ACCESSED: $count \n"

done < sorted_list.txt

}

centre "Welcome to Apache Log Parser : "

echo -e "How do you want to us this script ?? Select an option from below : \n"
echo -e "1) View request types GET/HEAD/POST/DELETE that are happening the most"
echo -e "2) View highest 20 requested unique base URLs"
echo -e "3) View the most common response codes your visitors are causing"
echo -e "4) Extract and count most visited 20 Unique Ip Address \n"

read -p "Enter the option : " opt

if [[ $opt -eq 1 ]]
then
       echo -e "\n"
       print_header
       cat $Log_File |awk '{print $6}' | grep -E "GET|POST|PUT|DELETE" |sort | uniq -c | sort -nr | tr -d '["]'
       print_header

elif [[ $opt -eq 2 ]]
then
       echo -e "\n"
       print_header
       cat access.log  |awk '{print $6 " " $7 }' | sort | uniq -c | sort -r | tr -d '["]' | sort -nr | head -n 20
       print_header

elif [[ $opt -eq 3 ]]
then
       echo -e "\n"
       print_header
       cat $Log_File |awk '{print $9}' | grep -E "200|206|301|302|400|401|404|500|502|503" | sort | uniq -c | sort -nr
       print_header

elif [[ $opt -eq 4 ]]
then
       echo -e "\n"
       print_header
       most_visited_ips
       print_header
else
       echo -e "\n Incorrect option . Enter a valid option\n"
       exit 3
fi
