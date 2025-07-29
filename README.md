# Dotfiles Repository README

This repository uses a **bare Git repository** to manage dotfiles. For details, see the [Dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

---

## 1. Setup

### Clone the Repository

Run the following command to clone your dotfiles repository as a bare Git repository:

```bash
git clone --bare <git-repo-url> $HOME/.dotfiles
```

Optional: Run the following command to ignore all files.

```bash
echo '*' >> $HOME/.dotfiles/info/exclude
```

### Configure `.bashrc`

Add the following to your `.bashrc` or `.zshrc`:

```bash
function .git {
   /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME "$@"
}
.git config --local status.showUntrackedFiles no
```

Reload the shell configuration:

```bash
source $HOME/.bashrc
```

### Checkout the Dotfiles

Run:

```bash
.git checkout
```

If there are conflicting files, back them up and retry:

```bash
mkdir -p .config-backup && \
.git checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

.git checkout
```

---

## 2. Installing Dotfiles on a New System

To set up your dotfiles on a new system, use this script:

```bash
git clone --bare <git-repo-url> $HOME/.dotfiles
echo '*' >> $HOME/.dotfiles/info/exclude
function .git {
   /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME "$@"
}
mkdir -p .config-backup
.git checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  .git checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | while read -r file; do
    mkdir -p "$(dirname ".config-backup/$file")"
    mv "$file" ".config-backup/$file"
  done
fi;
.git checkout
.git config --local status.showUntrackedFiles no
```

---

## 3. Usage

Use the `.git` alias to manage your configuration files:

- Check the repository status:

  ```bash
  .git status
  ```

- Add and commit files:

  ```bash
  .git add -f <file>
  .git commit -m "Your commit message"
  ```

- Push changes:

  ```bash
  .git push
  ```

For more details, see the [Dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles).
