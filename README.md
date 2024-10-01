# Validate Workloads Commits and Tags in GKE

This project provides a Bash script to validate the commits and tags of workloads in GKE (Google Kubernetes Engine) by comparing `prd` and `uat` environments. The script simplifies and speeds up the deployment validation process, reducing manual tasks performed in the GCP console.

## Features
- Validates and compares workload versions between production `prd`, `uat`, `dev` or other environments.
- Displays commit and tag information in a tabular format.
- Automates the extraction of data using the `gcloud` command, minimizing human error.

## Usage
The script requires two arguments:
1. **Workload name**: The GKE workload you want to validate.
2. **Environment**: The environment in which the validation will be performed (e.g., `uat`, `prd`).

### Command Example:
```bash
./validate-triggers-deployment.sh <workload> <environment>
