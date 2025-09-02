# AWS DevOps Sample: **EC2 Arcade** (Snake 🐍, Tic-Tac-Toe ❌⭕, 4096 🔢)

Deploy a tiny “arcade” to AWS EC2 using **Terraform**, **cloud-init**, **Nginx** (static hosting), and a small **Flask** `/api/health`.  
No ECR/ECS required — works great in lab environments (e.g., KodeKloud) where container registries aren’t available.

## ✨ What you’ll build
- **EC2 (Amazon Linux 2023)** in the default VPC
- **Security Group** allowing HTTP(80) + optional SSH(22)
- **Nginx** serving:
  - `/` – landing page with a search box + **Go** button (type “tic tac toe”, “4096”, or “snake”)
  - `/snake/` – HTML5 Snake (arrow keys / WASD)
  - `/ttt/` – Tic-Tac-Toe (2 players or unbeatable AI)
  - `/4096/` – 2048-style number puzzle up to 4096
- **Flask** app behind Nginx providing `/api/health`
- **cloud-init** writes all game files and config on first boot

---

```mermaid
flowchart LR
A[Browser] -->|HTTP :80 /, /snake, /ttt, /4096| N[Nginx on EC2]
N -->|static files| G[Games in /opt/arcade & /opt]
N -->|/api/health| F[Flask on 127.0.0.1:5000]

