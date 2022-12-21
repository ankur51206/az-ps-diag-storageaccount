#!/bin/bash -e

# Add your diag setting name here..
laws='diag'

delete() {
echo "Deleting Diagnostic settings from this Resource ID..."
echo $1
az monitor diagnostic-settings delete --resource "$1" --name $laws > /dev/null
az monitor diagnostic-settings delete --resource "$1/blobServices/default" --name $laws > /dev/null
az monitor diagnostic-settings delete --resource "$1/tableServices/default" --name $laws > /dev/null
az monitor diagnostic-settings delete --resource "$1/queueServices/default" --name $laws > /dev/null
az monitor diagnostic-settings delete --resource "$1/fileServices/default" --name $laws > /dev/null
echo "-----DELETED------"
}

file=`cat file.txt`
for i in $file;
do
  delete $i
done
