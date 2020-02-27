# Fix Orphan VM's

#### Description:

This bash script loops through a list of orphan VM's obtained by querying the vPostgres database of vCenter, unregisters them and then re-registers them in the same resource pool, folder and with the original name. The interaction is handled by a CLI utility called govc. This script is useful for when a large number of VM's have become orphaned and are still present on the datastore, particularly when the datastore folder for storing the VM does not necessarily match that of the VM name. An alternative option is to manually cold migrate the VM's to another host - sometimes this is not available(greyed out), which is when this script is likely the "next best thing".

#### Usage:

- Run the query in postgres.sql against your vCenter database. I use HeidiSQL. On a windows install, the database credentials can be found in "C:\ProgramData\VMware\vCenterServer\cfg\vmware-vpx\vcdb.properties".
- Export the results to a delimeted text file (like csv) using ; as delimeter (use filename input.csv)
- Clean the data if needed. I normally strip out the datastore portion of the vmx file path by doing a search and replace in a text editor or a CLI utility like awk.
- Save the file next to the script.sh file
- Do a "chmod +x" on the script.sh file
- Execute the script (you may want to modify the script by adding "echo" in front of the govc commands to do a dry-run)

