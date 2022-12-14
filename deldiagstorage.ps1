param(
    # name of Diagnostic settings
    $laws = "lawsnamehere",
    [switch]$set
)

foreach ($resourceID in Get-Content .\storageacc.csv) {
    az monitor diagnostic-settings delete --resource $resourceID --name $laws
    az monitor diagnostic-settings delete --resource "$resourceID/blobServices/default" --name $laws
    az monitor diagnostic-settings delete --resource "$resourceID/tableServices/default" --name $laws
    az monitor diagnostic-settings delete --resource "$resourceID/queueServices/default" --name $laws
    az monitor diagnostic-settings delete --resource "$resourceID/fileServices/default" --name $laws
}

