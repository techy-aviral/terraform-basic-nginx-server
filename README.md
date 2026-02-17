# AWS Infrastructure Deployment using Terraform

## 📌 Overview

This project demonstrates the design and deployment of a production-style AWS infrastructure using Terraform (Infrastructure as Code).

The objective of this project was to build a complete networking and compute stack from scratch while applying modular architecture and variable-driven configuration.

The infrastructure provisions a custom VPC, networking components, an EC2 instance, and deploys Nginx as a web server accessible over the public internet.

---

## 🏗 Architecture Components

The following AWS resources are provisioned using Terraform:

* Custom Virtual Private Cloud (VPC)
* Public Subnet
* Internet Gateway (attached to VPC)
* Route Table and Route Table Association
* Security Group (allowing SSH and HTTP access)
* EC2 Instance
* Nginx Web Server installed via user data

---

## ⚙️ Terraform Design Principles

This project follows modular and production-style Terraform practices:

* Modular Terraform structure
* Use of `variables.tf` for configurable infrastructure
* Key-value variable definitions for dynamic resource creation
* Passing variables between modules
* Separation of infrastructure logic from authentication
* Clean provider configuration without hardcoded credentials

---

## 🌐 Network Flow

Traffic flow for HTTP access:

Browser → Internet → Internet Gateway → Route Table → Subnet → EC2 → Nginx

SSH access is controlled via Security Group rules.

---

## 🚀 How to Use

### 1️⃣ Prerequisites

* Terraform installed
* AWS CLI configured
* Valid AWS IAM credentials

Configure AWS credentials locally (do not hardcode in Terraform):

```
aws configure
```

Or set environment variables:

Mac/Linux:

```
export AWS_ACCESS_KEY_ID="your_key"
export AWS_SECRET_ACCESS_KEY="your_secret"
```

Windows PowerShell:

```
$env:AWS_ACCESS_KEY_ID="your_key"
$env:AWS_SECRET_ACCESS_KEY="your_secret"
```

---

### 2️⃣ Initialize Terraform

```
terraform init
```

---

### 3️⃣ Plan Infrastructure

```
terraform plan
```

---

### 4️⃣ Apply Infrastructure

```
terraform apply
```

After successful deployment, copy the EC2 public IP and access:

```
http://<public-ip>
```

You should see the Nginx welcome page.

---

## 🔐 Security Considerations

* No AWS credentials are stored in code
* Sensitive values are excluded via `.gitignore`
* SSH access should ideally be restricted to a specific IP range
* Terraform state files should not be committed
