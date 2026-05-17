# Adding CI/CD to an Anote Product Repo

Every product repo should have a GitHub Actions CI workflow that blocks bad code from merging to `main`. This doc explains how to add one in under 15 minutes.

---

## Why CI/CD Matters

Without CI, it's easy for a PR to accidentally break existing functionality — and nobody catches it until a customer reports a bug. With CI:

- Tests run automatically on every PR
- Broken tests block the merge button
- Code quality is consistent across contributors
- New fellows can contribute without worrying about accidentally breaking things

---

## Step 1: Check if CI Already Exists

```bash
ls .github/workflows/
```

If you see `ci.yml` or similar — CI is already set up. Read it to understand what it does, then move on.

If the folder doesn't exist, continue below.

---

## Step 2: Choose Your Template

From the fellowship repo's `codebase-setup/ci-cd-templates/`:

| Template | Use for |
|----------|---------|
| `python-ci.yml` | Python apps (FastAPI, Flask, scripts, etc.) |
| `node-ci.yml` | Node/React/Next.js apps |
| `pr-checks.yml` | PR quality gates (add this to any repo) |

---

## Step 3: Add the Workflow

```bash
# In your product repo (not the fellowship repo)
mkdir -p .github/workflows

# Copy the appropriate template
# Replace [path-to-fellowship-repo] with the actual path
cp [path-to-fellowship-repo]/codebase-setup/ci-cd-templates/python-ci.yml .github/workflows/ci.yml
cp [path-to-fellowship-repo]/codebase-setup/ci-cd-templates/pr-checks.yml .github/workflows/pr-checks.yml
```

---

## Step 4: Adapt the Template

Open `ci.yml` and check/update:

1. **Python/Node version** — match what the repo actually uses
2. **Test command** — does `pytest tests/` work? Or is it `pytest src/tests/`?
3. **Install command** — `pip install -r requirements.txt` or `pip install -e .` or `poetry install`?
4. **Environment variables** — add any required secrets to the `env:` block

For Python repos that use `pyproject.toml` instead of `requirements.txt`:

```yaml
- name: Install dependencies
  run: |
    pip install --upgrade pip
    pip install -e ".[dev]"   # adjust extras name as needed
```

For repos that use `poetry`:

```yaml
- name: Install Poetry
  run: pip install poetry

- name: Install dependencies
  run: poetry install
```

---

## Step 5: Add Secrets to GitHub

If your tests need API keys, add them as GitHub repository secrets:

1. Go to your repo on GitHub → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add `ANTHROPIC_API_KEY` and any other needed keys

**Do not hardcode API keys in the workflow file** — use `${{ secrets.SECRET_NAME }}`.

---

## Step 6: Make Tests Pass Locally First

Before pushing, confirm the test command works on your machine:

```bash
pytest tests/ -v      # Python
npm test              # Node
```

If there are no tests yet, that's your first PR after adding CI — add at least 2-3 basic tests for core functionality.

---

## Step 7: Commit and Push

```bash
git checkout -b your-name/add-ci
git add .github/
git commit -m "Add GitHub Actions CI workflow"
git push -u origin your-name/add-ci
# Open a PR — CI will run on your own PR immediately
```

---

## Step 8: Protect the Main Branch

After CI is running, ask Natan or the repo admin to enable branch protection:

- Go to repo Settings → Branches → Add rule
- Branch name pattern: `main`
- Check: "Require status checks to pass before merging"
- Select: the `test` and `lint` jobs from your workflow
- Check: "Require branches to be up to date before merging"

This makes CI mandatory — no bypassing with a direct push.

---

## Troubleshooting Common CI Failures

| Error | Fix |
|-------|-----|
| `ModuleNotFoundError` | Missing dependency in `requirements.txt` — add it |
| `No tests ran` | Test file path is wrong — check `pytest tests/` vs `pytest src/` |
| `ruff: command not found` | Add `pip install ruff` to the lint step |
| `Secret not found` | Add the secret in GitHub repo settings |
| `docker build failed` | Check the Dockerfile — run `docker build .` locally first |
| Tests pass locally but fail in CI | Environment difference — check Python version and dependency versions |

---

## After CI Is Green

Post in #product-standup: "Added CI to [repo name] — tests and lint now run on every PR. Branch protection enabled."

This is a meaningful product contribution for your record.
