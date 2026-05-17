# Anote Shared Dev Environment

A shared EC2 instance where any Anote team member can SSH in and immediately access all product repos — no local dependencies needed.

## How to SSH In

```bash
ssh anote@<EC2_PUBLIC_IP>
# Password: (set by admin on first launch — ask Natan)
```

All repos live in `/home/anote/repos/`. Each repo has its own `docker-compose.yml` or virtual environment ready to go.

## Launching a New EC2 Instance (Admin Steps)

### Option A — AWS Console (Manual)

1. **EC2 → Launch Instance**
   - AMI: Ubuntu Server 22.04 LTS (64-bit x86)
   - Instance type: `t3.large` (2 vCPU, 8 GB RAM — ~$0.08/hr)
   - Storage: 50 GB gp3
   - Key pair: create/select one for emergency admin access

2. **Security Group** — allow inbound:
   - SSH (TCP 22) from `0.0.0.0/0` (or restrict to Anote office IP)
   - HTTP (TCP 80) optional for web previews
   - Custom TCP 3000, 8000 optional for app ports

3. **User Data** — paste the contents of `cloud-init.yaml` into the *User data* field (Advanced Details section)

4. **Launch**, then note the public IP.

5. **Set the shared password** — SSH in with your key and run:
   ```bash
   sudo passwd anote
   # Enter the shared password when prompted
   ```

6. Share `ssh anote@<IP>` + password with the team.

### Option B — AWS CLI

```bash
aws ec2 run-instances \
  --image-id ami-0c7217cdde317cfec \
  --instance-type t3.large \
  --key-name <your-key-pair> \
  --security-group-ids <sg-id> \
  --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":50,"VolumeType":"gp3"}}]' \
  --user-data file://cloud-init.yaml \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=anote-dev-env}]'
```

Then set the password as in step 5 above.

## Keeping Repos Up to Date

From inside the EC2 instance:

```bash
/home/anote/update-repos.sh
```

This runs `git pull` on every repo.

## Repo Locations

| Repo | Path |
|---|---|
| anote-product | `/home/anote/repos/anote-product` |
| leaderboard | `/home/anote/repos/leaderboard` |
| synthetic-data | `/home/anote/repos/synthetic-data` |
| autonomous-intelligence | `/home/anote/repos/autonomous-intelligence` |
| community | `/home/anote/repos/community` |
| slackbot | `/home/anote/repos/slackbot` |
| privategpt | `/home/anote/repos/privategpt` |
| openanote | `/home/anote/repos/openanote` |
| ai-rfps | `/home/anote/repos/ai-rfps` |
| upreach | `/home/anote/repos/upreach` |
| ai-assisted-coding-tool | `/home/anote/repos/ai-assisted-coding-tool` |
| anote-ai-research-fellowship | `/home/anote/repos/anote-ai-research-fellowship` |

## Running a Specific Repo

Most repos have a `docker-compose.yml`. Example:

```bash
cd /home/anote/repos/anote-product
cp .env.example .env   # fill in API keys
docker compose up
```

See each repo's `CODEBASE_SETUP.md` for repo-specific instructions.

## Installed Tools

- Docker + Docker Compose
- Python 3.11 + pip + virtualenv
- Node 18 + npm
- Rust + cargo
- git, tmux, vim, htop

## Cost Estimate

| Resource | Cost |
|---|---|
| t3.large (on-demand) | ~$0.08/hr (~$58/mo) |
| 50 GB gp3 EBS | ~$4/mo |
| Data transfer (minimal) | ~$1/mo |
| **Total** | **~$63/mo** |

Stop the instance when not in use to save cost.
