# Terraform Project: Scalable Web Application on Azure  

This repository contains Terraform configurations for deploying a scalable web application on Microsoft Azure. The infrastructure uses best practices, including modularization and DRY (Don't Repeat Yourself) principles, to ensure scalability, maintainability, and ease of deployment across environments.

---

## Project Structure  

```plaintext
project-root/
├── modules/
│   ├── vm/               # Virtual Machine Scale Set module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── load-balancer/    # Load Balancer module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── nsg/              # Network Security Group module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── envs/
│   └── dev/              # Environment-specific configurations
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── backend.tf            # Remote backend configuration
├── provider.tf           # Azure provider configuration
└── variables.tf          # Global variables
```

---

## Features  

- **Modular Design**: Reusable modules for VM Scale Sets, Load Balancer, and Network Security Groups.  
- **Environment-Specific Configurations**: Separate configurations for `dev`, `staging`, and `prod` environments for better organization.  
- **Scalability**: Infrastructure supports scaling VM instances dynamically.  
- **Secure**: Network Security Group (NSG) to manage access rules.  

---

## Prerequisites  

1. **Tools**:  
   - [Terraform CLI](https://www.terraform.io/downloads.html)  
   - [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)  
2. **Azure Requirements**:  
   - An Azure subscription.  
   - A Resource Group for the backend storage.  
   - Terraform state backend setup (refer to `backend.tf`).  

---

## Getting Started  

1. **Clone the Repository**:  
   ```bash
   git clone https://github.com/ebubevick/Scalable-Web-Application-with-Auto-Scaling-on-Azure.git
   cd project-root/
   ```

2. **Set Up Terraform Backend**:  
   Ensure the backend storage is configured in Azure and matches the values in `backend.tf`.

3. **Initialize Terraform**:  
   Run the following command to download provider plugins and set up the backend:  
   ```bash
   terraform init
   ```

4. **Validate Configuration**:  
   Check the syntax of the configuration files:  
   ```bash
   terraform validate
   ```

5. **Plan Deployment**:  
   Generate an execution plan to preview changes:  
   ```bash
   terraform plan 
   ```

6. **Apply Configuration**:  
   Deploy the infrastructure:  
   ```bash
   terraform apply
   ```

---

## Modules  

### 1. **VM Scale Set (`modules/vm/`)**  
Deploys a Virtual Machine Scale Set to host the web application.  
- **Inputs**: VM count, admin credentials, etc.  
- **Outputs**: VM Scale Set ID.  

### 2. **Load Balancer (`modules/load-balancer/`)**  
Sets up a Load Balancer for traffic distribution.  
- **Inputs**: Resource Group Name, Location.  
- **Outputs**: Load Balancer ID.  

### 3. **Network Security Group (`modules/nsg/`)**  
Creates an NSG to secure the infrastructure.  
- **Inputs**: Resource Group Name, Location.  
- **Outputs**: NSG ID.  

---

## Environment Configurations  

- **Directory**: `envs/`  
- **Example (`dev`)**:  
  - `main.tf`: Specifies module usage for the `dev` environment.  
  - `terraform.tfvars`: Contains environment-specific variable values (e.g., resource group name, admin credentials).  

---

## Clean Up  

To destroy the deployed infrastructure, run:  
```bash
terraform destroy -var-file=envs/dev/terraform.tfvars
```

---

## Notes  

- Follow the `terraform.tfvars` format for other environments like `staging` and `prod`.  
- Ensure sensitive values (e.g., passwords) are securely stored using tools like HashiCorp Vault or Azure Key Vault.  

---

## Support  

For any questions or issues, reach out via [LinkedIn](https://linkedin.com/in/ebubevick).