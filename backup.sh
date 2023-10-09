if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
echo "targetDirectory:$targetDirectory"
echo "destinationDirectory:$destinationDirectory"

# [TASK 3]
currentTS=$(date +%s)

# [TASK 4]
backupFileName="backup-[$currentTS].tar.gz"

# [TASK 5]
origAbsPath=`pwd`

# [TASK 6]
cd $destinationDirectory # <- 
destDirAbsPath=`pwd`

# [TASK 7]
cd $origAbsPath # <-
cd $targetDirectory # <-

# [TASK 8]
yesterdayTS=$(($currentTS - 24 *60*60))

declare -a toBackup

# [TASK 9]
for file in $(ls) 
do
  # [TASK 10]
  if ((`date -r $file +%s` > $yesterdayTS))
  then
   toBackup+=($file) # [TASK 11]
  fi
done

# [TASK 12]
tar -czvf $backupFileName ${toBackup[@]}
# [TASK 13]
mv $backupFileName $destAbsPath 
# Congratulations! You completed the final project for this course!
