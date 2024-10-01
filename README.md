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
```

### Example
```bash
./validate-triggers-deployment.sh my-workload uat
```
This command will return a table with the commit, tag, and build status information for the selected workload.

### Output Example:
```bash
 REPO_NAME      | SHORT_SHA |  STATUS  |  REF_NAME
-------------------------------------------------
 my-workload    | abc123    | SUCCESS  |  v1.2.3
 my-workload    | def456    | SUCCESS  |  v1.2.4
```

## Requirements
- Access to a GCP project with workloads in GKE.
- Installed and authenticated gcloud command-line tool.
- Bash shell environment.

## Installation
1. Clone this repository.
2. Navigate to the project directory.
3. Make the script executable:
```bash
chmod +x validate-triggers-deployment.sh
```
## How It Works
The script uses the gcloud builds list command to retrieve information about the builds based on the provided workload and environment. It filters the results by date, workload name, and branch name, and formats the output in a readable table.

## Author
Francisco Chaná