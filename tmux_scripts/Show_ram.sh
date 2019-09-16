# Script to show the free Ram available in your system
# here we're using the free buildin command
# If you want to use this. be freely to change the variable TOTAL_MEM to the size of your ram
# you can check your RAM size with the command <free> OR <free -m>
Total_Mem=3848
Mem_free=$(free -m | grep "Mem" | awk '{ print$3 }')
result=$(echo "scale=1; 100*($Mem_free)/$Total_Mem" | bc -l)
echo "$result%used"
