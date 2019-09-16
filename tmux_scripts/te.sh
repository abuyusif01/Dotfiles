for ((i=1; i<=10; i++))
	do
	if [[ $(( $i % 2 )) == 0 ]]; then
		echo "even $i"
	else 
	echo "odd $i"
	fi
done
