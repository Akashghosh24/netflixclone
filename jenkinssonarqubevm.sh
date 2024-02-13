#This Script will create a linux VM where you can further install Jenkins+Sonarqube
#!/bin/bash

SUBSCRIPTION="z10-ps-dev"
VM_SIZE="standard_b2ms"
VM_NAME="Jenkinsonarqube"
VM_IMAGE="Ubuntu2204"
RESOURCE_GROUP_NAME="rg-test-akash"
LOCATION="East US"
ADMIN_USERNAME="adminuser"
ADMIN_PASS="Admin@123456"
AUTHENTICATION_TYPE="password"




az login
az account set --subscription $SUBSCRIPTION


az vm create \
  --resource-group $RESOURCE_GROUP_NAME \
  --size $VM_SIZE \
  --name $VM_NAME \
  --image $VM_IMAGE \
  --authentication-type $AUTHENTICATION_TYPE \
  --admin-username $ADMIN_USERNAME \
  --admin-password $ADMIN_PASS \
  --public-ip-sku Standard 
  


#Opens Port 8080 for communication
az vm open-port -g $RESOURCE_GROUP_NAME -n $VM_NAME --port 8080


