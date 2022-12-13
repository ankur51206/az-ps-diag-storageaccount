param(
    # Add Resource ID below if you dont want to add multiple database at a time
    #  $resourceID = "", 
    $diagNameLaws = "ankurdiaglaws",
    # Add your log analytics workspace NAME OR ID here at below
    $laws = "samplelaws",
    [switch]$set
)

foreach ($resourceID in Get-Content .\filesa.txt) {
    $storage_types = "blobServices", "tableServices", "queueServices", "fileServices"
    foreach ($type in $storage_types) {
        az monitor diagnostic-settings delete --resource "$resourceID/$type/default" -n $diagNameLaws --workspace $laws
    }
}
