#!/bin/bash
sm3_init() {
find ./newfile -type f | xargs gmssl dgst -sm3 ./newfile > ./sm3_init.log
}

sm3_check() {
find ./newfile -type f | xargs gmssl dgst -sm3 ./newfile > ./sm3_check.log
}

if [ ! -f ./sm3_init.log ];then
sm3_init
fi

sm3_check
diff ./sm3_init.log ./sm3_check.log > ./diff.log
Status=$?
if [ $Status = 0 ];then
echo "Integrity is ok."
exit
else
echo "Integrity is broken!"
fi
