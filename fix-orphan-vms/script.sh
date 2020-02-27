#!/bin/bash

IFS=';'

datacenter=""
datastore=""
host=""

#Install govc (Utility for interacting with a licensed vCenter/ESXI server)
curl -L https://github.com/vmware/govmomi/releases/download/v0.22.1/govc_linux_amd64.gz | gunzip > /usr/local/bin/govc
chmod +x /usr/local/bin/govc

#VCenter Credentials (GOVC_URL can be a host or the vcenter server itself)
export GOVC_URL=""
export GOVC_USERNAME=""
export GOVC_PASSWORD=""
export GOVC_INSECURE=1

while read vm_name resource_pool folder vmx_path
do
  govc vm.unregister -dc="${datacenter}" "${name}"
  govc vm.register -folder="$(dirname ${folder})" -host="${host}" -name="${name}" -ds="${datastore}" -pool="${resource_pool}" "${vmx_path}"
  echo ""
done < input.csv