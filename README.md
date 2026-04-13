# 🚀 Azure DevOps Project

## 📌 Flow
Control VM → Terraform → Target VM → Ansible → Install Nginx + MongoDB

## ⚙️ Steps

cd terraform
terraform init
terraform apply

cd ..
python3 scripts/generate_inventory.py

cd ansible
ansible-playbook playbook.yml

## ✅ Output
- Azure VM created (Central India, Zone 2)
- All ports open (NSG)
- Nginx running
- MongoDB running
