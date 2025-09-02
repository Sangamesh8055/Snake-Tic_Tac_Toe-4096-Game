# EC2 Arcade: Landing + Snake (/snake/) + Tic‑Tac‑Toe (/ttt/) + 4096 (/4096/)

- Landing page at `/` with a **Go** search box: type "tic tac toe", "4096", or "snake" to navigate.
- Nginx serves static games; Flask provides `/api/health`. No ECR/ECS needed.

## Run
```bash
unzip aws-devops-sample-ec2-arcade.zip
cd aws-devops-sample-ec2-arcade
export AWS_REGION=us-west-2              # or your lab region
./scripts/apply.sh
terraform -chdir=infra/terraform output arcade_url
# open arcade URL; try typing: tic tac toe → Go, or 4096 → Go
```
Cleanup:
```bash
./scripts/destroy.sh
```

## Modify games
Edit `infra/terraform/userdata.yaml` under the `write_files:` entries, then:
```bash
terraform -chdir=infra/terraform apply -auto-approve -replace=aws_instance.web
```
