#!/bin/bash
function read_dir(){
for file in `ls $1` #注意此处这是两个反引号，表示运行系统命令
do
 if [ -d $1"/"$file ] #注意此处之间一定要加上空格，否则会报错
 then
   sudo docker pull ccr.ccs.tencentyun.com/zhangyang_doker/$file":main"
   tximagename="ccr.ccs.tencentyun.com/zhangyang_doker/"$file":main"
   read_dir $1"/"$file
 else
   dockerfile=`cat $1"/"$file | tr "\t" " " | tr -s " " | cut -d " " -f 2`
   dockerfile=${dockerfile%@*}":latest"
   sudo docker tag $tximagename  $dockerfile
   sudo docker rmi $tximagename 
   # echo echo ${dockerfile%@*}":latest"
# echo $1"/"$file #在此处处理文件即可
 fi
done
} 
read_dir $1
