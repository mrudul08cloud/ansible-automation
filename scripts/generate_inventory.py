import json

with open("terraform/terraform.tfstate") as f:
    data = json.load(f)

for res in data["resources"]:
    if res["type"] == "azurerm_public_ip":
        ip = res["instances"][0]["attributes"]["ip_address"]

with open("ansible/inventory.ini", "w") as inv:
    inv.write(f"[web]\n{ip} ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa\n")
