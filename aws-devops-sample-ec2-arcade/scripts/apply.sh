#!/usr/bin/env bash
set -euo pipefail
cd infra/terraform
AWS_REGION="${AWS_REGION:-us-west-2}"
terraform init -input=false
terraform apply -auto-approve -input=false -var="aws_region=${AWS_REGION}"
echo
terraform output arcade_url
terraform output snake_url
terraform output ttt_url
terraform output g4096_url
