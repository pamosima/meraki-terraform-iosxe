# Terraform Automation for Cisco Catalyst Switches via Meraki and IOS XE Providers

This repository contains Terraform configurations for retrieving Cisco Catalyst switches from the Meraki Dashboard using the Meraki provider and for managing these devices with the IOS XE provider. The project streamlines the process of network provisioning and configuration, harnessing the power of Infrastructure as Code (IaC) to automate these tasks through Terraform.

## Use Case Description

The Terraform configurations in this project enable network administrators to automate the provisioning and configuration of Cisco Catalyst switches. By integrating with the Meraki Dashboard through the Meraki provider and configuring the switches using the IOS XE provider, this project streamlines network management and ensures consistent infrastructure deployment.

![Get Catalyst Switches from Meraki Dashboard with Terraform](img/MerakiTerraformDemo.gif)

## Installation

To install and configure the project:

1. Clone the repository:

   ```
   git clone https://github.com/pamosima/meraki-terraform-iosxe.git
   ```

2. Navigate to the repository directory:

   ```
   cd meraki-terraform-iosxe
   ```

3. Initialize Terraform to download the necessary providers:

   ```
   terraform init
   ```

4. Create a bash script named `setup_env.sh` with the following content to set up the environment variables for the Meraki API key and other Terraform variables:

   ```bash
   #!/bin/bash

   # This script sets up environment variables for Meraki API key and other Terraform variables

   export TF_VAR_device_password="your_device_password"
   export TF_VAR_organization_id="your_organization_id"
   export MERAKI_DASHBOARD_API_KEY="your_meraki_api_key"
   ```

   Replace `your_device_password`, `your_organization_id`, and `your_meraki_api_key` with your actual credentials.

5. Make the script executable:

   ```
   chmod +x setup_env.sh
   ```

6. Run the script to set the environment variables:

   ```
   source ./setup_env.sh
   ```

7. Plan the Terraform execution to review the changes that will be applied:

   ```
   terraform plan
   ```

8. Apply the Terraform configurations to your network devices:

   ```
   terraform apply
   ```

## Usage

The Terraform configurations are located in the `infra` directory. To use them:

1. Modify the Terraform variable file (`terraform.tfvars`) to match your network infrastructure requirements.

2. Run `terraform plan` and `terraform apply` to provision and configure your network devices.

The `modules` directory contains reusable Terraform modules for switchport and VLAN management that can be referenced in your main Terraform configurations.

## Main Terraform Configuration (`main.tf`)

The `main.tf` file in the `infra` directory is the entry point for the Terraform configuration. It includes the following key components:

- **Provider Declaration**: Specifies the required providers for Meraki and IOS XE. The Meraki provider is used to retrieve the list of Catalyst switches from the Meraki Dashboard, while the IOS XE provider is used to configure the switches.

- **Local Values**: Defines a set of local values to organize device information into a structured format. This includes lists of Catalyst switches with their respective names and URLs.

## Known issues

Currently, there are no known issues. Please report any bugs or problems using the GitHub Issues section.

## Getting help

If you encounter any issues or need assistance, please create an issue in the GitHub repository for support.

## Getting involved

Contributions to this project are welcome! Please refer to the [CONTRIBUTING](./CONTRIBUTING.md) guidelines for instructions on how to contribute.

## Author(s)

This project was written and is maintained by the following individuals:

- Patrick Mosimann <pamosima@cisco.com>