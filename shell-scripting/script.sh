name = "Fahim Ahammed Firoz"
age = 26

echo "My name is $name and age is $age"

a=10
b=5
echo $((a+b))
echo $((a*b))

if [ $a -gt $b ]; then
  echo "a is greater"
elif [ $a -lt $b ]; then
  echo "b is greater"
else
  echo "Equal"
fi

read -p "Enter a number: " num
case $num in
  1) echo "One";;
  2) echo "Two";;
  *) echo "Other";;
esac

for i in {1..5}; do
  echo "Number $i"
done

sum() {
  echo $(($1 + $2))
}
result=$(sum 5 10)
echo $result   # 15


