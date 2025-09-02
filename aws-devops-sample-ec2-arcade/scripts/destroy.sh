#!/usr/bin/env bash
set -euo pipefail
cd infra/terraform
terraform destroy -auto-approve
