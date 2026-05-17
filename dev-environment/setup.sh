#!/usr/bin/env bash
# Anote shared dev environment bootstrap script
# Run as root (or with sudo) on a fresh Ubuntu 22.04 instance
set -euo pipefail

GITHUB_ORG="anote-ai"
SHARED_USER="anote"
REPOS_DIR="/home/${SHARED_USER}/repos"

# ── System packages ──────────────────────────────────────────────────────────
echo "[1/7] Installing system packages..."
apt-get update -qq
apt-get install -y -qq \
  git curl wget unzip tmux vim htop \
  python3.11 python3.11-venv python3-pip \
  build-essential pkg-config libssl-dev \
  ca-certificates gnupg lsb-release

# ── Docker ───────────────────────────────────────────────────────────────────
echo "[2/7] Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable --now docker

# ── Node 18 ──────────────────────────────────────────────────────────────────
echo "[3/7] Installing Node 18..."
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y -qq nodejs

# ── Rust ─────────────────────────────────────────────────────────────────────
echo "[4/7] Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
export PATH="/root/.cargo/bin:$PATH"

# ── Create shared user ───────────────────────────────────────────────────────
echo "[5/7] Creating user '${SHARED_USER}'..."
if ! id "${SHARED_USER}" &>/dev/null; then
  useradd -m -s /bin/bash "${SHARED_USER}"
fi
usermod -aG docker "${SHARED_USER}"

# Copy Rust to user
mkdir -p "/home/${SHARED_USER}/.cargo"
cp -r /root/.cargo "/home/${SHARED_USER}/"
cp -r /root/.rustup "/home/${SHARED_USER}/.rustup" 2>/dev/null || true
chown -R "${SHARED_USER}:${SHARED_USER}" "/home/${SHARED_USER}/.cargo" "/home/${SHARED_USER}/.rustup" 2>/dev/null || true

# ── Enable password SSH auth ──────────────────────────────────────────────────
echo "[6/7] Enabling password SSH authentication..."
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#\?ChallengeResponseAuthentication.*/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# ── Clone all repos ───────────────────────────────────────────────────────────
echo "[7/7] Cloning Anote repos to ${REPOS_DIR}..."
mkdir -p "${REPOS_DIR}"
chown "${SHARED_USER}:${SHARED_USER}" "${REPOS_DIR}"

REPOS=(
  anote-product
  leaderboard
  synthetic-data
  autonomous-intelligence
  community
  slackbot
  privategpt
  openanote
  ai-rfps
  upreach
  ai-assisted-coding-tool
  anote-ai-research-fellowship
)

for repo in "${REPOS[@]}"; do
  dest="${REPOS_DIR}/${repo}"
  if [ -d "${dest}/.git" ]; then
    echo "  → ${repo}: already cloned, pulling latest"
    sudo -u "${SHARED_USER}" git -C "${dest}" pull --ff-only 2>/dev/null || true
  else
    echo "  → Cloning ${repo}..."
    # Try HTTPS (public repos); if private, a GitHub PAT in ~/.netrc is needed
    sudo -u "${SHARED_USER}" git clone \
      "https://github.com/${GITHUB_ORG}/${repo}.git" \
      "${dest}" 2>/dev/null || echo "    WARNING: could not clone ${repo} (may be private — add PAT)"
  fi
done

# ── Shell profile for shared user ────────────────────────────────────────────
cat >> "/home/${SHARED_USER}/.bashrc" << 'PROFILE'
export PATH="$HOME/.cargo/bin:$PATH"
export REPOS="$HOME/repos"
alias repos="cd $REPOS"
echo ""
echo "Welcome to the Anote shared dev environment!"
echo "All repos are in ~/repos/  — run 'repos' to navigate there."
echo "Run ~/update-repos.sh to pull latest changes."
echo ""
PROFILE
chown "${SHARED_USER}:${SHARED_USER}" "/home/${SHARED_USER}/.bashrc"

# Copy update script
cp "$(dirname "$0")/update-repos.sh" "/home/${SHARED_USER}/update-repos.sh"
chmod +x "/home/${SHARED_USER}/update-repos.sh"
chown "${SHARED_USER}:${SHARED_USER}" "/home/${SHARED_USER}/update-repos.sh"

echo ""
echo "====================================================="
echo " Setup complete!"
echo " Set the shared password: sudo passwd ${SHARED_USER}"
echo " Then share: ssh ${SHARED_USER}@$(curl -s ifconfig.me)"
echo "====================================================="
