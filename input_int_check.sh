#!/bin/bash

sm3_input() {
echo "Input: "
read MESSAGE
echo "$MESSAGE" >> ./newfile
echo "$MESSAGE" > message.log
gmssl dgst -sm3 message.log > ./sm3_input.log
}

sm3_check() {
LAST_MESSAGE=$(tail -n 1 newfile)
echo "$LAST_MESSAGE" > message.log
gmssl dgst -sm3 message.log > ./sm3_check.log
}

# if [ ! -f ./sm3_input.log ];then
# sm3_input
# fi

sm3_input
sm3_check
diff ./sm3_input.log ./sm3_check.log > ./diff.log
Status=$?
if [ $Status = 0 ];then
echo "Integrity is ok."
exit
else
echo "Integrity is broken!"
fi
