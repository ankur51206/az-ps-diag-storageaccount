#!/bin/bash -e
laws='diag'

delete() {
echo $1
az monitor diagnostic-settings delete --resource "$1" --name $laws > /dev/null
az monitor diagnostic-settings delete --resource "$1/blobServices/default" --name $laws > /dev/null
echo "---"
}

file=`cat file.txt`
for i in $file;
do
  delete $i
done
