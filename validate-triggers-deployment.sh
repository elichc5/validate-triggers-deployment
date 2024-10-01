#!/bin/bash
#
# Validate Workloads commits and tags in GKE
# Author: Francisco Chaná

#######################################
# Print a message in a given color.
# Arguments:
#   Color. eg: green, red
#######################################
function print_color(){
    NC='\033[0m'

    case $1 in
        "green") COLOR='\033[0;32m' ;;
        "Cyan") COLOR='\033[0;36m' ;;
    esac
    echo -e "${COLOR}$2${NC}"
}
#######################################
# Example of use
# ./validate-triggers-deployment.sh <workload> <environment>
if [ "$#" -ne 2 ]; then
    print_color "green" "Uso: ./$0 <workload> <environment>"
    print_color "Cyan" "Ejemplo: ./$0 kdc-web uat"
    exit 1
fi
#######################################
# Capture arguments 
workload=$1
environment=$2
#######################################
# Use command of gcloud
gcloud builds list --project=PROJECT_ID --region=global --format="table(substitutions.REPO_NAME,substitutions.SHORT_SHA,status,substitutions.REF_NAME)" --filter="createTime>=2024-01-28 AND status:SUCCESS AND substitutions.REPO_NAME:$workload AND substitutions._BRANCH_NAME:$environment" --limit=5 --page-size=1000 > result.txt 2>&1 &&

cat result.txt