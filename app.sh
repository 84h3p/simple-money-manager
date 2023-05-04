GREEN="\e[32"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"

add_a_thing () {
	clear
	echo "Write a name:"
	read name_spent
	echo "Write a cost:"
	read cost
	time=`(date)`
	echo "$name_spent for $cost roubles from $time" >> data/moneylist
	clear
	echo "${BOLDGREEN}$name_spent${ENDCOLOR} was succefully added to the list"
}

show_a_list () {
	clear
	counter=0
	while read y
	do 
		counter=`expr $counter + 1`
		echo "$counter $y"
	done < data/moneylist
}

remove_a_thing () {
	clear
	show_a_list
	echo "Type a line to remove: "
	read number_line
#не работает пока что	sed -i "/${number_line}/d" moneylist
}

clear

echo "
Choose what do you want: \n
-------------------------------------\n
1) Add a thing
2) Show a list
3) Remove a thing
"

read choice

case "$choice" in
	"1"	) add_a_thing;;
	"2"	) show_a_list;;
	"3"	) remove_a_thing;;
esac

#todo
#общий подсчет за месяц
#удаление выбранной строчки в файле
#общее количество денег
