func azure functionapp publish appfunc

az functionapp deployment source config-zip  -g myResourceGroup -n \
<app_name> --src <zip_file_path>