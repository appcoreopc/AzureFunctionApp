az group create --name myResourceGroup --location australiaeast

az storage account create --name devtestappstore --location australiaeast --resource-group myResourceGroup --sku Standard_LRS

az functionapp create --resource-group myResourceGroup --consumption-plan-location australiaeast \
--name ClaimSubmissionFunction --storage-account  devtestappstore --runtime dotnet

To Deploy 

func azure functionapp publish ClaimSubmissionFunction

func azure functionapp publish ClaimSubmissionFunction --publish-local-settings 


To test it out 


curl -d '{"Id":"value1", "Name":"value2"}' -H "Content-Type: application/json" -X POST https://claimsubmissionfunction.azurewebsites.net/api/ClaimSubmissionFunction

