#!/bin/bash
set -e

echo "🚀 Starting Deployment..."

# Step 1: Terraform
echo "👉 Running Terraform..."
cd terraform || exit

terraform init
terraform apply -auto-approve

cd ..

# Step 2: Generate Inventory
echo "👉 Generating Ansible Inventory..."
python3 scripts/generate_inventory.py

# Step 3: Wait for VM to be ready
echo "⏳ Waiting for VM to be ready..."
sleep 30

# Step 4: Run Ansible
echo "👉 Running Ansible Playbook..."
cd ansible || exit

ansible all -m ping
ansible-playbook playbook.yml

echo "✅ Deployment Completed!"
