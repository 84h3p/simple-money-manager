DIR="data/"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Loading ${DIR}..."
else
  mkdir data/
  echo "Creating ${DIR}"
fi

add_a_thing () {
	clear
	echo "Write a name:"
	read name_expense
	echo "Write a cost:"
	read cost
	time=`(date)`
	echo "$name_expense for $cost roubles from $time" >> data/moneylist
	clear
	echo -e "\033[32m$name_expense\033[0m was succefully added to the list"
}

show_a_list () {
	clear
	counter=0
	while read y
	do 
		counter=`expr $counter + 1`
		echo "$counter | $y"
	done < data/moneylist
}

remove_a_thing () {
	clear
	show_a_list
	echo "Type a line to remove: "
	read number_line
	sed -i "${number_line}d" data/moneylist
	echo -e "Successfully \033[31mdeleted\033[0m"
}

clear

echo -e "
Choose what do you want: \n
-------------------------------------\n
1) Add a thing \n
2) Show a list \n
3) Remove a thing \n
"

read choice

case "$choice" in
	"1"	) add_a_thing;;
	"2"	) show_a_list;;
	"3"	) remove_a_thing;;
	"4"	) calculate;;
esac
